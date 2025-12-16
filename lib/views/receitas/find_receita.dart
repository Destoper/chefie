import 'package:chefie/controllers/recipe_controller.dart';
import 'package:chefie/controllers/user_ingredient_controller.dart';
import 'package:chefie/models/recipe_api.dart';
import 'package:chefie/theme/app_theme.dart';
import 'package:chefie/views/receitas/receita_details.dart';
import 'package:chefie/widgets/search_sheet.dart';
import 'package:chefie/widgets/chefie_app_bar.dart';
import 'package:chefie/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FindReceitaPage extends ConsumerStatefulWidget {
  const FindReceitaPage({super.key});

  @override
  ConsumerState<FindReceitaPage> createState() => _FindReceitaPageState();
}

class _FindReceitaPageState extends ConsumerState<FindReceitaPage> {
  String _sortBy = 'match'; 
  bool _isInitialLoad = true;
  
  List<String>? _activeSearchIngredients;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeSearch();
    });
  }

  Future<void> _initializeSearch() async {
    final ingredientsAsync = ref.read(userIngredientControllerProvider);
    
    ingredientsAsync.whenData((ingredients) {
      if (ingredients.isEmpty) {
        setState(() => _isInitialLoad = false);
        return;
      }

      final allIngredients = ingredients
          .where((i) => i.globalIngredient?.nameEn != null)
          .map((i) => i.globalIngredient!.nameEn)
          .toList();

      if (allIngredients.isNotEmpty) {
        setState(() {
          _activeSearchIngredients = allIngredients;
        });
        ref.read(recipeControllerProvider.notifier)
            .searchRecipes(allIngredients);
      }
      
      setState(() => _isInitialLoad = false);
    });
  }

  void _updateSearch(List<String> ingredientsToSearch) {
    setState(() {
      _activeSearchIngredients = ingredientsToSearch;
    });
    ref.read(recipeControllerProvider.notifier).searchRecipes(ingredientsToSearch);
  }

  void _openAdvancedSearch() async {
    if (_activeSearchIngredients == null) return;

    final result = await showModalBottomSheet<List<String>>(
      context: context,
      isScrollControlled: true, 
      backgroundColor: Colors.transparent,
      builder: (context) => SearchSheet(
        initiallySelectedIngredients: _activeSearchIngredients!,
      ),
    );

    if (result != null) {
      _updateSearch(result);
    }
  }

  List<RecipeApi> _sortRecipes(List<RecipeApi> recipes) {
    final sorted = List<RecipeApi>.from(recipes);
    if (_sortBy == 'match') {
      sorted.sort((a, b) => b.matchPercentage.compareTo(a.matchPercentage));
    }
    return sorted;
  }

  @override
  Widget build(BuildContext context) {
    final recipesAsync = ref.watch(recipeControllerProvider);
    final userIngredientsAsync = ref.watch(userIngredientControllerProvider);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: const ChefieAppBar(title: "Buscar receitas"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openAdvancedSearch,
        backgroundColor: AppColors.primary,
        shape: const CircleBorder(),
        child: Icon(Icons.search, color: AppColors.backgroundOf(context)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            recipesAsync.when(
              loading: () => TextLabel(
                text: "Buscando receitas...",
                fontSize: 18,
                fontWeight: FontWeight.w300,
                color: AppColors.textOf(context),
              ),
              error: (e, _) => TextLabel(
                text: "Erro ao buscar receitas",
                fontSize: 18,
                fontWeight: FontWeight.w300,
                color: AppColors.destructive,
              ),
              data: (recipes) => TextLabel(
                text: "${recipes.length} receitas encontradas",
                fontSize: 18,
                fontWeight: FontWeight.w300,
                color: AppColors.textOf(context),
              ),
            ),
            
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(vertical: 6),
                children: [
                  FilterOption(
                    text: "Match %",
                    selected: _sortBy == 'match',
                    onTap: () => setState(() => _sortBy = 'match'),
                  ),
                ],
              ),
            ),
            
            Expanded(
              child: _buildRecipeGrid(recipesAsync, userIngredientsAsync),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecipeGrid(
    AsyncValue<List<RecipeApi>> recipesAsync,
    AsyncValue userIngredientsAsync,
  ) {
    return userIngredientsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 48, color: AppColors.destructive),
            const SizedBox(height: 16),
            const Text('Erro ao carregar ingredientes'),
          ],
        ),
      ),
      data: (ingredients) {
        if (ingredients.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.kitchen_outlined, size: 64, color: AppColors.textOf(context).withValues(alpha: 0.4)),
                const SizedBox(height: 16),
                Text(
                  'Adicione ingredientes para\nencontrar receitas!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.textOf(context).withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          );
        }

        return recipesAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline, size: 48, color: AppColors.destructive),
                const SizedBox(height: 16),
                Text('Erro: ${e.toString()}'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _initializeSearch,
                  child: const Text('Tentar novamente'),
                ),
              ],
            ),
          ),
          data: (recipes) {
            if (recipes.isEmpty && !_isInitialLoad) {
              return Center(
                child: Text(
                  'Nenhuma receita encontrada para os ingredientes selecionados.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.textOf(context)),
                ),
              );
            }

            final sortedRecipes = _sortRecipes(recipes);

            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 15,
                childAspectRatio: 3 / 5,
              ),
              itemCount: sortedRecipes.length,
              itemBuilder: (context, idx) => RecipePreviewCard(
                recipe: sortedRecipes[idx],
                onTap: () => _openRecipeDetails(sortedRecipes[idx]),
              ),
            );
          },
        );
      },
    );
  }

  void _openRecipeDetails(RecipeApi recipe) async {
    try {
      final details = await ref.read(
        recipeDetailsProvider(recipeId: recipe.id).future,
      );
      
      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ReceitaDetailsPage(
              receita: details,
              usedIngredients: recipe.usedIngredients.map((i) => i.name.toLowerCase()).toSet(),
            ),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao carregar receita: $e')),
        );
      }
    }
  }
}

