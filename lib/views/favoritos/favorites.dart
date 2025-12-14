import 'package:chefie/controllers/favorite_recipe_controller.dart';
import 'package:chefie/models/favorite_recipe.dart';
import 'package:chefie/models/recipe_details.dart';
import 'package:chefie/theme/app_theme.dart';
import 'package:chefie/views/receitas/receita_details.dart';
import 'package:chefie/widgets/chefie_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart'; 

class FavoritosPage extends ConsumerWidget {
  const FavoritosPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesAsync = ref.watch(favoriteControllerProvider);

    return Scaffold(
      backgroundColor: AppColors.backgroundOf(context),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: ChefieAppBar(title: "Meus Favoritos"),
      ),
      body: favoritesAsync.when(
        data: (favorites) {
          if (favorites.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 64,
                    color: AppColors.textSecondaryOf(context).withValues(alpha: 0.5),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Nenhuma receita favorita ainda.",
                    style: TextStyle(
                      color: AppColors.textSecondaryOf(context),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: favorites.length,
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              final recipe = favorites[index];
              return _FavoriteCard(recipe: recipe);
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Text(
            "Erro ao carregar favoritos.",
            style: TextStyle(color: AppColors.destructive),
          ),
        ),
      ),
    );
  }
}

class _FavoriteCard extends ConsumerWidget {
  final FavoriteRecipe recipe;

  const _FavoriteCard({required this.recipe});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lastCookedText = recipe.lastCookedAt != null
        ? DateFormat('dd/MM/yy').format(recipe.lastCookedAt!)
        : 'Nunca';

    return GestureDetector(
      onTap: () => _navigateToDetails(context),
      child: Container(
        constraints: const BoxConstraints(minHeight: 120),
        decoration: BoxDecoration(
          color: AppColors.surfaceOf(context),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.borderOf(context)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.horizontal(left: Radius.circular(15)),
                child: SizedBox(
                  width: 110,
                  child: recipe.imageUrl != null && recipe.imageUrl!.isNotEmpty
                      ? Image.network(
                          'https://images.weserv.nl/?url=${Uri.encodeComponent(recipe.imageUrl!)}',
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => _buildPlaceholder(),
                        )
                      : _buildPlaceholder(),
                ),
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 10, 4, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Título
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              recipe.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textOf(context),
                              ),
                            ),
                          ),
                          // Botão de Editar (Notes/Rating)
                          IconButton(
                            icon: Icon(Icons.edit_note, color: AppColors.primary, size: 22),
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            onPressed: () => _showEditDialog(context, ref),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),

                      Row(
                        children: [
                          _iconText(Icons.access_time, "${recipe.readyInMinutes} min", context),
                          const SizedBox(width: 12),
                          _iconText(Icons.people_alt_outlined, "${recipe.servings} p.", context),
                        ],
                      ),
                      const SizedBox(height: 8),

                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        decoration: BoxDecoration(
                          color: AppColors.backgroundOf(context),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (recipe.rating != null && recipe.rating! > 0) ...[
                              Icon(Icons.star, size: 14, color: Colors.amber),
                              const SizedBox(width: 4),
                              Text(
                                "${recipe.rating}",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.textOf(context)),
                              ),
                              const SizedBox(width: 8, child: VerticalDivider(width: 8)),
                            ],
                            
