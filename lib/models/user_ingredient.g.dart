// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_ingredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserIngredient _$UserIngredientFromJson(Map<String, dynamic> json) =>
    _UserIngredient(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      globalIngredientId: json['global_ingredient_id'] as String,
      quantity: (json['quantity'] as num?)?.toDouble() ?? 1.0,
      unit: json['unit'] as String? ?? 'un',
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      globalIngredient: json['global_ingredients'] == null
          ? null
          : GlobalIngredientNested.fromJson(
              json['global_ingredients'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$UserIngredientToJson(_UserIngredient instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'global_ingredient_id': instance.globalIngredientId,
      'quantity': instance.quantity,
      'unit': instance.unit,
    };

_GlobalIngredientNested _$GlobalIngredientNestedFromJson(
  Map<String, dynamic> json,
) => _GlobalIngredientNested(
  id: json['id'] as String,
  namePt: json['name_pt'] as String,
  nameEn: json['name_en'] as String,
  categoryId: json['category_id'] as String?,
);

Map<String, dynamic> _$GlobalIngredientNestedToJson(
  _GlobalIngredientNested instance,
) => <String, dynamic>{
  'id': instance.id,
  'name_pt': instance.namePt,
  'name_en': instance.nameEn,
  'category_id': instance.categoryId,
};