class RecipePreviewCard extends StatelessWidget {
  final RecipeApi recipe;
  final VoidCallback onTap;

  const RecipePreviewCard({
    super.key,
    required this.recipe,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.surfaceOf(context),
          border: Border.all(color: AppColors.borderOf(context)),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Expanded(
              flex: 3,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  recipe.image.isNotEmpty
                      ? Image.network(
                          'https://images.weserv.nl/?url=${Uri.encodeComponent(recipe.image)}',
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Container(
                            color: AppColors.primary.withValues(alpha: 0.3),
                            child: const Icon(Icons.restaurant, size: 40),
                          ),
                        )
                      : Container(
                          color: AppColors.primary.withValues(alpha: 0.3),
                          child: const Icon(Icons.restaurant, size: 40),
                        ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: _getMatchColor(recipe.matchPercentage),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '${recipe.matchPercentage.toStringAsFixed(0)}%',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recipe.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: AppColors.textOf(context),
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        const Icon(
                          Icons.check_circle_outline,
                          size: 16,
                          color: Colors.green,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${recipe.usedIngredientCount} tem',
                          style: const TextStyle(fontSize: 12, color: Colors.green),
                        ),
                        const SizedBox(width: 12),
                        Icon(
                          Icons.cancel_outlined,
                          size: 16,
                          color: AppColors.destructive,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${recipe.missedIngredientCount} falta',
                          style: TextStyle(fontSize: 12, color: AppColors.destructive),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getMatchColor(double percentage) {
    if (percentage >= 80) return Colors.green;
    if (percentage >= 50) return Colors.orange;
    return Colors.red;
  }
}

class FilterOption extends StatelessWidget {
  const FilterOption({
    super.key,
    required this.text,
    this.icon,
    required this.selected,
    required this.onTap,
  });

  final String text;
  final IconData? icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(45),
          color: !selected
              ? AppColors.borderOf(context)
              : AppColors.primary.withValues(alpha: 0.2),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null)
              Row(
                children: [
                  Icon(
                    icon,
                    size: 20,
                    color: !selected ? AppColors.textOf(context) : AppColors.primary,
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            Text(
              text,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: !selected ? AppColors.textOf(context) : AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}