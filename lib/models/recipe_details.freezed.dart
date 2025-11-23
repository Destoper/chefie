// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecipeDetails {

 int get id; String get title; String? get image; int get readyInMinutes; int get servings; String? get instructions; List<ExtendedIngredient> get extendedIngredients;
/// Create a copy of RecipeDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeDetailsCopyWith<RecipeDetails> get copyWith => _$RecipeDetailsCopyWithImpl<RecipeDetails>(this as RecipeDetails, _$identity);

  /// Serializes this RecipeDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecipeDetails&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.image, image) || other.image == image)&&(identical(other.readyInMinutes, readyInMinutes) || other.readyInMinutes == readyInMinutes)&&(identical(other.servings, servings) || other.servings == servings)&&(identical(other.instructions, instructions) || other.instructions == instructions)&&const DeepCollectionEquality().equals(other.extendedIngredients, extendedIngredients));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,image,readyInMinutes,servings,instructions,const DeepCollectionEquality().hash(extendedIngredients));

@override
String toString() {
  return 'RecipeDetails(id: $id, title: $title, image: $image, readyInMinutes: $readyInMinutes, servings: $servings, instructions: $instructions, extendedIngredients: $extendedIngredients)';
}


}

/// @nodoc
abstract mixin class $RecipeDetailsCopyWith<$Res>  {
  factory $RecipeDetailsCopyWith(RecipeDetails value, $Res Function(RecipeDetails) _then) = _$RecipeDetailsCopyWithImpl;
@useResult
$Res call({
 int id, String title, String? image, int readyInMinutes, int servings, String? instructions, List<ExtendedIngredient> extendedIngredients
});




}
/// @nodoc
class _$RecipeDetailsCopyWithImpl<$Res>
    implements $RecipeDetailsCopyWith<$Res> {
  _$RecipeDetailsCopyWithImpl(this._self, this._then);

  final RecipeDetails _self;
  final $Res Function(RecipeDetails) _then;

/// Create a copy of RecipeDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? image = freezed,Object? readyInMinutes = null,Object? servings = null,Object? instructions = freezed,Object? extendedIngredients = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,readyInMinutes: null == readyInMinutes ? _self.readyInMinutes : readyInMinutes // ignore: cast_nullable_to_non_nullable
as int,servings: null == servings ? _self.servings : servings // ignore: cast_nullable_to_non_nullable
as int,instructions: freezed == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String?,extendedIngredients: null == extendedIngredients ? _self.extendedIngredients : extendedIngredients // ignore: cast_nullable_to_non_nullable
as List<ExtendedIngredient>,
  ));
}

}


/// Adds pattern-matching-related methods to [RecipeDetails].
extension RecipeDetailsPatterns on RecipeDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecipeDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecipeDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecipeDetails value)  $default,){
final _that = this;
switch (_that) {
case _RecipeDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecipeDetails value)?  $default,){
final _that = this;
switch (_that) {
case _RecipeDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  String? image,  int readyInMinutes,  int servings,  String? instructions,  List<ExtendedIngredient> extendedIngredients)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecipeDetails() when $default != null:
return $default(_that.id,_that.title,_that.image,_that.readyInMinutes,_that.servings,_that.instructions,_that.extendedIngredients);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  String? image,  int readyInMinutes,  int servings,  String? instructions,  List<ExtendedIngredient> extendedIngredients)  $default,) {final _that = this;
switch (_that) {
case _RecipeDetails():
return $default(_that.id,_that.title,_that.image,_that.readyInMinutes,_that.servings,_that.instructions,_that.extendedIngredients);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  String? image,  int readyInMinutes,  int servings,  String? instructions,  List<ExtendedIngredient> extendedIngredients)?  $default,) {final _that = this;
switch (_that) {
case _RecipeDetails() when $default != null:
return $default(_that.id,_that.title,_that.image,_that.readyInMinutes,_that.servings,_that.instructions,_that.extendedIngredients);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecipeDetails implements RecipeDetails {
  const _RecipeDetails({required this.id, required this.title, this.image, this.readyInMinutes = 0, this.servings = 0, this.instructions, final  List<ExtendedIngredient> extendedIngredients = const []}): _extendedIngredients = extendedIngredients;
  factory _RecipeDetails.fromJson(Map<String, dynamic> json) => _$RecipeDetailsFromJson(json);

@override final  int id;
@override final  String title;
@override final  String? image;
@override@JsonKey() final  int readyInMinutes;
@override@JsonKey() final  int servings;
@override final  String? instructions;
 final  List<ExtendedIngredient> _extendedIngredients;
@override@JsonKey() List<ExtendedIngredient> get extendedIngredients {
  if (_extendedIngredients is EqualUnmodifiableListView) return _extendedIngredients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_extendedIngredients);
}


/// Create a copy of RecipeDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipeDetailsCopyWith<_RecipeDetails> get copyWith => __$RecipeDetailsCopyWithImpl<_RecipeDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecipeDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecipeDetails&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.image, image) || other.image == image)&&(identical(other.readyInMinutes, readyInMinutes) || other.readyInMinutes == readyInMinutes)&&(identical(other.servings, servings) || other.servings == servings)&&(identical(other.instructions, instructions) || other.instructions == instructions)&&const DeepCollectionEquality().equals(other._extendedIngredients, _extendedIngredients));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,image,readyInMinutes,servings,instructions,const DeepCollectionEquality().hash(_extendedIngredients));

@override
String toString() {
  return 'RecipeDetails(id: $id, title: $title, image: $image, readyInMinutes: $readyInMinutes, servings: $servings, instructions: $instructions, extendedIngredients: $extendedIngredients)';
}


}

/// @nodoc
abstract mixin class _$RecipeDetailsCopyWith<$Res> implements $RecipeDetailsCopyWith<$Res> {
  factory _$RecipeDetailsCopyWith(_RecipeDetails value, $Res Function(_RecipeDetails) _then) = __$RecipeDetailsCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String? image, int readyInMinutes, int servings, String? instructions, List<ExtendedIngredient> extendedIngredients
});




}
/// @nodoc
class __$RecipeDetailsCopyWithImpl<$Res>
    implements _$RecipeDetailsCopyWith<$Res> {
  __$RecipeDetailsCopyWithImpl(this._self, this._then);

  final _RecipeDetails _self;
  final $Res Function(_RecipeDetails) _then;

/// Create a copy of RecipeDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? image = freezed,Object? readyInMinutes = null,Object? servings = null,Object? instructions = freezed,Object? extendedIngredients = null,}) {
  return _then(_RecipeDetails(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,readyInMinutes: null == readyInMinutes ? _self.readyInMinutes : readyInMinutes // ignore: cast_nullable_to_non_nullable
as int,servings: null == servings ? _self.servings : servings // ignore: cast_nullable_to_non_nullable
as int,instructions: freezed == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String?,extendedIngredients: null == extendedIngredients ? _self._extendedIngredients : extendedIngredients // ignore: cast_nullable_to_non_nullable
as List<ExtendedIngredient>,
  ));
}


}


