import 'recipe_details.dart';

class FavoriteRecipe {
  final String? id;
  final int apiId;
  final String title;
  final String? image;
  final int preparationTime;
  final int servings;
  final String? instructions;
  final List<String> ingredients;
  final DateTime createdAt;

  FavoriteRecipe({
    this.id,
    required this.apiId,
    required this.title,
    this.image,
    required this.preparationTime,
    required this.servings,
    this.instructions,
    required this.ingredients,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory FavoriteRecipe.fromJson(Map<String, dynamic> json) {
    return FavoriteRecipe(
      id: json['id'],
      apiId: json['api_id'],
      title: json['title'],
      image: json['image'],
      preparationTime: json['preparation_time'] ?? 0,
      servings: json['servings'] ?? 0,
      instructions: json['instructions'],
      ingredients: List<String>.from(json['ingredients'] ?? []),
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'api_id': apiId,
      'title': title,
      'image': image,
      'preparation_time': preparationTime,
      'servings': servings,
      'instructions': instructions,
      'ingredients': ingredients,
      'created_at': createdAt.toIso8601String(),
    };
  }

  factory FavoriteRecipe.fromRecipeDetails(RecipeDetails recipe) {
    return FavoriteRecipe(
      apiId: recipe.id,
      title: recipe.title,
      image: recipe.image,
      preparationTime: recipe.preparationTime,
      servings: recipe.servings,
      instructions: recipe.instructions,
      ingredients: recipe.ingredients,
    );
  }
}
