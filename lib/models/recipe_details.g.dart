// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecipeDetails _$RecipeDetailsFromJson(Map<String, dynamic> json) =>
    _RecipeDetails(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      image: json['image'] as String?,
      readyInMinutes: (json['readyInMinutes'] as num?)?.toInt() ?? 0,
      servings: (json['servings'] as num?)?.toInt() ?? 0,
      instructions: json['instructions'] as String?,
      extendedIngredients:
          (json['extendedIngredients'] as List<dynamic>?)
              ?.map(
                (e) => ExtendedIngredient.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$RecipeDetailsToJson(_RecipeDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'readyInMinutes': instance.readyInMinutes,
      'servings': instance.servings,
      'instructions': instance.instructions,
      'extendedIngredients': instance.extendedIngredients,
    };

_ExtendedIngredient _$ExtendedIngredientFromJson(Map<String, dynamic> json) =>
    _ExtendedIngredient(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      original: json['original'] as String,
    );

Map<String, dynamic> _$ExtendedIngredientToJson(_ExtendedIngredient instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'original': instance.original,
    };
