import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/favorite_recipe.dart';
import '../repositories/favorite_recipe_repository.dart';

part 'favorite_recipe_controller.g.dart';

@riverpod
FavoriteRecipeRepository favoriteRecipeRepository(Ref ref) {
  return FavoriteRecipeRepository();
}

@riverpod
class FavoriteRecipeController extends _$FavoriteRecipeController {
  
  @override
  Future<List<FavoriteRecipe>> build() async {
    final repo = ref.read(favoriteRecipeRepositoryProvider);
    return repo.getAll();
  }

  Future<void> _refreshState() async {
    state = await AsyncValue.guard(() {
      return ref.read(favoriteRecipeRepositoryProvider).getAll();
    });
  }

  Future<void> create(FavoriteRecipe recipe) async {
    await AsyncValue.guard(() async {
      await ref.read(favoriteRecipeRepositoryProvider).create(recipe);
      await _refreshState(); 
    });
  }

  Future<void> deleteByApiId(int apiId) async {
    await AsyncValue.guard(() async {
      await ref.read(favoriteRecipeRepositoryProvider).deleteByApiId(apiId);
      await _refreshState(); 
    });
  }


  bool isFavorita(int apiId) {
    if (!state.hasValue) return false;
    
    return state.value!.any((fav) => fav.apiId == apiId);
  }
}