// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FavoriteRecipe _$FavoriteRecipeFromJson(Map<String, dynamic> json) =>
    _FavoriteRecipe(
      id: json['id'] as String,
      userId: json['userId'] as String,
      apiId: (json['apiId'] as num).toInt(),
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String?,
      readyInMinutes: (json['readyInMinutes'] as num?)?.toInt() ?? 0,
      servings: (json['servings'] as num?)?.toInt() ?? 0,
      instructions: json['instructions'] as String?,
      ingredients:
          (json['ingredients'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      notes: json['notes'] as String?,
      rating: (json['rating'] as num?)?.toInt(),
      lastCookedAt: json['lastCookedAt'] == null
          ? null
          : DateTime.parse(json['lastCookedAt'] as String),
    );

Map<String, dynamic> _$FavoriteRecipeToJson(_FavoriteRecipe instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'apiId': instance.apiId,
      'title': instance.title,
      'imageUrl': instance.imageUrl,
      'readyInMinutes': instance.readyInMinutes,
      'servings': instance.servings,
      'instructions': instance.instructions,
      'ingredients': instance.ingredients,
      'createdAt': instance.createdAt?.toIso8601String(),
      'notes': instance.notes,
      'rating': instance.rating,
      'lastCookedAt': instance.lastCookedAt?.toIso8601String(),
    };
