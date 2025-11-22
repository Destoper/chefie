// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_ingredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserIngredient _$UserIngredientFromJson(Map<String, dynamic> json) =>
    _UserIngredient(
      id: json['id'] as String,
      visitorId: json['visitorId'] as String,
      globalIngredientId: json['globalIngredientId'] as String,
      quantity: (json['quantity'] as num?)?.toDouble() ?? 1.0,
      unit: json['unit'] as String? ?? 'un',
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      globalIngredient: json['globalIngredient'] == null
          ? null
          : GlobalIngredientNested.fromJson(
              json['globalIngredient'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$UserIngredientToJson(_UserIngredient instance) =>
    <String, dynamic>{
      'id': instance.id,
      'visitorId': instance.visitorId,
      'globalIngredientId': instance.globalIngredientId,
      'quantity': instance.quantity,
      'unit': instance.unit,
      'createdAt': instance.createdAt?.toIso8601String(),
      'globalIngredient': instance.globalIngredient,
    };

_GlobalIngredientNested _$GlobalIngredientNestedFromJson(
  Map<String, dynamic> json,
) => _GlobalIngredientNested(
  id: json['id'] as String,
  namePt: json['namePt'] as String,
  nameEn: json['nameEn'] as String,
  categoryId: json['categoryId'] as String?,
);

Map<String, dynamic> _$GlobalIngredientNestedToJson(
  _GlobalIngredientNested instance,
) => <String, dynamic>{
  'id': instance.id,
  'namePt': instance.namePt,
  'nameEn': instance.nameEn,
  'categoryId': instance.categoryId,
};
