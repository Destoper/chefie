import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/user_ingredient.dart';
import '../repositories/user_ingredient_repository.dart';
import 'auth_controller.dart'; 

part 'user_ingredient_controller.g.dart';

@riverpod
UserIngredientRepository userIngredientRepository(Ref ref) {
  return UserIngredientRepository();
}

@riverpod
class UserIngredientController extends _$UserIngredientController {
  
  @override
  Future<List<UserIngredient>> build() async {
    final repo = ref.read(userIngredientRepositoryProvider);
    final userId = ref.watch(authControllerProvider.select((auth) => auth.value?.id));

    if (userId == null) {
      return [];
    }
    
    return repo.getUserIngredients(userId);
  }

  Future<void> _refreshState() async {
    state = await AsyncValue.guard(() => build());
  }

  Future<void> addIngredient(UserIngredient ingredient) async {
    await AsyncValue.guard(() async {
      await ref.read(userIngredientRepositoryProvider).addUserIngredient(ingredient);
      await _refreshState();
    });
  }

  Future<void> removeIngredient(String id) async {
    await AsyncValue.guard(() async {
      await ref.read(userIngredientRepositoryProvider).removeUserIngredient(id);
      await _refreshState();
    });
  }

  Future<void> updateIngredient(UserIngredient ingredient) async {
    await AsyncValue.guard(() async {
      await ref.read(userIngredientRepositoryProvider).updateUserIngredient(ingredient);
      await _refreshState();
    });
  }
}