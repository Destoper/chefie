import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_details.freezed.dart';

@freezed
abstract class RecipeDetails with _$RecipeDetails {
  const factory RecipeDetails({
    required int id,
    required String title,
    String? image,
    @Default(0) int readyInMinutes,
    @Default(0) int servings,
    String? instructions,
    @Default([]) List<String> ingredients,
  }) = _RecipeDetails;

  factory RecipeDetails.fromJson(Map<String, dynamic> json) {
    // Extrair ingredientes da resposta da API
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