                            Icon(Icons.history, size: 14, color: AppColors.textSecondaryOf(context)),
                            const SizedBox(width: 4),
                            Text(
                              "Feito: $lastCookedText",
                              style: TextStyle(
                                fontSize: 11,
                                color: AppColors.textSecondaryOf(context),
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      if (recipe.notes != null && recipe.notes!.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Row(
                            children: [
                              Icon(Icons.sticky_note_2_outlined, size: 12, color: AppColors.textSecondaryOf(context)),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  recipe.notes!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontStyle: FontStyle.italic,
                                    color: AppColors.textSecondaryOf(context),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      color: AppColors.primary.withValues(alpha: 0.1),
      child: const Icon(Icons.restaurant, color: AppColors.primary),
    );
  }

  Widget _iconText(IconData icon, String text, BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 14, color: AppColors.textSecondaryOf(context)),
        const SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.textSecondaryOf(context),
          ),
        ),
      ],
    );
  }

  void _navigateToDetails(BuildContext context) {
    final detailsAdapter = RecipeDetails(
      id: recipe.apiId,
      title: recipe.title,
      image: recipe.imageUrl,
      readyInMinutes: recipe.readyInMinutes,
      servings: recipe.servings,
      instructions: recipe.instructions,
      extendedIngredients: recipe.ingredients
          .map((ingName) => ExtendedIngredient(id: 0, name: ingName, original: ingName))
          .toList(),
    );

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ReceitaDetailsPage(receita: detailsAdapter, enableCheckboxes: false)),
    );
  }


  void _showEditDialog(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, 
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      backgroundColor: AppColors.surfaceOf(context),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: _EditRecipeSheet(recipe: recipe),
      ),
    );
  }
}

class _EditRecipeSheet extends ConsumerStatefulWidget {
  final FavoriteRecipe recipe;

  const _EditRecipeSheet({required this.recipe});

  @override
  ConsumerState<_EditRecipeSheet> createState() => _EditRecipeSheetState();
}

class _EditRecipeSheetState extends ConsumerState<_EditRecipeSheet> {
  late TextEditingController _notesController;
  int? _rating;
  DateTime? _lastCooked;

  @override
  void initState() {
    super.initState();
    _notesController = TextEditingController(text: widget.recipe.notes);
    _rating = widget.recipe.rating;
    _lastCooked = widget.recipe.lastCookedAt;
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Minhas Anotações",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textOf(context),
            ),
          ),
          const SizedBox(height: 20),
          
          Text("Avaliação", style: TextStyle(color: AppColors.textSecondaryOf(context), fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(5, (index) {
              return IconButton(
                onPressed: () => setState(() => _rating = index + 1),
                icon: Icon(
                  index < (_rating ?? 0) ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                  size: 32,
                ),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              );
            }),
          ),
          const SizedBox(height: 20),

          Text("Último Preparo", style: TextStyle(color: AppColors.textSecondaryOf(context), fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          InkWell(
            onTap: () async {
              final picked = await showDatePicker(
                context: context,
                initialDate: _lastCooked ?? DateTime.now(),
                firstDate: DateTime(2020),
                lastDate: DateTime.now(),
              );
              if (picked != null) setState(() => _lastCooked = picked);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.borderOf(context)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Icon(Icons.calendar_today, size: 18, color: AppColors.primary),
                  const SizedBox(width: 10),
                  Text(
                    _lastCooked != null
                        ? DateFormat('dd ' 'MMMM' ' yyyy', 'pt_BR').format(_lastCooked!)
                        : "Marcar data de hoje",
                    style: TextStyle(color: AppColors.textOf(context)),
                  ),
                  if (_lastCooked == null) ...[
                    const Spacer(),
                    TextButton(
                      onPressed: () => setState(() => _lastCooked = DateTime.now()),
                      child: const Text("Hoje"),
                    )
                  ]
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          Text("Notas Pessoais", style: TextStyle(color: AppColors.textSecondaryOf(context), fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          TextField(
            controller: _notesController,
            maxLines: 3,
            decoration: InputDecoration(
              hintText: "Dicas, substituições ou observações...",
              hintStyle: TextStyle(color: AppColors.textSecondaryOf(context).withValues(alpha: 0.5)),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              filled: true,
              fillColor: AppColors.backgroundOf(context),
            ),
          ),
          const SizedBox(height: 24),

          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () async {
                await ref.read(favoriteControllerProvider.notifier).updateFavorite(
                  id: widget.recipe.id,
                  notes: _notesController.text,
                  rating: _rating,
                  lastCookedAt: _lastCooked,
                );
                if (context.mounted) Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text("Salvar Alterações", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}