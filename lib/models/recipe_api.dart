import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_api.freezed.dart';
part 'recipe_api.g.dart';

@freezed
sealed class RecipeApi with _$RecipeApi {
  const RecipeApi._();

  const factory RecipeApi({
    required int id,
    required String title,
    @Default('') String image,
    @Default(0) int usedIngredientCount,
    @Default(0) int missedIngredientCount,
    @Default([]) List<IngredientInfo> usedIngredients,
    @Default([]) List<IngredientInfo> missedIngredients,
  }) = _RecipeApi;

  factory RecipeApi.fromJson(Map<String, dynamic> json) =>
      _$RecipeApiFromJson({
        ...json,
        'usedIngredientCount': json['usedIngredientCount'] ?? 0,
        'missedIngredientCount': json['missedIngredientCount'] ?? 0,
        'usedIngredients': json['usedIngredients'] ?? [],
        'missedIngredients': json['missedIngredients'] ?? [],
      });

  // Calcular percentual de match
  double get matchPercentage {
    final total = usedIngredientCount + missedIngredientCount;
    if (total == 0) return 0;
    return (usedIngredientCount / total) * 100;
  }
}

@freezed
sealed class IngredientInfo with _$IngredientInfo {
  const factory IngredientInfo({
    required int id,
    required String name,
    required String original,
  }) = _IngredientInfo;

  factory IngredientInfo.fromJson(Map<String, dynamic> json) =>
      _$IngredientInfoFromJson(json);
}