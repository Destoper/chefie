import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_api.freezed.dart';
part 'recipe_api.g.dart';

@freezed
abstract class RecipeApi with _$RecipeApi {
  const factory RecipeApi({
    required int id,
    required String title,
    required String image,
    @Default(0) int usedIngredientCount,
    @Default(0) int missedIngredientCount,
  }) = _RecipeApi;

  factory RecipeApi.fromJson(Map<String, dynamic> json) =>
      _$RecipeApiFromJson(json);
}

extension RecipeApiExtension on RecipeApi {
  double get matchPercentage {
    final total = usedIngredientCount + missedIngredientCount;
    if (total == 0) return 0;
    return (usedIngredientCount / total) * 100;
  }
}