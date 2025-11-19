import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/favorite_recipe.dart';

class FavoriteRecipeRepository {
  final SupabaseClient _supabase = Supabase.instance.client;
  final String _tableName = 'receitas_favoritas';

  Future<FavoriteRecipe> create(FavoriteRecipe recipe) async {
    final response = await _supabase
        .from(_tableName)
        .insert(recipe.toJson())
        .select()
        .single();

    return FavoriteRecipe.fromJson(response);
  }

  Future<List<FavoriteRecipe>> getAll() async {
    final response = await _supabase
        .from(_tableName)
        .select()
        .order('created_at', ascending: false);

    return (response as List)
        .map((json) => FavoriteRecipe.fromJson(json))
        .toList();
  }

  Future<FavoriteRecipe?> getByApiId(int apiId) async {
    final response = await _supabase
        .from(_tableName)
        .select()
        .eq('api_id', apiId)
        .maybeSingle();

    if (response == null) return null;
    return FavoriteRecipe.fromJson(response);
  }

  Future<bool> isFavorita(int apiId) async {
    final receita = await getByApiId(apiId);
    return receita != null;
  }

  Future<void> delete(String id) async {
    await _supabase.from(_tableName).delete().eq('id', id);
  }

  Future<void> deleteByApiId(int apiId) async {
    await _supabase.from(_tableName).delete().eq('api_id', apiId);
  }
}