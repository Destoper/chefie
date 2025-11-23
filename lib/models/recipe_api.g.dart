// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecipeApi _$RecipeApiFromJson(Map<String, dynamic> json) => _RecipeApi(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  image: json['image'] as String? ?? '',
  usedIngredientCount: (json['usedIngredientCount'] as num?)?.toInt() ?? 0,
  missedIngredientCount: (json['missedIngredientCount'] as num?)?.toInt() ?? 0,
  usedIngredients:
      (json['usedIngredients'] as List<dynamic>?)
          ?.map((e) => IngredientInfo.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  missedIngredients:
      (json['missedIngredients'] as List<dynamic>?)
          ?.map((e) => IngredientInfo.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$RecipeApiToJson(_RecipeApi instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'usedIngredientCount': instance.usedIngredientCount,
      'missedIngredientCount': instance.missedIngredientCount,
      'usedIngredients': instance.usedIngredients,
      'missedIngredients': instance.missedIngredients,
    };

_IngredientInfo _$IngredientInfoFromJson(Map<String, dynamic> json) =>
    _IngredientInfo(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      original: json['original'] as String,
    );

Map<String, dynamic> _$IngredientInfoToJson(_IngredientInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'original': instance.original,
    };
