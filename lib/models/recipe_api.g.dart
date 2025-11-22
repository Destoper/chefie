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
);

Map<String, dynamic> _$RecipeApiToJson(_RecipeApi instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'usedIngredientCount': instance.usedIngredientCount,
      'missedIngredientCount': instance.missedIngredientCount,
    };
