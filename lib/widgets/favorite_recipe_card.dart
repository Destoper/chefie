import 'package:chefie/models/favorite_recipe.dart';
import 'package:chefie/models/recipe_details.dart';
import 'package:chefie/theme/app_theme.dart';
import 'package:chefie/views/receitas/receita_details.dart';
import 'package:chefie/widgets/edit_recipe_sheet.dart'; 
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class FavoriteRecipeCard extends ConsumerWidget {
  final FavoriteRecipe recipe;

  const FavoriteRecipeCard({super.key, required this.recipe});

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
        child: Container(
          constraints: const BoxConstraints(maxHeight: 150),
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
                          IconButton(
                            icon: Icon(Icons.edit_note, color: AppColors.primary, size: 22),
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            onPressed: () => _showEditDialog(context),
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
      MaterialPageRoute(
        builder: (context) => ReceitaDetailsPage(receita: detailsAdapter, enableCheckboxes: false),
      ),
    );
  }

  void _showEditDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, 
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      backgroundColor: AppColors.surfaceOf(context),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: EditRecipeSheet(recipe: recipe),
      ),
    );
  }
}