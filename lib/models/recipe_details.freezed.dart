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

 int get id; String get title; String? get image; int get readyInMinutes; int get servings; String? get instructions; List<String> get ingredients;
/// Create a copy of RecipeDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeDetailsCopyWith<RecipeDetails> get copyWith => _$RecipeDetailsCopyWithImpl<RecipeDetails>(this as RecipeDetails, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecipeDetails&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.image, image) || other.image == image)&&(identical(other.readyInMinutes, readyInMinutes) || other.readyInMinutes == readyInMinutes)&&(identical(other.servings, servings) || other.servings == servings)&&(identical(other.instructions, instructions) || other.instructions == instructions)&&const DeepCollectionEquality().equals(other.ingredients, ingredients));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,image,readyInMinutes,servings,instructions,const DeepCollectionEquality().hash(ingredients));

@override
String toString() {
  return 'RecipeDetails(id: $id, title: $title, image: $image, readyInMinutes: $readyInMinutes, servings: $servings, instructions: $instructions, ingredients: $ingredients)';
}


}

/// @nodoc
abstract mixin class $RecipeDetailsCopyWith<$Res>  {
  factory $RecipeDetailsCopyWith(RecipeDetails value, $Res Function(RecipeDetails) _then) = _$RecipeDetailsCopyWithImpl;
@useResult
$Res call({
 int id, String title, String? image, int readyInMinutes, int servings, String? instructions, List<String> ingredients
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? image = freezed,Object? readyInMinutes = null,Object? servings = null,Object? instructions = freezed,Object? ingredients = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,readyInMinutes: null == readyInMinutes ? _self.readyInMinutes : readyInMinutes // ignore: cast_nullable_to_non_nullable
as int,servings: null == servings ? _self.servings : servings // ignore: cast_nullable_to_non_nullable
as int,instructions: freezed == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String?,ingredients: null == ingredients ? _self.ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<String>,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  String? image,  int readyInMinutes,  int servings,  String? instructions,  List<String> ingredients)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecipeDetails() when $default != null:
return $default(_that.id,_that.title,_that.image,_that.readyInMinutes,_that.servings,_that.instructions,_that.ingredients);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  String? image,  int readyInMinutes,  int servings,  String? instructions,  List<String> ingredients)  $default,) {final _that = this;
switch (_that) {
case _RecipeDetails():
return $default(_that.id,_that.title,_that.image,_that.readyInMinutes,_that.servings,_that.instructions,_that.ingredients);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  String? image,  int readyInMinutes,  int servings,  String? instructions,  List<String> ingredients)?  $default,) {final _that = this;
switch (_that) {
case _RecipeDetails() when $default != null:
return $default(_that.id,_that.title,_that.image,_that.readyInMinutes,_that.servings,_that.instructions,_that.ingredients);case _:
  return null;

}
}

}

/// @nodoc


class _RecipeDetails implements RecipeDetails {
  const _RecipeDetails({required this.id, required this.title, this.image, this.readyInMinutes = 0, this.servings = 0, this.instructions, final  List<String> ingredients = const []}): _ingredients = ingredients;
  

@override final  int id;
@override final  String title;
@override final  String? image;
@override@JsonKey() final  int readyInMinutes;
@override@JsonKey() final  int servings;
@override final  String? instructions;
 final  List<String> _ingredients;
@override@JsonKey() List<String> get ingredients {
  if (_ingredients is EqualUnmodifiableListView) return _ingredients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ingredients);
}


/// Create a copy of RecipeDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipeDetailsCopyWith<_RecipeDetails> get copyWith => __$RecipeDetailsCopyWithImpl<_RecipeDetails>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecipeDetails&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.image, image) || other.image == image)&&(identical(other.readyInMinutes, readyInMinutes) || other.readyInMinutes == readyInMinutes)&&(identical(other.servings, servings) || other.servings == servings)&&(identical(other.instructions, instructions) || other.instructions == instructions)&&const DeepCollectionEquality().equals(other._ingredients, _ingredients));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,image,readyInMinutes,servings,instructions,const DeepCollectionEquality().hash(_ingredients));

@override
String toString() {
  return 'RecipeDetails(id: $id, title: $title, image: $image, readyInMinutes: $readyInMinutes, servings: $servings, instructions: $instructions, ingredients: $ingredients)';
}


}

/// @nodoc
abstract mixin class _$RecipeDetailsCopyWith<$Res> implements $RecipeDetailsCopyWith<$Res> {
  factory _$RecipeDetailsCopyWith(_RecipeDetails value, $Res Function(_RecipeDetails) _then) = __$RecipeDetailsCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String? image, int readyInMinutes, int servings, String? instructions, List<String> ingredients
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? image = freezed,Object? readyInMinutes = null,Object? servings = null,Object? instructions = freezed,Object? ingredients = null,}) {
  return _then(_RecipeDetails(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,readyInMinutes: null == readyInMinutes ? _self.readyInMinutes : readyInMinutes // ignore: cast_nullable_to_non_nullable
as int,servings: null == servings ? _self.servings : servings // ignore: cast_nullable_to_non_nullable
as int,instructions: freezed == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String?,ingredients: null == ingredients ? _self._ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
