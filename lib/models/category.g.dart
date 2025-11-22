// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Category _$CategoryFromJson(Map<String, dynamic> json) => _Category(
  id: json['id'] as String,
  namePt: json['namePt'] as String,
  nameEn: json['nameEn'] as String,
  icon: json['icon'] as String? ?? '_',
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$CategoryToJson(_Category instance) => <String, dynamic>{
  'id': instance.id,
  'namePt': instance.namePt,
  'nameEn': instance.nameEn,
  'icon': instance.icon,
  'createdAt': instance.createdAt?.toIso8601String(),
};
