// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_recipe.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FavoriteRecipe {

 String get id; String get userId; int get apiId; String get title; String? get imageUrl; int get readyInMinutes; int get servings; String? get instructions; List<String> get ingredients; DateTime? get createdAt; String? get notes; int? get rating; DateTime? get lastCookedAt;
/// Create a copy of FavoriteRecipe
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FavoriteRecipeCopyWith<FavoriteRecipe> get copyWith => _$FavoriteRecipeCopyWithImpl<FavoriteRecipe>(this as FavoriteRecipe, _$identity);

  /// Serializes this FavoriteRecipe to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavoriteRecipe&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.apiId, apiId) || other.apiId == apiId)&&(identical(other.title, title) || other.title == title)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.readyInMinutes, readyInMinutes) || other.readyInMinutes == readyInMinutes)&&(identical(other.servings, servings) || other.servings == servings)&&(identical(other.instructions, instructions) || other.instructions == instructions)&&const DeepCollectionEquality().equals(other.ingredients, ingredients)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.lastCookedAt, lastCookedAt) || other.lastCookedAt == lastCookedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,apiId,title,imageUrl,readyInMinutes,servings,instructions,const DeepCollectionEquality().hash(ingredients),createdAt,notes,rating,lastCookedAt);

@override
String toString() {
  return 'FavoriteRecipe(id: $id, userId: $userId, apiId: $apiId, title: $title, imageUrl: $imageUrl, readyInMinutes: $readyInMinutes, servings: $servings, instructions: $instructions, ingredients: $ingredients, createdAt: $createdAt, notes: $notes, rating: $rating, lastCookedAt: $lastCookedAt)';
}


}

/// @nodoc
abstract mixin class $FavoriteRecipeCopyWith<$Res>  {
  factory $FavoriteRecipeCopyWith(FavoriteRecipe value, $Res Function(FavoriteRecipe) _then) = _$FavoriteRecipeCopyWithImpl;
@useResult
$Res call({
 String id, String userId, int apiId, String title, String? imageUrl, int readyInMinutes, int servings, String? instructions, List<String> ingredients, DateTime? createdAt, String? notes, int? rating, DateTime? lastCookedAt
});




}
/// @nodoc
class _$FavoriteRecipeCopyWithImpl<$Res>
    implements $FavoriteRecipeCopyWith<$Res> {
  _$FavoriteRecipeCopyWithImpl(this._self, this._then);

  final FavoriteRecipe _self;
  final $Res Function(FavoriteRecipe) _then;

/// Create a copy of FavoriteRecipe
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? apiId = null,Object? title = null,Object? imageUrl = freezed,Object? readyInMinutes = null,Object? servings = null,Object? instructions = freezed,Object? ingredients = null,Object? createdAt = freezed,Object? notes = freezed,Object? rating = freezed,Object? lastCookedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,apiId: null == apiId ? _self.apiId : apiId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,readyInMinutes: null == readyInMinutes ? _self.readyInMinutes : readyInMinutes // ignore: cast_nullable_to_non_nullable
as int,servings: null == servings ? _self.servings : servings // ignore: cast_nullable_to_non_nullable
as int,instructions: freezed == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String?,ingredients: null == ingredients ? _self.ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int?,lastCookedAt: freezed == lastCookedAt ? _self.lastCookedAt : lastCookedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [FavoriteRecipe].
extension FavoriteRecipePatterns on FavoriteRecipe {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FavoriteRecipe value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FavoriteRecipe() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FavoriteRecipe value)  $default,){
final _that = this;
switch (_that) {
case _FavoriteRecipe():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FavoriteRecipe value)?  $default,){
final _that = this;
switch (_that) {
case _FavoriteRecipe() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  int apiId,  String title,  String? imageUrl,  int readyInMinutes,  int servings,  String? instructions,  List<String> ingredients,  DateTime? createdAt,  String? notes,  int? rating,  DateTime? lastCookedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FavoriteRecipe() when $default != null:
return $default(_that.id,_that.userId,_that.apiId,_that.title,_that.imageUrl,_that.readyInMinutes,_that.servings,_that.instructions,_that.ingredients,_that.createdAt,_that.notes,_that.rating,_that.lastCookedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  int apiId,  String title,  String? imageUrl,  int readyInMinutes,  int servings,  String? instructions,  List<String> ingredients,  DateTime? createdAt,  String? notes,  int? rating,  DateTime? lastCookedAt)  $default,) {final _that = this;
switch (_that) {
case _FavoriteRecipe():
return $default(_that.id,_that.userId,_that.apiId,_that.title,_that.imageUrl,_that.readyInMinutes,_that.servings,_that.instructions,_that.ingredients,_that.createdAt,_that.notes,_that.rating,_that.lastCookedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  int apiId,  String title,  String? imageUrl,  int readyInMinutes,  int servings,  String? instructions,  List<String> ingredients,  DateTime? createdAt,  String? notes,  int? rating,  DateTime? lastCookedAt)?  $default,) {final _that = this;
switch (_that) {
case _FavoriteRecipe() when $default != null:
return $default(_that.id,_that.userId,_that.apiId,_that.title,_that.imageUrl,_that.readyInMinutes,_that.servings,_that.instructions,_that.ingredients,_that.createdAt,_that.notes,_that.rating,_that.lastCookedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FavoriteRecipe implements FavoriteRecipe {
  const _FavoriteRecipe({required this.id, required this.userId, required this.apiId, required this.title, this.imageUrl, this.readyInMinutes = 0, this.servings = 0, this.instructions, final  List<String> ingredients = const [], this.createdAt, this.notes, this.rating, this.lastCookedAt}): _ingredients = ingredients;
  factory _FavoriteRecipe.fromJson(Map<String, dynamic> json) => _$FavoriteRecipeFromJson(json);

@override final  String id;
@override final  String userId;
@override final  int apiId;
@override final  String title;
@override final  String? imageUrl;
@override@JsonKey() final  int readyInMinutes;
@override@JsonKey() final  int servings;
@override final  String? instructions;
 final  List<String> _ingredients;
@override@JsonKey() List<String> get ingredients {
  if (_ingredients is EqualUnmodifiableListView) return _ingredients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ingredients);
}

@override final  DateTime? createdAt;
@override final  String? notes;
@override final  int? rating;
@override final  DateTime? lastCookedAt;

/// Create a copy of FavoriteRecipe
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FavoriteRecipeCopyWith<_FavoriteRecipe> get copyWith => __$FavoriteRecipeCopyWithImpl<_FavoriteRecipe>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FavoriteRecipeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FavoriteRecipe&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.apiId, apiId) || other.apiId == apiId)&&(identical(other.title, title) || other.title == title)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.readyInMinutes, readyInMinutes) || other.readyInMinutes == readyInMinutes)&&(identical(other.servings, servings) || other.servings == servings)&&(identical(other.instructions, instructions) || other.instructions == instructions)&&const DeepCollectionEquality().equals(other._ingredients, _ingredients)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.lastCookedAt, lastCookedAt) || other.lastCookedAt == lastCookedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,apiId,title,imageUrl,readyInMinutes,servings,instructions,const DeepCollectionEquality().hash(_ingredients),createdAt,notes,rating,lastCookedAt);

