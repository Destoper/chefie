import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_ingredient.freezed.dart';
part 'user_ingredient.g.dart';

@freezed
sealed class UserIngredient with _$UserIngredient {
  const factory UserIngredient({
    required String id,
    required String visitorId,
    required String globalIngredientId,
    @Default(1.0) double quantity,
    @Default('un') String unit,
    DateTime? createdAt,
    GlobalIngredientNested? globalIngredient,
  }) = _UserIngredient;

  factory UserIngredient.fromJson(Map<String, dynamic> json) =>
      _$UserIngredientFromJson({
        ...json,
        'userId': json['user_id'],
        'globalIngredientId': json['global_ingredient_id'],
        'createdAt': json['created_at'],
        'globalIngredient': json['global_ingredients'],
      });
}

@freezed
sealed class GlobalIngredientNested with _$GlobalIngredientNested {
  const factory GlobalIngredientNested({
    required String id,
    required String namePt,
    required String nameEn,
    String? categoryId,
  }) = _GlobalIngredientNested;

  factory GlobalIngredientNested.fromJson(Map<String, dynamic> json) =>
      _$GlobalIngredientNestedFromJson({
        ...json,
        'namePt': json['name_pt'],
        'nameEn': json['name_en'],
        'categoryId': json['category_id'],
      });
}