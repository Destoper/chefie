class RecipeDetails {
  final int id;
  final String title;
  final String? image;
  final int preparationTime;
  final int servings;
  final String? instructions;
  final List<String> ingredients;

  RecipeDetails({
    required this.id,
    required this.title,
    this.image,
    required this.preparationTime,
    required this.servings,
    this.instructions,
    required this.ingredients,
  });

  factory RecipeDetails.fromJson(Map<String, dynamic> json) {
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
      preparationTime: json['readyInMinutes'] ?? 0,
      servings: json['servings'] ?? 0,
      instructions: json['instructions'],
      ingredients: ingredientsList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'api_id': id,
      'title': title,
      'image': image,
      'preparation_time': preparationTime,
      'servings': servings,
      'instructions': instructions,
      'ingredients': ingredients,
    };
  }
}
