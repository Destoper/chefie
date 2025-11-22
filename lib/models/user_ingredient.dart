import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_ingredient.freezed.dart';
part 'user_ingredient.g.dart';

@freezed
sealed class UserIngredient with _$UserIngredient {
  const factory UserIngredient({
    @JsonKey(includeToJson: false) required String id,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'global_ingredient_id') required String globalIngredientId,
    @Default(1.0) double quantity,
    @Default('un') String unit,
    @JsonKey(name: 'created_at', includeToJson: false) DateTime? createdAt,
    @JsonKey(name: 'global_ingredients', includeToJson: false) GlobalIngredientNested? globalIngredient,
  }) = _UserIngredient;

  factory UserIngredient.fromJson(Map<String, dynamic> json) =>
      _$UserIngredientFromJson(json);
}

@freezed
sealed class GlobalIngredientNested with _$GlobalIngredientNested {
  const factory GlobalIngredientNested({
    required String id,
    @JsonKey(name: 'name_pt') required String namePt,
    @JsonKey(name: 'name_en') required String nameEn,
    @JsonKey(name: 'category_id') String? categoryId,
  }) = _GlobalIngredientNested;

  factory GlobalIngredientNested.fromJson(Map<String, dynamic> json) =>
      _$GlobalIngredientNestedFromJson(json);
}