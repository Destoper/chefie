import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/global_ingredient.dart';
import '../repositories/global_ingredient_repository.dart';

part 'global_ingredient_controller.g.dart';

@riverpod
GlobalIngredientRepository globalIngredientRepository(Ref ref) {
  return GlobalIngredientRepository();
}

@riverpod
class GlobalIngredientController extends _$GlobalIngredientController {
  
  @override
  Future<List<GlobalIngredient>> build() async {
    final repo = ref.read(globalIngredientRepositoryProvider);
    return repo.getAll();
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return ref.read(globalIngredientRepositoryProvider).getAll();
    });
  }

  Future<List<GlobalIngredient>> getIngredientsByNamePrefix(String namePrefix) async {
    return ref.read(globalIngredientRepositoryProvider).getByNamePrefix(namePrefix);
  }
}