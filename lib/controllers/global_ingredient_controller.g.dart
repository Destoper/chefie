// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_ingredient_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$globalIngredientRepositoryHash() =>
    r'0b42e434e810346f380c8eacca9d8183744f4dc7';

/// See also [globalIngredientRepository].
@ProviderFor(globalIngredientRepository)
final globalIngredientRepositoryProvider =
    AutoDisposeProvider<GlobalIngredientRepository>.internal(
      globalIngredientRepository,
      name: r'globalIngredientRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$globalIngredientRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GlobalIngredientRepositoryRef =
    AutoDisposeProviderRef<GlobalIngredientRepository>;
String _$globalIngredientControllerHash() =>
    r'2cd9ab5e32b82d68d905f7bedef4236ce338eedf';

/// See also [GlobalIngredientController].
@ProviderFor(GlobalIngredientController)
final globalIngredientControllerProvider =
    AutoDisposeAsyncNotifierProvider<
      GlobalIngredientController,
      List<GlobalIngredient>
    >.internal(
      GlobalIngredientController.new,
      name: r'globalIngredientControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$globalIngredientControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$GlobalIngredientController =
    AutoDisposeAsyncNotifier<List<GlobalIngredient>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
