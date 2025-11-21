import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_ingredient.freezed.dart';
part 'user_ingredient.g.dart';

@freezed
abstract class UserIngredient with _$UserIngredient {
  const factory UserIngredient({
    required String id,
    required String userId,
    required String globalIngredientId,
    @Default(1.0) double quantity,
    @Default('un') String unit,
    required DateTime createdAt,
    // Dados do ingrediente global (join)
    String? ingredientNamePt,
    String? ingredientNameEn,
    String? categoryId,
  }) = _UserIngredient;

  factory UserIngredient.fromJson(Map<String, dynamic> json) =>
      _$UserIngredientFromJson(json);

  // Helper para criar ingrediente vazio
  factory UserIngredient.empty(String userId) => UserIngredient(
        id: '',
        userId: userId,
        globalIngredientId: '',
        quantity: 1.0,
        unit: 'un',
        createdAt: DateTime.now(),
      );
}