import 'package:flutter_riverpod/flutter_riverpod.dart'; 
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/favorite_recipe.dart';
import '../models/recipe_details.dart';
import '../repositories/favorite_recipe_repository.dart';

part 'favorite_recipe_controller.g.dart';

@riverpod
FavoriteRecipeRepository favoriteRecipeRepository(Ref ref) { 
  return FavoriteRecipeRepository();
}

@riverpod
class FavoriteController extends _$FavoriteController {
  @override
  Future<List<FavoriteRecipe>> build() async {
    return _fetch();
  }

  FavoriteRecipeRepository get _repository =>
      ref.read(favoriteRecipeRepositoryProvider);

  Future<List<FavoriteRecipe>> _fetch() async {
    return await _repository.getAll();
  }

  Future<void> add(RecipeDetails recipe) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _repository.create(recipe);
      return _fetch();
    });
  }

  Future<void> updateFavorite({
    required String id,
    String? notes,
    int? rating,
    DateTime? lastCookedAt,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _repository.update(
        id: id,
        notes: notes,
        rating: rating,
        lastCookedAt: lastCookedAt,
      );
      return _fetch();
    });
  }

  Future<void> markAsCooked(String id) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _repository.markAsCooked(id);
      return _fetch();
    });
  }

  Future<void> remove(String id) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _repository.delete(id);
      return _fetch();
    });
  }

  Future<void> removeByApiId(int apiId) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _repository.deleteByApiId(apiId);
      return _fetch();
    });
  }

  Future<bool> toggle(RecipeDetails recipe) async {
    final result = await _repository.toggleFavorite(recipe);
    state = await AsyncValue.guard(() => _fetch());
    return result;
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetch());
  }
}

@riverpod
Future<bool> isFavorite(Ref ref, int apiId) async {
  final favorites = await ref.watch(favoriteControllerProvider.future);
  return favorites.any((recipe) => recipe.apiId == apiId);
}