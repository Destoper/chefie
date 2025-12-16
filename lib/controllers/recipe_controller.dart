import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/recipe_api.dart';
import '../models/recipe_details.dart'; 
import '../services/spoonacular_service.dart';

part 'recipe_controller.g.dart';

@riverpod
SpoonacularService spoonacularService(Ref ref) {
  return SpoonacularService();
}


// for home
@riverpod
Future<List<RecipeDetails>> randomRecipes(Ref ref) async {
  final service = ref.watch(spoonacularServiceProvider);
  return service.getRandomRecipes(number: 6);
}

@riverpod
Future<RecipeDetails> recipeDetails(Ref ref, {required int recipeId}) async {
  final service = ref.watch(spoonacularServiceProvider);
  return service.getRecipeDetails(recipeId);
}

@Riverpod(keepAlive: true)
class RecipeController extends _$RecipeController {
  
  List<String> _lastUsedIngredients = [];
  List<String> get lastUsedIngredients => _lastUsedIngredients;

  @override
  AsyncValue<List<RecipeApi>> build() {
    return const AsyncValue.data([]);
  }

  SpoonacularService get _service => ref.read(spoonacularServiceProvider);

  Future<void> searchRecipes(List<String> ingredients) async {
    if (ingredients.isEmpty) {
      state = const AsyncValue.data([]);
      _lastUsedIngredients = [];
      return;
    }
    
    _lastUsedIngredients = List.from(ingredients);

    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      return await _service.findByIngredients(ingredients, number: 20);
    });
  }

  void clearSearch() {
    state = const AsyncValue.data([]);
    _lastUsedIngredients = [];
  }
}