import 'package:chefie/controllers/category_controller.dart';
import 'package:chefie/controllers/user_ingredient_controller.dart';
import 'package:chefie/models/category.dart';
import 'package:chefie/models/user_ingredient.dart';
import 'package:chefie/theme/app_theme.dart';
import 'package:chefie/views/ingredientes/adicionar_ingrediente.dart';
import 'package:chefie/widgets/chefie_app_bar.dart';
import 'package:chefie/widgets/chefie_search_bar.dart';
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

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Observa o estado dos ingredientes e categorias via Riverpod
    final ingredientesAsync = ref.watch(userIngredientControllerProvider);
    final categoriasAsync = ref.watch(categoryControllerProvider);

    return Scaffold(
      backgroundColor: AppColors.backgroundOf(context),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: ChefieAppBar(title: "Meus ingredientes"),
      ),
      body: Column(
        children: [
          // SearchBar
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SearchBar(
              controller: _searchController,
              hintText: "Buscar em meus ingredientes...",
              padding: WidgetStateProperty.all(EdgeInsets.only(left: 20, right: 20)),
              elevation: WidgetStateProperty.all(0.0),
              backgroundColor: WidgetStateProperty.all(AppColors.surfaceOf(context)),
              leading: Icon(Icons.search, color: AppColors.textOf(context)),
              textStyle: WidgetStateProperty.all(
                TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
              ),
              onChanged: (value) {
                setState(() => _searchQuery = value.toLowerCase());
              },
            ),
          ),
          
          // Lista de ingredientes com estados de loading/error/data
          Expanded(
            child: ingredientesAsync.when(
              loading: () => Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error_outline, size: 48, color: AppColors.destructive),
                    SizedBox(height: 16),
                    Text('Erro ao carregar ingredientes', 
                      style: TextStyle(color: AppColors.textOf(context))),
                    TextButton(
                      onPressed: () => ref.invalidate(userIngredientControllerProvider),
                      child: Text('Tentar novamente'),
                    ),
                  ],
                ),
              ),
              data: (ingredientes) {
                // Monta mapa de categorias pelo ID
                final categoriasMap = <String, Category>{};
                categoriasAsync.whenData((categorias) {
                  for (final cat in categorias) {
                    categoriasMap[cat.id] = cat;
                  }
                });

                // Filtra ingredientes pela busca
                final filtered = ingredientes.where((i) => 
                  (i.globalIngredient?.namePt ?? '').toLowerCase().contains(_searchQuery)
                ).toList();

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
                      onEdit: () => _editIngrediente(ingrediente),
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
            MaterialPageRoute(builder: (context) => AdicionarIngredientePage()),
          );
          // Atualiza a lista se um ingrediente foi adicionado
          if (result == true) {
            ref.invalidate(userIngredientControllerProvider);
          }
        },
        shape: CircleBorder(),
        backgroundColor: AppColors.primary,
        tooltip: "Adicionar ingrediente",
        child: Icon(Icons.add, color: AppColors.textDark),
      ),
    );
  }

  void _editIngrediente(UserIngredient ingrediente) {
    // Navegar para tela de edição
    // Navigator.push(context, MaterialPageRoute(
    //   builder: (context) => EditarIngredientePage(ingrediente: ingrediente),
    // ));
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
      await ref.read(userIngredientControllerProvider.notifier)
          .removeIngredient(ingrediente.id);
    }
  }
}

class ItemIngrediente extends StatelessWidget {
  final UserIngredient ingrediente;
  final Category? categoria;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const ItemIngrediente({
    super.key,
    required this.ingrediente,
    this.categoria,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final nome = ingrediente.globalIngredient?.namePt ?? 'Ingrediente';
    final icon = categoria?.icon ?? '📦';
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.borderOf(context), width: 1),
          color: AppColors.surfaceOf(context),
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.primary.withOpacity(0.2),
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
                    "${ingrediente.quantity} ${ingrediente.unit}",
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
                  icon: Icon(Icons.mode_edit_outline_outlined, 
                    color: AppColors.textOf(context)),
                  onPressed: onEdit,
                ),
                IconButton(
                  icon: Icon(Icons.delete_outline_outlined, 
                    color: AppColors.destructive),
                  onPressed: onDelete,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}