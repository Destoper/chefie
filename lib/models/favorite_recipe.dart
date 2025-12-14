import 'package:freezed_annotation/freezed_annotation.dart';
import 'recipe_details.dart';

part 'favorite_recipe.freezed.dart';
part 'favorite_recipe.g.dart';

@freezed
sealed class FavoriteRecipe with _$FavoriteRecipe {
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
    DateTime? createdAt,
    String? notes,
    int? rating,
    DateTime? lastCookedAt,
  }) = _FavoriteRecipe;

  factory FavoriteRecipe.fromJson(Map<String, dynamic> json) =>
      _$FavoriteRecipeFromJson({
        ...json,
        'userId': json['user_id'],
        'apiId': json['api_id'],
        'imageUrl': json['image_url'],
        'readyInMinutes': json['ready_in_minutes'] ?? 0,
        'createdAt': json['created_at'],
        'lastCookedAt': json['last_cooked_at'],
      });

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
        ingredients: recipe.extendedIngredients
            .map((ing) => ing.original)
            .toList(),
        createdAt: DateTime.now(),
      );
}