import 'package:freezed_annotation/freezed_annotation.dart';

part 'global_ingredient.freezed.dart';
part 'global_ingredient.g.dart';

@freezed
abstract class GlobalIngredient with _$GlobalIngredient {
  const factory GlobalIngredient({
    required String id,
    required String namePt,
    required String nameEn, // Usado na API
    String? categoryId,
    @Default(true) bool common,
    required DateTime createdAt,
  }) = _GlobalIngredient;

  factory GlobalIngredient.fromJson(Map<String, dynamic> json) =>
      _$GlobalIngredientFromJson(json);
}