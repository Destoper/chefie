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
String _$isFavoriteHash() => r'db85158ef058829c0c96ec9837ed58a851cc66f1';

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

/// See also [isFavorite].
@ProviderFor(isFavorite)
const isFavoriteProvider = IsFavoriteFamily();

/// See also [isFavorite].
class IsFavoriteFamily extends Family<AsyncValue<bool>> {
  /// See also [isFavorite].
  const IsFavoriteFamily();

  /// See also [isFavorite].
  IsFavoriteProvider call(int apiId) {
    return IsFavoriteProvider(apiId);
  }

  @override
  IsFavoriteProvider getProviderOverride(
    covariant IsFavoriteProvider provider,
  ) {
    return call(provider.apiId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'isFavoriteProvider';
}

/// See also [isFavorite].
class IsFavoriteProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [isFavorite].
  IsFavoriteProvider(int apiId)
    : this._internal(
        (ref) => isFavorite(ref as IsFavoriteRef, apiId),
        from: isFavoriteProvider,
        name: r'isFavoriteProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$isFavoriteHash,
        dependencies: IsFavoriteFamily._dependencies,
        allTransitiveDependencies: IsFavoriteFamily._allTransitiveDependencies,
        apiId: apiId,
      );

  IsFavoriteProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.apiId,
  }) : super.internal();

  final int apiId;

  @override
  Override overrideWith(
    FutureOr<bool> Function(IsFavoriteRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: IsFavoriteProvider._internal(
        (ref) => create(ref as IsFavoriteRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        apiId: apiId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _IsFavoriteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IsFavoriteProvider && other.apiId == apiId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, apiId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin IsFavoriteRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `apiId` of this provider.
  int get apiId;
}

class _IsFavoriteProviderElement extends AutoDisposeFutureProviderElement<bool>
    with IsFavoriteRef {
  _IsFavoriteProviderElement(super.provider);

  @override
  int get apiId => (origin as IsFavoriteProvider).apiId;
}

String _$favoriteControllerHash() =>
    r'755058dc8395de087cb59ccc6b2fb222c223c7b8';

/// See also [FavoriteController].
@ProviderFor(FavoriteController)
final favoriteControllerProvider =
    AutoDisposeAsyncNotifierProvider<
      FavoriteController,
      List<FavoriteRecipe>
    >.internal(
      FavoriteController.new,
      name: r'favoriteControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$favoriteControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$FavoriteController = AutoDisposeAsyncNotifier<List<FavoriteRecipe>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
