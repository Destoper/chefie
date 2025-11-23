// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_api.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecipeApi {

 int get id; String get title; String get image; int get usedIngredientCount; int get missedIngredientCount; List<IngredientInfo> get usedIngredients; List<IngredientInfo> get missedIngredients;
/// Create a copy of RecipeApi
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeApiCopyWith<RecipeApi> get copyWith => _$RecipeApiCopyWithImpl<RecipeApi>(this as RecipeApi, _$identity);

  /// Serializes this RecipeApi to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecipeApi&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.image, image) || other.image == image)&&(identical(other.usedIngredientCount, usedIngredientCount) || other.usedIngredientCount == usedIngredientCount)&&(identical(other.missedIngredientCount, missedIngredientCount) || other.missedIngredientCount == missedIngredientCount)&&const DeepCollectionEquality().equals(other.usedIngredients, usedIngredients)&&const DeepCollectionEquality().equals(other.missedIngredients, missedIngredients));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,image,usedIngredientCount,missedIngredientCount,const DeepCollectionEquality().hash(usedIngredients),const DeepCollectionEquality().hash(missedIngredients));

@override
String toString() {
  return 'RecipeApi(id: $id, title: $title, image: $image, usedIngredientCount: $usedIngredientCount, missedIngredientCount: $missedIngredientCount, usedIngredients: $usedIngredients, missedIngredients: $missedIngredients)';
}


}

/// @nodoc
abstract mixin class $RecipeApiCopyWith<$Res>  {
  factory $RecipeApiCopyWith(RecipeApi value, $Res Function(RecipeApi) _then) = _$RecipeApiCopyWithImpl;
@useResult
$Res call({
 int id, String title, String image, int usedIngredientCount, int missedIngredientCount, List<IngredientInfo> usedIngredients, List<IngredientInfo> missedIngredients
});




}
/// @nodoc
class _$RecipeApiCopyWithImpl<$Res>
    implements $RecipeApiCopyWith<$Res> {
  _$RecipeApiCopyWithImpl(this._self, this._then);

  final RecipeApi _self;
  final $Res Function(RecipeApi) _then;

/// Create a copy of RecipeApi
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? image = null,Object? usedIngredientCount = null,Object? missedIngredientCount = null,Object? usedIngredients = null,Object? missedIngredients = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,usedIngredientCount: null == usedIngredientCount ? _self.usedIngredientCount : usedIngredientCount // ignore: cast_nullable_to_non_nullable
as int,missedIngredientCount: null == missedIngredientCount ? _self.missedIngredientCount : missedIngredientCount // ignore: cast_nullable_to_non_nullable
as int,usedIngredients: null == usedIngredients ? _self.usedIngredients : usedIngredients // ignore: cast_nullable_to_non_nullable
as List<IngredientInfo>,missedIngredients: null == missedIngredients ? _self.missedIngredients : missedIngredients // ignore: cast_nullable_to_non_nullable
as List<IngredientInfo>,
  ));
}

}


/// Adds pattern-matching-related methods to [RecipeApi].
extension RecipeApiPatterns on RecipeApi {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecipeApi value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecipeApi() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecipeApi value)  $default,){
final _that = this;
switch (_that) {
case _RecipeApi():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecipeApi value)?  $default,){
final _that = this;
switch (_that) {
case _RecipeApi() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  String image,  int usedIngredientCount,  int missedIngredientCount,  List<IngredientInfo> usedIngredients,  List<IngredientInfo> missedIngredients)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecipeApi() when $default != null:
return $default(_that.id,_that.title,_that.image,_that.usedIngredientCount,_that.missedIngredientCount,_that.usedIngredients,_that.missedIngredients);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  String image,  int usedIngredientCount,  int missedIngredientCount,  List<IngredientInfo> usedIngredients,  List<IngredientInfo> missedIngredients)  $default,) {final _that = this;
switch (_that) {
case _RecipeApi():
return $default(_that.id,_that.title,_that.image,_that.usedIngredientCount,_that.missedIngredientCount,_that.usedIngredients,_that.missedIngredients);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  String image,  int usedIngredientCount,  int missedIngredientCount,  List<IngredientInfo> usedIngredients,  List<IngredientInfo> missedIngredients)?  $default,) {final _that = this;
switch (_that) {
case _RecipeApi() when $default != null:
return $default(_that.id,_that.title,_that.image,_that.usedIngredientCount,_that.missedIngredientCount,_that.usedIngredients,_that.missedIngredients);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecipeApi extends RecipeApi {
  const _RecipeApi({required this.id, required this.title, this.image = '', this.usedIngredientCount = 0, this.missedIngredientCount = 0, final  List<IngredientInfo> usedIngredients = const [], final  List<IngredientInfo> missedIngredients = const []}): _usedIngredients = usedIngredients,_missedIngredients = missedIngredients,super._();
  factory _RecipeApi.fromJson(Map<String, dynamic> json) => _$RecipeApiFromJson(json);

@override final  int id;
@override final  String title;
@override@JsonKey() final  String image;
@override@JsonKey() final  int usedIngredientCount;
@override@JsonKey() final  int missedIngredientCount;
 final  List<IngredientInfo> _usedIngredients;
@override@JsonKey() List<IngredientInfo> get usedIngredients {
  if (_usedIngredients is EqualUnmodifiableListView) return _usedIngredients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_usedIngredients);
}

 final  List<IngredientInfo> _missedIngredients;
@override@JsonKey() List<IngredientInfo> get missedIngredients {
  if (_missedIngredients is EqualUnmodifiableListView) return _missedIngredients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_missedIngredients);
}


/// Create a copy of RecipeApi
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipeApiCopyWith<_RecipeApi> get copyWith => __$RecipeApiCopyWithImpl<_RecipeApi>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecipeApiToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecipeApi&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.image, image) || other.image == image)&&(identical(other.usedIngredientCount, usedIngredientCount) || other.usedIngredientCount == usedIngredientCount)&&(identical(other.missedIngredientCount, missedIngredientCount) || other.missedIngredientCount == missedIngredientCount)&&const DeepCollectionEquality().equals(other._usedIngredients, _usedIngredients)&&const DeepCollectionEquality().equals(other._missedIngredients, _missedIngredients));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,image,usedIngredientCount,missedIngredientCount,const DeepCollectionEquality().hash(_usedIngredients),const DeepCollectionEquality().hash(_missedIngredients));

