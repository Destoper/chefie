// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_ingredient.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserIngredient {

 String get id; String get visitorId; String get globalIngredientId; double get quantity; String get unit; DateTime? get createdAt; GlobalIngredientNested? get globalIngredient;
/// Create a copy of UserIngredient
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserIngredientCopyWith<UserIngredient> get copyWith => _$UserIngredientCopyWithImpl<UserIngredient>(this as UserIngredient, _$identity);

  /// Serializes this UserIngredient to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserIngredient&&(identical(other.id, id) || other.id == id)&&(identical(other.visitorId, visitorId) || other.visitorId == visitorId)&&(identical(other.globalIngredientId, globalIngredientId) || other.globalIngredientId == globalIngredientId)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.globalIngredient, globalIngredient) || other.globalIngredient == globalIngredient));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,visitorId,globalIngredientId,quantity,unit,createdAt,globalIngredient);

@override
String toString() {
  return 'UserIngredient(id: $id, visitorId: $visitorId, globalIngredientId: $globalIngredientId, quantity: $quantity, unit: $unit, createdAt: $createdAt, globalIngredient: $globalIngredient)';
}


}

/// @nodoc
abstract mixin class $UserIngredientCopyWith<$Res>  {
  factory $UserIngredientCopyWith(UserIngredient value, $Res Function(UserIngredient) _then) = _$UserIngredientCopyWithImpl;
@useResult
$Res call({
 String id, String visitorId, String globalIngredientId, double quantity, String unit, DateTime? createdAt, GlobalIngredientNested? globalIngredient
});


$GlobalIngredientNestedCopyWith<$Res>? get globalIngredient;

}
/// @nodoc
class _$UserIngredientCopyWithImpl<$Res>
    implements $UserIngredientCopyWith<$Res> {
  _$UserIngredientCopyWithImpl(this._self, this._then);

  final UserIngredient _self;
  final $Res Function(UserIngredient) _then;

/// Create a copy of UserIngredient
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? visitorId = null,Object? globalIngredientId = null,Object? quantity = null,Object? unit = null,Object? createdAt = freezed,Object? globalIngredient = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,visitorId: null == visitorId ? _self.visitorId : visitorId // ignore: cast_nullable_to_non_nullable
as String,globalIngredientId: null == globalIngredientId ? _self.globalIngredientId : globalIngredientId // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,globalIngredient: freezed == globalIngredient ? _self.globalIngredient : globalIngredient // ignore: cast_nullable_to_non_nullable
as GlobalIngredientNested?,
  ));
}
/// Create a copy of UserIngredient
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GlobalIngredientNestedCopyWith<$Res>? get globalIngredient {
    if (_self.globalIngredient == null) {
    return null;
  }

  return $GlobalIngredientNestedCopyWith<$Res>(_self.globalIngredient!, (value) {
    return _then(_self.copyWith(globalIngredient: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserIngredient].
extension UserIngredientPatterns on UserIngredient {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserIngredient value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserIngredient() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserIngredient value)  $default,){
final _that = this;
switch (_that) {
case _UserIngredient():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserIngredient value)?  $default,){
final _that = this;
switch (_that) {
case _UserIngredient() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String visitorId,  String globalIngredientId,  double quantity,  String unit,  DateTime? createdAt,  GlobalIngredientNested? globalIngredient)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserIngredient() when $default != null:
return $default(_that.id,_that.visitorId,_that.globalIngredientId,_that.quantity,_that.unit,_that.createdAt,_that.globalIngredient);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String visitorId,  String globalIngredientId,  double quantity,  String unit,  DateTime? createdAt,  GlobalIngredientNested? globalIngredient)  $default,) {final _that = this;
switch (_that) {
case _UserIngredient():
return $default(_that.id,_that.visitorId,_that.globalIngredientId,_that.quantity,_that.unit,_that.createdAt,_that.globalIngredient);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String visitorId,  String globalIngredientId,  double quantity,  String unit,  DateTime? createdAt,  GlobalIngredientNested? globalIngredient)?  $default,) {final _that = this;
switch (_that) {
case _UserIngredient() when $default != null:
return $default(_that.id,_that.visitorId,_that.globalIngredientId,_that.quantity,_that.unit,_that.createdAt,_that.globalIngredient);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserIngredient implements UserIngredient {
  const _UserIngredient({required this.id, required this.visitorId, required this.globalIngredientId, this.quantity = 1.0, this.unit = 'un', this.createdAt, this.globalIngredient});
  factory _UserIngredient.fromJson(Map<String, dynamic> json) => _$UserIngredientFromJson(json);

@override final  String id;
@override final  String visitorId;
@override final  String globalIngredientId;
@override@JsonKey() final  double quantity;
@override@JsonKey() final  String unit;
@override final  DateTime? createdAt;
@override final  GlobalIngredientNested? globalIngredient;

/// Create a copy of UserIngredient
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserIngredientCopyWith<_UserIngredient> get copyWith => __$UserIngredientCopyWithImpl<_UserIngredient>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserIngredientToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserIngredient&&(identical(other.id, id) || other.id == id)&&(identical(other.visitorId, visitorId) || other.visitorId == visitorId)&&(identical(other.globalIngredientId, globalIngredientId) || other.globalIngredientId == globalIngredientId)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.globalIngredient, globalIngredient) || other.globalIngredient == globalIngredient));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,visitorId,globalIngredientId,quantity,unit,createdAt,globalIngredient);

@override
String toString() {
  return 'UserIngredient(id: $id, visitorId: $visitorId, globalIngredientId: $globalIngredientId, quantity: $quantity, unit: $unit, createdAt: $createdAt, globalIngredient: $globalIngredient)';
}


}

