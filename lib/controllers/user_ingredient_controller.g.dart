// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_ingredient_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userIngredientRepositoryHash() =>
    r'82256c2b4886e8480f0c097a77a02b31079952a3';

/// See also [userIngredientRepository].
@ProviderFor(userIngredientRepository)
final userIngredientRepositoryProvider =
    AutoDisposeProvider<UserIngredientRepository>.internal(
      userIngredientRepository,
      name: r'userIngredientRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$userIngredientRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UserIngredientRepositoryRef =
    AutoDisposeProviderRef<UserIngredientRepository>;
String _$userIngredientControllerHash() =>
    r'd67c2c21e9e7bd5079166566ff947fee0d6e9196';

/// See also [UserIngredientController].
@ProviderFor(UserIngredientController)
final userIngredientControllerProvider =
    AsyncNotifierProvider<
      UserIngredientController,
      List<UserIngredient>
    >.internal(
      UserIngredientController.new,
      name: r'userIngredientControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$userIngredientControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$UserIngredientController = AsyncNotifier<List<UserIngredient>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
