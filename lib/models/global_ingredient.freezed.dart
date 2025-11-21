// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'global_ingredient.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GlobalIngredient {

 String get id; String get namePt; String get nameEn;// Usado na API
 String? get categoryId; bool get common; DateTime get createdAt;
/// Create a copy of GlobalIngredient
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GlobalIngredientCopyWith<GlobalIngredient> get copyWith => _$GlobalIngredientCopyWithImpl<GlobalIngredient>(this as GlobalIngredient, _$identity);

  /// Serializes this GlobalIngredient to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GlobalIngredient&&(identical(other.id, id) || other.id == id)&&(identical(other.namePt, namePt) || other.namePt == namePt)&&(identical(other.nameEn, nameEn) || other.nameEn == nameEn)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.common, common) || other.common == common)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,namePt,nameEn,categoryId,common,createdAt);

@override
String toString() {
  return 'GlobalIngredient(id: $id, namePt: $namePt, nameEn: $nameEn, categoryId: $categoryId, common: $common, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $GlobalIngredientCopyWith<$Res>  {
  factory $GlobalIngredientCopyWith(GlobalIngredient value, $Res Function(GlobalIngredient) _then) = _$GlobalIngredientCopyWithImpl;
@useResult
$Res call({
 String id, String namePt, String nameEn, String? categoryId, bool common, DateTime createdAt
});




}
/// @nodoc
class _$GlobalIngredientCopyWithImpl<$Res>
    implements $GlobalIngredientCopyWith<$Res> {
  _$GlobalIngredientCopyWithImpl(this._self, this._then);

  final GlobalIngredient _self;
  final $Res Function(GlobalIngredient) _then;

/// Create a copy of GlobalIngredient
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? namePt = null,Object? nameEn = null,Object? categoryId = freezed,Object? common = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,namePt: null == namePt ? _self.namePt : namePt // ignore: cast_nullable_to_non_nullable
as String,nameEn: null == nameEn ? _self.nameEn : nameEn // ignore: cast_nullable_to_non_nullable
as String,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,common: null == common ? _self.common : common // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [GlobalIngredient].
extension GlobalIngredientPatterns on GlobalIngredient {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GlobalIngredient value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GlobalIngredient() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GlobalIngredient value)  $default,){
final _that = this;
switch (_that) {
case _GlobalIngredient():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GlobalIngredient value)?  $default,){
final _that = this;
switch (_that) {
case _GlobalIngredient() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String namePt,  String nameEn,  String? categoryId,  bool common,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GlobalIngredient() when $default != null:
return $default(_that.id,_that.namePt,_that.nameEn,_that.categoryId,_that.common,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String namePt,  String nameEn,  String? categoryId,  bool common,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _GlobalIngredient():
return $default(_that.id,_that.namePt,_that.nameEn,_that.categoryId,_that.common,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String namePt,  String nameEn,  String? categoryId,  bool common,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _GlobalIngredient() when $default != null:
return $default(_that.id,_that.namePt,_that.nameEn,_that.categoryId,_that.common,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GlobalIngredient implements GlobalIngredient {
  const _GlobalIngredient({required this.id, required this.namePt, required this.nameEn, this.categoryId, this.common = true, required this.createdAt});
  factory _GlobalIngredient.fromJson(Map<String, dynamic> json) => _$GlobalIngredientFromJson(json);

@override final  String id;
@override final  String namePt;
@override final  String nameEn;
// Usado na API
@override final  String? categoryId;
@override@JsonKey() final  bool common;
@override final  DateTime createdAt;

/// Create a copy of GlobalIngredient
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GlobalIngredientCopyWith<_GlobalIngredient> get copyWith => __$GlobalIngredientCopyWithImpl<_GlobalIngredient>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GlobalIngredientToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GlobalIngredient&&(identical(other.id, id) || other.id == id)&&(identical(other.namePt, namePt) || other.namePt == namePt)&&(identical(other.nameEn, nameEn) || other.nameEn == nameEn)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.common, common) || other.common == common)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,namePt,nameEn,categoryId,common,createdAt);

@override
String toString() {
  return 'GlobalIngredient(id: $id, namePt: $namePt, nameEn: $nameEn, categoryId: $categoryId, common: $common, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$GlobalIngredientCopyWith<$Res> implements $GlobalIngredientCopyWith<$Res> {
  factory _$GlobalIngredientCopyWith(_GlobalIngredient value, $Res Function(_GlobalIngredient) _then) = __$GlobalIngredientCopyWithImpl;
@override @useResult
$Res call({
 String id, String namePt, String nameEn, String? categoryId, bool common, DateTime createdAt
});




}
/// @nodoc
class __$GlobalIngredientCopyWithImpl<$Res>
    implements _$GlobalIngredientCopyWith<$Res> {
  __$GlobalIngredientCopyWithImpl(this._self, this._then);

  final _GlobalIngredient _self;
  final $Res Function(_GlobalIngredient) _then;

/// Create a copy of GlobalIngredient
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? namePt = null,Object? nameEn = null,Object? categoryId = freezed,Object? common = null,Object? createdAt = null,}) {
  return _then(_GlobalIngredient(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,namePt: null == namePt ? _self.namePt : namePt // ignore: cast_nullable_to_non_nullable
as String,nameEn: null == nameEn ? _self.nameEn : nameEn // ignore: cast_nullable_to_non_nullable
as String,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,common: null == common ? _self.common : common // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