/// @nodoc
abstract mixin class _$UserIngredientCopyWith<$Res> implements $UserIngredientCopyWith<$Res> {
  factory _$UserIngredientCopyWith(_UserIngredient value, $Res Function(_UserIngredient) _then) = __$UserIngredientCopyWithImpl;
@override @useResult
$Res call({
 String id, String visitorId, String globalIngredientId, double quantity, String unit, DateTime? createdAt, GlobalIngredientNested? globalIngredient
});


@override $GlobalIngredientNestedCopyWith<$Res>? get globalIngredient;

}
/// @nodoc
class __$UserIngredientCopyWithImpl<$Res>
    implements _$UserIngredientCopyWith<$Res> {
  __$UserIngredientCopyWithImpl(this._self, this._then);

  final _UserIngredient _self;
  final $Res Function(_UserIngredient) _then;

/// Create a copy of UserIngredient
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? visitorId = null,Object? globalIngredientId = null,Object? quantity = null,Object? unit = null,Object? createdAt = freezed,Object? globalIngredient = freezed,}) {
  return _then(_UserIngredient(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,visitorId: null == visitorId ? _self.visitorId : visitorId // ignore: cast_nullable_to_non_nullable
as String,globalIngredientId: null == globalIngredientId ? _self.globalIngredientId : globalIngredientId // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,globalIngredient: freezed == globalIngredient ? _self.globalIngredient : globalIngredient // ignore: cast_nullable_to_non_nullable
as GlobalIngredientNested?,
  ));
}

/// Create a copy of UserIngredient
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GlobalIngredientNestedCopyWith<$Res>? get globalIngredient {
    if (_self.globalIngredient == null) {
    return null;
  }

  return $GlobalIngredientNestedCopyWith<$Res>(_self.globalIngredient!, (value) {
    return _then(_self.copyWith(globalIngredient: value));
  });
}
}


