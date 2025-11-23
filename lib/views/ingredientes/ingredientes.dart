import 'package:chefie/controllers/auth_controller.dart';
import 'package:chefie/controllers/category_controller.dart';
import 'package:chefie/controllers/user_ingredient_controller.dart';
import 'package:chefie/models/category.dart';
import 'package:chefie/models/user_ingredient.dart';
import 'package:chefie/modelviews/unidades.dart';
import 'package:chefie/theme/app_theme.dart';
import 'package:chefie/views/ingredientes/adicionar_ingrediente.dart';
import 'package:chefie/widgets/button.dart';
import 'package:chefie/widgets/chefie_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IngredientesPage extends ConsumerStatefulWidget {
  const IngredientesPage({super.key});

  @override
  ConsumerState<IngredientesPage> createState() => _IngredientesPageState();
}

class _IngredientesPageState extends ConsumerState<IngredientesPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  bool _isUpdating = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _atualizarIngrediente(UserIngredient updated) async {
    setState(() => _isUpdating = true);

    try {
      final userId = ref.read(authControllerProvider).value?.id;

      if (userId == null) throw Exception('Usuário não autenticado');

      final ingredientToUpdate = updated.copyWith(userId: userId);
      await ref.read(userIngredientControllerProvider.notifier).updateIngredient(ingredientToUpdate);
      ref.invalidate(userIngredientControllerProvider);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Ingrediente atualizado com sucesso'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro ao atualizar: $e'),
            backgroundColor: AppColors.destructive,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isUpdating = false);
    }
  }

  Future<void> _deleteIngrediente(UserIngredient ingrediente) async {
    final nome = ingrediente.globalIngredient?.namePt ?? 'este ingrediente';
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Remover ingrediente'),
        content: Text('Deseja remover "$nome"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text('Remover', style: TextStyle(color: AppColors.destructive)),
          ),
        ],
      ),
    );

    if (confirm == true) {
      await ref.read(userIngredientControllerProvider.notifier).removeIngredient(ingrediente.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    final ingredientesAsync = ref.watch(userIngredientControllerProvider);
    final categoriasAsync = ref.watch(categoryControllerProvider);

    return Scaffold(
      backgroundColor: AppColors.backgroundOf(context),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: ChefieAppBar(title: 'Meus ingredientes'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SearchBar(
              controller: _searchController,
              hintText: 'Buscar em meus ingredientes...',
              padding: WidgetStateProperty.all(EdgeInsets.only(left: 20, right: 20)),
              elevation: WidgetStateProperty.all(0.0),
              backgroundColor: WidgetStateProperty.all(AppColors.surfaceOf(context)),
              leading: Icon(Icons.search, color: AppColors.textOf(context)),
              textStyle: WidgetStateProperty.all(
                TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
              ),
              onChanged: (value) => setState(() => _searchQuery = value.toLowerCase()),
            ),
          ),
          Expanded(
            child: ingredientesAsync.when(
              loading: () => Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error_outline, size: 48, color: AppColors.destructive),
                    SizedBox(height: 16),
                    Text(
                      'Erro ao carregar ingredientes',
                      style: TextStyle(color: AppColors.textOf(context)),
                    ),
                    TextButton(
                      onPressed: () => ref.invalidate(userIngredientControllerProvider),
                      child: Text('Tentar novamente'),
                    ),
                  ],
                ),
              ),
              data: (ingredientes) {
                final categoriasMap = <String, Category>{};
                categoriasAsync.whenData((cats) {
                  for (final c in cats) {
                    categoriasMap[c.id] = c;
                  }
                });

                final filtered = ingredientes
                    .where((i) => (i.globalIngredient?.namePt ?? '')
                        .toLowerCase()
                        .contains(_searchQuery))
                    .toList();

                if (filtered.isEmpty) {
                  return Center(
                    child: Text(
                      _searchQuery.isEmpty
                          ? 'Nenhum ingrediente cadastrado'
                          : 'Nenhum ingrediente encontrado',
                      style: TextStyle(color: AppColors.textOf(context)),
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: filtered.length,
                  itemBuilder: (context, idx) {
                    final ingrediente = filtered[idx];
                    final categoryId = ingrediente.globalIngredient?.categoryId;
                    final categoria = categoryId != null ? categoriasMap[categoryId] : null;

                    return ItemIngrediente(
                      ingrediente: ingrediente,
                      categoria: categoria,
                      onEdit: (updated) async => await _atualizarIngrediente(updated),
                      onDelete: () => _deleteIngrediente(ingrediente),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push<bool>(
            context,
            MaterialPageRoute(builder: (c) => AdicionarIngredientePage()),
          );
          if (result == true) ref.invalidate(userIngredientControllerProvider);
        },
        shape: CircleBorder(),
        backgroundColor: AppColors.primary,
        tooltip: 'Adicionar ingrediente',
        child: Icon(Icons.add, color: AppColors.textDark),
      ),
    );
  }
}

class ItemIngrediente extends StatefulWidget {
  final UserIngredient ingrediente;
  final Category? categoria;
  final Future<void> Function(UserIngredient) onEdit;
  final VoidCallback onDelete;

  const ItemIngrediente({
    super.key,
    required this.ingrediente,
    this.categoria,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  State<ItemIngrediente> createState() => _ItemIngredienteState();
}

class _ItemIngredienteState extends State<ItemIngrediente> {
  bool editing = false;
  late TextEditingController _quantityController;
  late String _selectedUnit;

  @override
  void initState() {
    super.initState();
    _quantityController = TextEditingController(
      text: widget.ingrediente.quantity.toString(),
    );
    _selectedUnit = widget.ingrediente.unit;
  }

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final nome = widget.ingrediente.globalIngredient?.namePt ?? 'Ingrediente';
    final icon = widget.categoria?.icon ?? '...';
    final unidades = Unidade.getUnidades();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.borderOf(context), width: 1),
          color: AppColors.surfaceOf(context),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.primary.withValues(alpha: 0.3),
                  ),
                  child: Center(
                    child: Text(
                      icon,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nome,
                        style: TextStyle(
                          color: AppColors.textOf(context),
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "${widget.ingrediente.quantity} ${widget.ingrediente.unit}",
                        style: TextStyle(
                          color: AppColors.textOf(context),
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.mode_edit_outline_outlined,
                        color: AppColors.textOf(context),
                      ),
                      onPressed: () {
                        setState(() {
                          editing = !editing;
                          // Reset controllers when entering edit mode
                          _quantityController.text = widget.ingrediente.quantity.toString();
                          _selectedUnit = widget.ingrediente.unit;
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.delete_outline_outlined,
                        color: AppColors.destructive,
                      ),
                      onPressed: widget.onDelete,
                    ),
                  ],
                ),
              ],
            ),
            if (editing) ...[
              SizedBox(height: 15),
              Column(
                children: [
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
                              borderSide: BorderSide(
                                color: AppColors.primary.withValues(alpha: 0.3),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: AppColors.primary),
                            ),
                          ),
                          controller: _quantityController,
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          initialValue: _selectedUnit,
                          decoration: InputDecoration(
                            labelText: 'Unidade',
                            filled: true,
                            fillColor: AppColors.backgroundOf(context),
                            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: AppColors.primary.withValues(alpha: 0.3),
                              ),
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
                          onChanged: (v) {
                            if (v != null) setState(() => _selectedUnit = v);
                          },
                        ),
                      ),
                    ],
                  ),
                  // Unidade + salvar
                  SizedBox(height: 8),
                  ButtonRounded(
                    text: 'Salvar',
                    onPressed: () async {
                      final parsed = double.tryParse(_quantityController.text);
                      if (parsed == null || parsed <= 0) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Quantidade inválida')),
                        );
                        return;
                      }
                                    
                      final updated = widget.ingrediente.copyWith(
                        quantity: parsed,
                        unit: _selectedUnit,
                      );
                                    
                      await widget.onEdit(updated);
                      setState(() => editing = false);
                    },
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