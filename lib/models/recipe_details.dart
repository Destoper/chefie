import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_details.freezed.dart';
part 'recipe_details.g.dart';

@freezed
sealed class RecipeDetails with _$RecipeDetails {
  const factory RecipeDetails({
    required int id,
    required String title,
    String? image,
    @Default(0) int readyInMinutes,
    @Default(0) int servings,
    String? instructions,
    @Default([]) List<String> ingredients,
  }) = _RecipeDetails;

  factory RecipeDetails.fromJson(Map<String, dynamic> json) =>
      _$RecipeDetailsFromJson(json);

  // Factory customizado para parsear resposta da API Spoonacular
  factory RecipeDetails.fromApiJson(Map<String, dynamic> json) {
    List<String> ingredientsList = [];
    if (json['extendedIngredients'] != null) {
      ingredientsList = (json['extendedIngredients'] as List)
          .map((ing) => ing['original'] as String)
          .toList();
    }

    return RecipeDetails(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      readyInMinutes: json['readyInMinutes'] ?? 0,
      servings: json['servings'] ?? 0,
      instructions: json['instructions'],
      ingredients: ingredientsList,
    );
  }
}