import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
sealed class Category with _$Category {
  const factory Category({
    required String id,
    required String namePt,
    required String nameEn,
    @Default('_') String icon,
    DateTime? createdAt,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson({
    ...json,
    'namePt': json['name_pt'],
    'nameEn': json['name_en'],
    'createdAt': json['created_at'],
  });
}