/// @nodoc
mixin _$ExtendedIngredient {

 int get id; String get name; String get original;
/// Create a copy of ExtendedIngredient
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExtendedIngredientCopyWith<ExtendedIngredient> get copyWith => _$ExtendedIngredientCopyWithImpl<ExtendedIngredient>(this as ExtendedIngredient, _$identity);

  /// Serializes this ExtendedIngredient to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExtendedIngredient&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.original, original) || other.original == original));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,original);

@override
String toString() {
  return 'ExtendedIngredient(id: $id, name: $name, original: $original)';
}


}

/// @nodoc
abstract mixin class $ExtendedIngredientCopyWith<$Res>  {
  factory $ExtendedIngredientCopyWith(ExtendedIngredient value, $Res Function(ExtendedIngredient) _then) = _$ExtendedIngredientCopyWithImpl;
@useResult
$Res call({
 int id, String name, String original
});




}
/// @nodoc
class _$ExtendedIngredientCopyWithImpl<$Res>
    implements $ExtendedIngredientCopyWith<$Res> {
  _$ExtendedIngredientCopyWithImpl(this._self, this._then);

  final ExtendedIngredient _self;
  final $Res Function(ExtendedIngredient) _then;

/// Create a copy of ExtendedIngredient
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


/// Adds pattern-matching-related methods to [ExtendedIngredient].
extension ExtendedIngredientPatterns on ExtendedIngredient {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExtendedIngredient value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExtendedIngredient() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExtendedIngredient value)  $default,){
final _that = this;
switch (_that) {
case _ExtendedIngredient():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExtendedIngredient value)?  $default,){
final _that = this;
switch (_that) {
case _ExtendedIngredient() when $default != null:
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
case _ExtendedIngredient() when $default != null:
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
case _ExtendedIngredient():
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
case _ExtendedIngredient() when $default != null:
return $default(_that.id,_that.name,_that.original);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExtendedIngredient implements ExtendedIngredient {
  const _ExtendedIngredient({required this.id, required this.name, required this.original});
  factory _ExtendedIngredient.fromJson(Map<String, dynamic> json) => _$ExtendedIngredientFromJson(json);

@override final  int id;
@override final  String name;
@override final  String original;

/// Create a copy of ExtendedIngredient
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExtendedIngredientCopyWith<_ExtendedIngredient> get copyWith => __$ExtendedIngredientCopyWithImpl<_ExtendedIngredient>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExtendedIngredientToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExtendedIngredient&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.original, original) || other.original == original));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,original);

@override
String toString() {
  return 'ExtendedIngredient(id: $id, name: $name, original: $original)';
}


}

/// @nodoc
abstract mixin class _$ExtendedIngredientCopyWith<$Res> implements $ExtendedIngredientCopyWith<$Res> {
  factory _$ExtendedIngredientCopyWith(_ExtendedIngredient value, $Res Function(_ExtendedIngredient) _then) = __$ExtendedIngredientCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String original
});




}
/// @nodoc
class __$ExtendedIngredientCopyWithImpl<$Res>
    implements _$ExtendedIngredientCopyWith<$Res> {
  __$ExtendedIngredientCopyWithImpl(this._self, this._then);

  final _ExtendedIngredient _self;
  final $Res Function(_ExtendedIngredient) _then;

/// Create a copy of ExtendedIngredient
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? original = null,}) {
  return _then(_ExtendedIngredient(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,original: null == original ? _self.original : original // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
