// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$spoonacularServiceHash() =>
    r'380766f68b80bfd80899a39918ab4d13742ecbc3';

/// See also [spoonacularService].
@ProviderFor(spoonacularService)
final spoonacularServiceProvider =
    AutoDisposeProvider<SpoonacularService>.internal(
      spoonacularService,
      name: r'spoonacularServiceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$spoonacularServiceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SpoonacularServiceRef = AutoDisposeProviderRef<SpoonacularService>;
String _$randomRecipesHash() => r'869eec9d2fcfc7643a14448073b3d587589be324';

/// See also [randomRecipes].
@ProviderFor(randomRecipes)
final randomRecipesProvider =
    AutoDisposeFutureProvider<List<RecipeDetails>>.internal(
      randomRecipes,
      name: r'randomRecipesProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$randomRecipesHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RandomRecipesRef = AutoDisposeFutureProviderRef<List<RecipeDetails>>;
String _$recipeDetailsHash() => r'3c2588f0688d8da187769c8f507a7bb78f16a1e5';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [recipeDetails].
@ProviderFor(recipeDetails)
const recipeDetailsProvider = RecipeDetailsFamily();

/// See also [recipeDetails].
class RecipeDetailsFamily extends Family<AsyncValue<RecipeDetails>> {
  /// See also [recipeDetails].
  const RecipeDetailsFamily();

  /// See also [recipeDetails].
  RecipeDetailsProvider call({required int recipeId}) {
    return RecipeDetailsProvider(recipeId: recipeId);
  }

  @override
  RecipeDetailsProvider getProviderOverride(
    covariant RecipeDetailsProvider provider,
  ) {
    return call(recipeId: provider.recipeId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'recipeDetailsProvider';
}

/// See also [recipeDetails].
class RecipeDetailsProvider extends AutoDisposeFutureProvider<RecipeDetails> {
  /// See also [recipeDetails].
  RecipeDetailsProvider({required int recipeId})
    : this._internal(
        (ref) => recipeDetails(ref as RecipeDetailsRef, recipeId: recipeId),
        from: recipeDetailsProvider,
        name: r'recipeDetailsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$recipeDetailsHash,
        dependencies: RecipeDetailsFamily._dependencies,
        allTransitiveDependencies:
            RecipeDetailsFamily._allTransitiveDependencies,
        recipeId: recipeId,
      );

  RecipeDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.recipeId,
  }) : super.internal();

  final int recipeId;

  @override
  Override overrideWith(
    FutureOr<RecipeDetails> Function(RecipeDetailsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RecipeDetailsProvider._internal(
        (ref) => create(ref as RecipeDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        recipeId: recipeId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<RecipeDetails> createElement() {
    return _RecipeDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RecipeDetailsProvider && other.recipeId == recipeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, recipeId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RecipeDetailsRef on AutoDisposeFutureProviderRef<RecipeDetails> {
  /// The parameter `recipeId` of this provider.
  int get recipeId;
}

class _RecipeDetailsProviderElement
    extends AutoDisposeFutureProviderElement<RecipeDetails>
    with RecipeDetailsRef {
  _RecipeDetailsProviderElement(super.provider);

  @override
  int get recipeId => (origin as RecipeDetailsProvider).recipeId;
}

String _$recipeControllerHash() => r'6da22b2960812913596b33e856a0091306ddda65';

/// See also [RecipeController].
@ProviderFor(RecipeController)
final recipeControllerProvider =
    AutoDisposeNotifierProvider<
      RecipeController,
      AsyncValue<List<RecipeApi>>
    >.internal(
      RecipeController.new,
      name: r'recipeControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$recipeControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$RecipeController = AutoDisposeNotifier<AsyncValue<List<RecipeApi>>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
