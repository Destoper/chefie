import 'package:chefie/controllers/auth_controller.dart';
import 'package:chefie/controllers/category_controller.dart';
import 'package:chefie/controllers/global_ingredient_controller.dart';
import 'package:chefie/controllers/user_ingredient_controller.dart';
import 'package:chefie/models/category.dart';
import 'package:chefie/models/global_ingredient.dart';
import 'package:chefie/models/user_ingredient.dart';
import 'package:chefie/modelviews/unidades.dart';
import 'package:chefie/widgets/button.dart';
import 'package:chefie/widgets/chefie_app_bar.dart';
import 'package:chefie/widgets/chefie_search_bar.dart';
import 'package:chefie/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:chefie/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Modelo para armazenar ingrediente selecionado com quantidade/unidade
class SelectedIngredient {
  final GlobalIngredient ingredient;
  double quantity;
  String unit;

  SelectedIngredient({
    required this.ingredient,
    this.quantity = 1.0,
    this.unit = 'un',
  });
}

class AdicionarIngredientePage extends ConsumerStatefulWidget {
  const AdicionarIngredientePage({super.key});

  @override
  ConsumerState<AdicionarIngredientePage> createState() => _AdicionarIngredientePageState();
}

class _AdicionarIngredientePageState extends ConsumerState<AdicionarIngredientePage> {
  List<GlobalIngredient> _allIngredients = [];
  List<GlobalIngredient> _filteredIngredients = [];
  Map<String, SelectedIngredient> _selectedIngredients = {};
  Map<String, Category> _categoriesMap = {};
  bool _isLoading = false;
  bool _isSaving = false;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _loadIngredients();
  }

  Future<void> _loadIngredients() async {
    setState(() => _isLoading = true);
    
    try {
      final ingredients = await ref.read(globalIngredientControllerProvider.future);
      final categories = await ref.read(categoryControllerProvider.future);
      
      setState(() {
        _allIngredients = ingredients;
        _filteredIngredients = ingredients;
        _categoriesMap = {for (var c in categories) c.id: c};
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao carregar ingredientes: $e')),
        );
      }
    }
  }

  void _filterIngredients(String query) {
    setState(() {
      _searchQuery = query;
      if (query.isEmpty) {
        _filteredIngredients = _allIngredients;
      } else {
        _filteredIngredients = _allIngredients
            .where((i) => i.namePt.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _toggleSelection(GlobalIngredient ingredient) {
    setState(() {
      if (_selectedIngredients.containsKey(ingredient.id)) {
        _selectedIngredients.remove(ingredient.id);
      } else {
        _selectedIngredients[ingredient.id] = SelectedIngredient(ingredient: ingredient);
      }
    });
  }

  void _updateQuantity(String ingredientId, double quantity) {
    if (_selectedIngredients.containsKey(ingredientId)) {
      setState(() {
        _selectedIngredients[ingredientId]!.quantity = quantity;
      });
    }
  }

  void _updateUnit(String ingredientId, String unit) {
    if (_selectedIngredients.containsKey(ingredientId)) {
      setState(() {
        _selectedIngredients[ingredientId]!.unit = unit;
      });
    }
  }

  Future<void> _salvarIngredientes() async {
    if (_selectedIngredients.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Selecione pelo menos um ingrediente')),
      );
      return;
    }

    setState(() => _isSaving = true);

    try {
      final userId = ref.read(authControllerProvider).value?.id;

      if (userId == null) {
        throw Exception('Usuário não autenticado');
      }

      // Salva todos os ingredientes selecionados
      for (final selected in _selectedIngredients.values) {
        final ingredient = UserIngredient(
          id: '',
          userId: userId,
          globalIngredientId: selected.ingredient.id,
          quantity: selected.quantity,
          unit: selected.unit,
        );

        await ref.read(userIngredientControllerProvider.notifier)
            .addIngredient(ingredient);
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${_selectedIngredients.length} ingrediente(s) adicionado(s)!'),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.pop(context, true);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro ao adicionar: $e'),
            backgroundColor: AppColors.destructive,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isSaving = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: ChefieAppBar(title: "Busque um ingrediente"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ChefieSearchBar(
              hintText: "Busque um ingrediente",
              onChanged: _filterIngredients,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextLabel(text: "Ingredientes"),
                if (_selectedIngredients.isNotEmpty)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '${_selectedIngredients.length} selecionado(s)',
                      style: TextStyle(
                        color: AppColors.textDark,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : _filteredIngredients.isEmpty
                      ? Center(
                          child: Text(
                            _searchQuery.isEmpty
                                ? 'Nenhum ingrediente cadastrado'
                                : 'Nenhum ingrediente encontrado',
                            style: TextStyle(color: AppColors.textOf(context)),
                          ),
                        )
                      : ListView.builder(
                          itemCount: _filteredIngredients.length,
                          itemBuilder: (context, idx) {
                            final ingredient = _filteredIngredients[idx];
                            final isSelected = _selectedIngredients.containsKey(ingredient.id);
                            final category = ingredient.categoryId != null
                                ? _categoriesMap[ingredient.categoryId]
                                : null;

                            return ItemIngrediente(
                              ingredient: ingredient,
                              category: category,
                              isSelected: isSelected,
                              selectedData: _selectedIngredients[ingredient.id],
                              onTap: () => _toggleSelection(ingredient),
                              onQuantityChanged: (q) => _updateQuantity(ingredient.id, q),
                              onUnitChanged: (u) => _updateUnit(ingredient.id, u),
                            );
                          },
                        ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ButtonRounded(
          text: _isSaving ? "Salvando..." : "Salvar",
          onPressed: _isSaving ? () {} : _salvarIngredientes,
          borderWidth: 2.3,
          height: 60,
        ),
      ),
    );
  }
}

class ItemIngrediente extends StatelessWidget {
  final GlobalIngredient ingredient;
  final Category? category;
  final bool isSelected;
  final SelectedIngredient? selectedData;
  final VoidCallback onTap;
  final ValueChanged<double> onQuantityChanged;
  final ValueChanged<String> onUnitChanged;

  const ItemIngrediente({
    super.key,
    required this.ingredient,
    this.category,
    required this.isSelected,
    this.selectedData,
    required this.onTap,
    required this.onQuantityChanged,
    required this.onUnitChanged,
  });

  @override
  Widget build(BuildContext context) {
    final icon = category?.icon ?? '📦';
    final unidades = Unidade.getUnidades();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.borderOf(context),
            width: isSelected ? 2 : 1,
          ),
          color: isSelected
              ? AppColors.primary.withOpacity(0.1)
              : AppColors.surfaceOf(context),
        ),
        child: Column(
          children: [
            // Linha principal (sempre visível)
            GestureDetector(
              onTap: onTap,
              behavior: HitTestBehavior.opaque,
              child: Row(
                children: [
                  Text(icon, style: TextStyle(fontSize: 24)),
                  SizedBox(width: 15),
                  Expanded(
                    child: TextLabel(
                      text: ingredient.namePt,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  Icon(
                    isSelected ? Icons.check_circle : Icons.circle_outlined,
                    color: isSelected ? AppColors.primary : AppColors.textOf(context).withOpacity(0.3),
                  ),
                ],
              ),
            ),
            // Campos de quantidade/unidade (visíveis quando selecionado)
            if (isSelected) ...[
              SizedBox(height: 15),
              Row(
                children: [
                  // Campo quantidade
                  Expanded(
                    flex: 2,
                    child: TextField(
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        labelText: 'Quantidade',
                        filled: true,
                        fillColor: AppColors.backgroundOf(context),
                        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: AppColors.primary.withOpacity(0.3)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: AppColors.primary),
                        ),
                      ),
                      controller: TextEditingController(
                        text: selectedData?.quantity.toString() ?? '1',
                      ),
                      onChanged: (value) {
                        final parsed = double.tryParse(value);
                        if (parsed != null && parsed > 0) {
                          onQuantityChanged(parsed);
                        }
                      },
                    ),
                  ),
                  SizedBox(width: 12),
                  // Dropdown unidade
                  Expanded(
                    flex: 2,
                    child: DropdownButtonFormField<String>(
                      value: selectedData?.unit ?? 'un',
                      decoration: InputDecoration(
                        labelText: 'Unidade',
                        filled: true,
                        fillColor: AppColors.backgroundOf(context),
                        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: AppColors.primary.withOpacity(0.3)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: AppColors.primary),
                        ),
                      ),
                      items: unidades.map((u) => DropdownMenuItem(
                        value: u.name,
                        child: Text(u.name),
                      )).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          onUnitChanged(value);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}