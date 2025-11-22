import 'package:freezed_annotation/freezed_annotation.dart';

part 'global_ingredient.freezed.dart';
part 'global_ingredient.g.dart';

@freezed
sealed class GlobalIngredient with _$GlobalIngredient {
  const factory GlobalIngredient({
    required String id,
    required String namePt,
    required String nameEn,
    String? categoryId,
    @Default(true) bool common,
    DateTime? createdAt,
  }) = _GlobalIngredient;

  factory GlobalIngredient.fromJson(Map<String, dynamic> json) => 
      _$GlobalIngredientFromJson({
        ...json,
        'namePt': json['name_pt'],
        'nameEn': json['name_en'],
        'categoryId': json['category_id'],
        'createdAt': json['created_at'],
      });
}