/// @nodoc
mixin _$GlobalIngredientNested {

 String get id; String get namePt; String get nameEn; String? get categoryId;
/// Create a copy of GlobalIngredientNested
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GlobalIngredientNestedCopyWith<GlobalIngredientNested> get copyWith => _$GlobalIngredientNestedCopyWithImpl<GlobalIngredientNested>(this as GlobalIngredientNested, _$identity);

  /// Serializes this GlobalIngredientNested to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GlobalIngredientNested&&(identical(other.id, id) || other.id == id)&&(identical(other.namePt, namePt) || other.namePt == namePt)&&(identical(other.nameEn, nameEn) || other.nameEn == nameEn)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,namePt,nameEn,categoryId);

@override
String toString() {
  return 'GlobalIngredientNested(id: $id, namePt: $namePt, nameEn: $nameEn, categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class $GlobalIngredientNestedCopyWith<$Res>  {
  factory $GlobalIngredientNestedCopyWith(GlobalIngredientNested value, $Res Function(GlobalIngredientNested) _then) = _$GlobalIngredientNestedCopyWithImpl;
@useResult
$Res call({
 String id, String namePt, String nameEn, String? categoryId
});




}
/// @nodoc
class _$GlobalIngredientNestedCopyWithImpl<$Res>
    implements $GlobalIngredientNestedCopyWith<$Res> {
  _$GlobalIngredientNestedCopyWithImpl(this._self, this._then);

  final GlobalIngredientNested _self;
  final $Res Function(GlobalIngredientNested) _then;

/// Create a copy of GlobalIngredientNested
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? namePt = null,Object? nameEn = null,Object? categoryId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,namePt: null == namePt ? _self.namePt : namePt // ignore: cast_nullable_to_non_nullable
as String,nameEn: null == nameEn ? _self.nameEn : nameEn // ignore: cast_nullable_to_non_nullable
as String,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GlobalIngredientNested].
extension GlobalIngredientNestedPatterns on GlobalIngredientNested {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GlobalIngredientNested value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GlobalIngredientNested() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GlobalIngredientNested value)  $default,){
final _that = this;
switch (_that) {
case _GlobalIngredientNested():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GlobalIngredientNested value)?  $default,){
final _that = this;
switch (_that) {
case _GlobalIngredientNested() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String namePt,  String nameEn,  String? categoryId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GlobalIngredientNested() when $default != null:
return $default(_that.id,_that.namePt,_that.nameEn,_that.categoryId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String namePt,  String nameEn,  String? categoryId)  $default,) {final _that = this;
switch (_that) {
case _GlobalIngredientNested():
return $default(_that.id,_that.namePt,_that.nameEn,_that.categoryId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String namePt,  String nameEn,  String? categoryId)?  $default,) {final _that = this;
switch (_that) {
case _GlobalIngredientNested() when $default != null:
return $default(_that.id,_that.namePt,_that.nameEn,_that.categoryId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GlobalIngredientNested implements GlobalIngredientNested {
  const _GlobalIngredientNested({required this.id, required this.namePt, required this.nameEn, this.categoryId});
  factory _GlobalIngredientNested.fromJson(Map<String, dynamic> json) => _$GlobalIngredientNestedFromJson(json);

@override final  String id;
@override final  String namePt;
@override final  String nameEn;
@override final  String? categoryId;

/// Create a copy of GlobalIngredientNested
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GlobalIngredientNestedCopyWith<_GlobalIngredientNested> get copyWith => __$GlobalIngredientNestedCopyWithImpl<_GlobalIngredientNested>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GlobalIngredientNestedToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GlobalIngredientNested&&(identical(other.id, id) || other.id == id)&&(identical(other.namePt, namePt) || other.namePt == namePt)&&(identical(other.nameEn, nameEn) || other.nameEn == nameEn)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,namePt,nameEn,categoryId);

@override
String toString() {
  return 'GlobalIngredientNested(id: $id, namePt: $namePt, nameEn: $nameEn, categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class _$GlobalIngredientNestedCopyWith<$Res> implements $GlobalIngredientNestedCopyWith<$Res> {
  factory _$GlobalIngredientNestedCopyWith(_GlobalIngredientNested value, $Res Function(_GlobalIngredientNested) _then) = __$GlobalIngredientNestedCopyWithImpl;
@override @useResult
$Res call({
 String id, String namePt, String nameEn, String? categoryId
});




}
/// @nodoc
class __$GlobalIngredientNestedCopyWithImpl<$Res>
    implements _$GlobalIngredientNestedCopyWith<$Res> {
  __$GlobalIngredientNestedCopyWithImpl(this._self, this._then);

  final _GlobalIngredientNested _self;
  final $Res Function(_GlobalIngredientNested) _then;

/// Create a copy of GlobalIngredientNested
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? namePt = null,Object? nameEn = null,Object? categoryId = freezed,}) {
  return _then(_GlobalIngredientNested(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,namePt: null == namePt ? _self.namePt : namePt // ignore: cast_nullable_to_non_nullable
as String,nameEn: null == nameEn ? _self.nameEn : nameEn // ignore: cast_nullable_to_non_nullable
as String,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
