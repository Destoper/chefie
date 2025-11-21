import 'package:freezed_annotation/freezed_annotation.dart';
import 'recipe_details.dart';

part 'favorite_recipe.freezed.dart';
part 'favorite_recipe.g.dart';

@freezed
abstract class FavoriteRecipe with _$FavoriteRecipe {
  const factory FavoriteRecipe({
    required String id,
    required String userId,
    required int apiId,
    required String title,
    String? imageUrl,
    @Default(0) int readyInMinutes,
    @Default(0) int servings,
    String? instructions,
    @Default([]) List<String> ingredients,
    required DateTime createdAt,
  }) = _FavoriteRecipe;

  factory FavoriteRecipe.fromJson(Map<String, dynamic> json) =>
      _$FavoriteRecipeFromJson(json);

  // Criar a partir de RecipeDetails
  factory FavoriteRecipe.fromRecipeDetails({
    required String userId,
    required RecipeDetails recipe,
  }) =>
      FavoriteRecipe(
        id: '',
        userId: userId,
        apiId: recipe.id,
        title: recipe.title,
        imageUrl: recipe.image,
        readyInMinutes: recipe.readyInMinutes,
        servings: recipe.servings,
        instructions: recipe.instructions,
        ingredients: recipe.ingredients,
        createdAt: DateTime.now(),
      );
}
