import '../models/user_ingredient.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserIngredientRepository {
  final SupabaseClient _supabase = Supabase.instance.client;
  static const String _table = 'user_ingredients';

  Future<List<UserIngredient>> getUserIngredients(String userId) async {
    final response = await _supabase
        .from(_table)
        .select()
        .eq('user_id', userId);

    return (response as List)
        .map((json) => UserIngredient.fromJson(json))
        .toList();
  }

  Future<void> addUserIngredient(UserIngredient ingredient) async {
    await _supabase
        .from(_table)
        .insert(ingredient.toJson());
  }

  Future<void> removeUserIngredient(String id) async {
    await _supabase
        .from(_table)
        .delete()
        .eq('id', id);
  }

  Future<void> updateUserIngredient(UserIngredient ingredient) async {
    await _supabase
        .from(_table)
        .update(ingredient.toJson())
        .eq('id', ingredient.id);
  }
}