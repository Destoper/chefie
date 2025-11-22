// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_ingredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GlobalIngredient _$GlobalIngredientFromJson(Map<String, dynamic> json) =>
    _GlobalIngredient(
      id: json['id'] as String,
      namePt: json['namePt'] as String,
      nameEn: json['nameEn'] as String,
      categoryId: json['categoryId'] as String?,
      common: json['common'] as bool? ?? true,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$GlobalIngredientToJson(_GlobalIngredient instance) =>
    <String, dynamic>{
      'id': instance.id,
      'namePt': instance.namePt,
      'nameEn': instance.nameEn,
      'categoryId': instance.categoryId,
      'common': instance.common,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
