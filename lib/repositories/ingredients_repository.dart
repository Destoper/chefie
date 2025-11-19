import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/ingredient.dart';

class IngredientRepository {
  final SupabaseClient _supabase = Supabase.instance.client;
  final String _tableName = 'ingredients';

  Future<Ingredient> create(Ingredient ingredient) async {
    final response = await _supabase
        .from(_tableName)
        .insert(ingredient.toJson())
        .select()
        .single();

    return Ingredient.fromJson(response);
  }

  Future<List<Ingredient>> getAll() async {
    final response = await _supabase
        .from(_tableName)
        .select()
        .order('created_at', ascending: false);

    return (response as List)
        .map((json) => Ingredient.fromJson(json))
        .toList();
  }

  Future<Ingredient?> getById(String id) async {
    final response = await _supabase
        .from(_tableName)
        .select()
        .eq('id', id)
        .maybeSingle();

    if (response == null) return null;
    return Ingredient.fromJson(response);
  }

  Future<Ingredient> update(Ingredient ingredient) async {
    final response = await _supabase
        .from(_tableName)
        .update(ingredient.toJson())
        .eq('id', ingredient.id!)
        .select()
        .single();

    return Ingredient.fromJson(response);
  }

  Future<void> delete(String id) async {
    await _supabase.from(_tableName).delete().eq('id', id);
  }

  Future<List<Ingredient>> getPorCategoria(String categoriaId) async {
    final response = await _supabase
        .from(_tableName)
        .select()
        .eq('categoria_id', categoriaId)
        .order('nome');

    return (response as List)
        .map((json) => Ingredient.fromJson(json))
        .toList();
  }
}