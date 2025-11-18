class RecipeAPI {
  final int id;
  final String title;
  final String image;
  final int usedIngredients;
  final int missingIngredients;

  RecipeAPI({
    required this.id,
    required this.title,
    required this.image,
    required this.usedIngredients,
    required this.missingIngredients,
  });

  factory RecipeAPI.fromJson(Map<String, dynamic> json) {
    return RecipeAPI(
      id: json['id'],
      title: json['title'],
      image: json['image'] ?? '',
      usedIngredients: json['usedIngredientCount'] ?? 0,
      missingIngredients: json['missedIngredientCount'] ?? 0,
    );
  }

  double get matchPercentage {
    final total = usedIngredients + missingIngredients;
    if (total == 0) return 0;
    return (usedIngredients / total) * 100;
  }
}
