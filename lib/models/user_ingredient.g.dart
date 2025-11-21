// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_ingredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserIngredient _$UserIngredientFromJson(Map<String, dynamic> json) =>
    _UserIngredient(
      id: json['id'] as String,
      userId: json['userId'] as String,
      globalIngredientId: json['globalIngredientId'] as String,
      quantity: (json['quantity'] as num?)?.toDouble() ?? 1.0,
      unit: json['unit'] as String? ?? 'un',
      createdAt: DateTime.parse(json['createdAt'] as String),
      ingredientNamePt: json['ingredientNamePt'] as String?,
      ingredientNameEn: json['ingredientNameEn'] as String?,
      categoryId: json['categoryId'] as String?,
    );

Map<String, dynamic> _$UserIngredientToJson(_UserIngredient instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'globalIngredientId': instance.globalIngredientId,
      'quantity': instance.quantity,
      'unit': instance.unit,
      'createdAt': instance.createdAt.toIso8601String(),
      'ingredientNamePt': instance.ingredientNamePt,
      'ingredientNameEn': instance.ingredientNameEn,
      'categoryId': instance.categoryId,
    };
