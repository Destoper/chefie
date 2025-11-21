import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/global_ingredient.dart';

class GlobalIngredientRepository {
  final SupabaseClient _supabase = Supabase.instance.client;
  static const String _table = 'global_ingredients';

  Future<List<GlobalIngredient>> getAll() async {
    final response = await _supabase
        .from(_table)
        .select()
        .order('name');

    return (response as List)
        .map((json) => GlobalIngredient.fromJson(json))
        .toList();
  }

  Future<GlobalIngredient?> getById(String id) async {
    final response = await _supabase
        .from(_table)
        .select()
        .eq('id', id)
        .maybeSingle();

    if (response == null) return null;
    return GlobalIngredient.fromJson(response);
  }

  Future<void> create(GlobalIngredient ingredient) async {
    await _supabase
        .from(_table)
        .insert(ingredient.toJson());
  }

  Future<void> update(GlobalIngredient ingredient) async {
    await _supabase
        .from(_table)
        .update(ingredient.toJson())
        .eq('id', ingredient.id);
  }

  Future<void> delete(String id) async {
    await _supabase
        .from(_table)
        .delete()
        .eq('id', id);
  }
}
