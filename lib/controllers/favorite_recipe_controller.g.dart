// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_recipe_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$favoriteRecipeRepositoryHash() =>
    r'4ef18642e3325ff2c4d3be7aa56739bf82580ecc';

/// See also [favoriteRecipeRepository].
@ProviderFor(favoriteRecipeRepository)
final favoriteRecipeRepositoryProvider =
    AutoDisposeProvider<FavoriteRecipeRepository>.internal(
      favoriteRecipeRepository,
      name: r'favoriteRecipeRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$favoriteRecipeRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FavoriteRecipeRepositoryRef =
    AutoDisposeProviderRef<FavoriteRecipeRepository>;
String _$favoriteRecipeControllerHash() =>
    r'cb8f3fcf2ad985d14bd2d1f4f3bae3788b822d56';

/// See also [FavoriteRecipeController].
@ProviderFor(FavoriteRecipeController)
final favoriteRecipeControllerProvider =
    AutoDisposeAsyncNotifierProvider<
      FavoriteRecipeController,
      List<FavoriteRecipe>
    >.internal(
      FavoriteRecipeController.new,
      name: r'favoriteRecipeControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$favoriteRecipeControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$FavoriteRecipeController =
    AutoDisposeAsyncNotifier<List<FavoriteRecipe>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
