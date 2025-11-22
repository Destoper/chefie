import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/category.dart';
import '../repositories/category_repository.dart';

part 'category_controller.g.dart';

@riverpod
CategoryRepository categoryRepository(Ref ref) {
  return CategoryRepository();
}

@riverpod
class CategoryController extends _$CategoryController {

  @override
  Future<List<Category>> build() async {
    final repo = ref.read(categoryRepositoryProvider);
    return repo.getAll();
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return ref.read(categoryRepositoryProvider).getAll();
    });
  }
}