@override
String toString() {
  return 'FavoriteRecipe(id: $id, userId: $userId, apiId: $apiId, title: $title, imageUrl: $imageUrl, readyInMinutes: $readyInMinutes, servings: $servings, instructions: $instructions, ingredients: $ingredients, createdAt: $createdAt, notes: $notes, rating: $rating, lastCookedAt: $lastCookedAt)';
}


}

/// @nodoc
abstract mixin class _$FavoriteRecipeCopyWith<$Res> implements $FavoriteRecipeCopyWith<$Res> {
  factory _$FavoriteRecipeCopyWith(_FavoriteRecipe value, $Res Function(_FavoriteRecipe) _then) = __$FavoriteRecipeCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, int apiId, String title, String? imageUrl, int readyInMinutes, int servings, String? instructions, List<String> ingredients, DateTime? createdAt, String? notes, int? rating, DateTime? lastCookedAt
});




}
/// @nodoc
class __$FavoriteRecipeCopyWithImpl<$Res>
    implements _$FavoriteRecipeCopyWith<$Res> {
  __$FavoriteRecipeCopyWithImpl(this._self, this._then);

  final _FavoriteRecipe _self;
  final $Res Function(_FavoriteRecipe) _then;

/// Create a copy of FavoriteRecipe
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? apiId = null,Object? title = null,Object? imageUrl = freezed,Object? readyInMinutes = null,Object? servings = null,Object? instructions = freezed,Object? ingredients = null,Object? createdAt = freezed,Object? notes = freezed,Object? rating = freezed,Object? lastCookedAt = freezed,}) {
  return _then(_FavoriteRecipe(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,apiId: null == apiId ? _self.apiId : apiId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,readyInMinutes: null == readyInMinutes ? _self.readyInMinutes : readyInMinutes // ignore: cast_nullable_to_non_nullable
as int,servings: null == servings ? _self.servings : servings // ignore: cast_nullable_to_non_nullable
as int,instructions: freezed == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String?,ingredients: null == ingredients ? _self._ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int?,lastCookedAt: freezed == lastCookedAt ? _self.lastCookedAt : lastCookedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