@override
String toString() {
  return 'RecipeApi(id: $id, title: $title, image: $image, usedIngredientCount: $usedIngredientCount, missedIngredientCount: $missedIngredientCount, usedIngredients: $usedIngredients, missedIngredients: $missedIngredients)';
}


}

/// @nodoc
abstract mixin class _$RecipeApiCopyWith<$Res> implements $RecipeApiCopyWith<$Res> {
  factory _$RecipeApiCopyWith(_RecipeApi value, $Res Function(_RecipeApi) _then) = __$RecipeApiCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String image, int usedIngredientCount, int missedIngredientCount, List<IngredientInfo> usedIngredients, List<IngredientInfo> missedIngredients
});




}
/// @nodoc
class __$RecipeApiCopyWithImpl<$Res>
    implements _$RecipeApiCopyWith<$Res> {
  __$RecipeApiCopyWithImpl(this._self, this._then);

  final _RecipeApi _self;
  final $Res Function(_RecipeApi) _then;

/// Create a copy of RecipeApi
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? image = null,Object? usedIngredientCount = null,Object? missedIngredientCount = null,Object? usedIngredients = null,Object? missedIngredients = null,}) {
  return _then(_RecipeApi(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,usedIngredientCount: null == usedIngredientCount ? _self.usedIngredientCount : usedIngredientCount // ignore: cast_nullable_to_non_nullable
as int,missedIngredientCount: null == missedIngredientCount ? _self.missedIngredientCount : missedIngredientCount // ignore: cast_nullable_to_non_nullable
as int,usedIngredients: null == usedIngredients ? _self._usedIngredients : usedIngredients // ignore: cast_nullable_to_non_nullable
as List<IngredientInfo>,missedIngredients: null == missedIngredients ? _self._missedIngredients : missedIngredients // ignore: cast_nullable_to_non_nullable
as List<IngredientInfo>,
  ));
}


}


/// @nodoc
mixin _$IngredientInfo {

 int get id; String get name; String get original;
/// Create a copy of IngredientInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IngredientInfoCopyWith<IngredientInfo> get copyWith => _$IngredientInfoCopyWithImpl<IngredientInfo>(this as IngredientInfo, _$identity);

  /// Serializes this IngredientInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IngredientInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.original, original) || other.original == original));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,original);

@override
String toString() {
  return 'IngredientInfo(id: $id, name: $name, original: $original)';
}


}

/// @nodoc
abstract mixin class $IngredientInfoCopyWith<$Res>  {
  factory $IngredientInfoCopyWith(IngredientInfo value, $Res Function(IngredientInfo) _then) = _$IngredientInfoCopyWithImpl;
@useResult
$Res call({
 int id, String name, String original
});




}
/// @nodoc
class _$IngredientInfoCopyWithImpl<$Res>
    implements $IngredientInfoCopyWith<$Res> {
  _$IngredientInfoCopyWithImpl(this._self, this._then);

  final IngredientInfo _self;
  final $Res Function(IngredientInfo) _then;

/// Create a copy of IngredientInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? original = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,original: null == original ? _self.original : original // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [IngredientInfo].
extension IngredientInfoPatterns on IngredientInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IngredientInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IngredientInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IngredientInfo value)  $default,){
final _that = this;
switch (_that) {
case _IngredientInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IngredientInfo value)?  $default,){
final _that = this;
switch (_that) {
case _IngredientInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String original)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IngredientInfo() when $default != null:
return $default(_that.id,_that.name,_that.original);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String original)  $default,) {final _that = this;
switch (_that) {
case _IngredientInfo():
return $default(_that.id,_that.name,_that.original);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String original)?  $default,) {final _that = this;
switch (_that) {
case _IngredientInfo() when $default != null:
return $default(_that.id,_that.name,_that.original);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IngredientInfo implements IngredientInfo {
  const _IngredientInfo({required this.id, required this.name, required this.original});
  factory _IngredientInfo.fromJson(Map<String, dynamic> json) => _$IngredientInfoFromJson(json);

@override final  int id;
@override final  String name;
@override final  String original;

/// Create a copy of IngredientInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IngredientInfoCopyWith<_IngredientInfo> get copyWith => __$IngredientInfoCopyWithImpl<_IngredientInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IngredientInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IngredientInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.original, original) || other.original == original));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,original);

@override
String toString() {
  return 'IngredientInfo(id: $id, name: $name, original: $original)';
}


}

/// @nodoc
abstract mixin class _$IngredientInfoCopyWith<$Res> implements $IngredientInfoCopyWith<$Res> {
  factory _$IngredientInfoCopyWith(_IngredientInfo value, $Res Function(_IngredientInfo) _then) = __$IngredientInfoCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String original
});




}
/// @nodoc
class __$IngredientInfoCopyWithImpl<$Res>
    implements _$IngredientInfoCopyWith<$Res> {
  __$IngredientInfoCopyWithImpl(this._self, this._then);

  final _IngredientInfo _self;
  final $Res Function(_IngredientInfo) _then;

/// Create a copy of IngredientInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? original = null,}) {
  return _then(_IngredientInfo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,original: null == original ? _self.original : original // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
