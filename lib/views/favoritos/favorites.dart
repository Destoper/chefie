import 'package:chefie/controllers/favorite_recipe_controller.dart';
import 'package:chefie/theme/app_theme.dart';
import 'package:chefie/widgets/chefie_app_bar.dart';
import 'package:chefie/widgets/favorite_recipe_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
              return FavoriteRecipeCard(recipe: recipe);
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