import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/favorite_recipe.dart';
import '../models/recipe_details.dart';

class FavoriteRecipeRepository {
  final SupabaseClient _supabase = Supabase.instance.client;
  static const String _table = 'favorite_recipes';

  String get _userId => _supabase.auth.currentUser!.id;

  Future<FavoriteRecipe> create(RecipeDetails recipe) async {
    final response = await _supabase
        .from(_table)
        .insert({
          'user_id': _userId,
          'api_id': recipe.id,
          'title': recipe.title,
          'image_url': recipe.image,
          'ready_in_minutes': recipe.readyInMinutes,
          'servings': recipe.servings,
          'instructions': recipe.instructions,
          'ingredients': recipe.extendedIngredients
              .map((ing) => ing.original)
              .toList(),
        })
        .select()
        .single();

    return FavoriteRecipe.fromJson(response);
  }

  Future<List<FavoriteRecipe>> getAll() async {
    final response = await _supabase
        .from(_table)
        .select()
        .eq('user_id', _userId)
        .order('created_at', ascending: false);

    return (response as List)
        .map((json) => FavoriteRecipe.fromJson(json))
        .toList();
  }

  Future<FavoriteRecipe?> getByApiId(int apiId) async {
    final response = await _supabase
        .from(_table)
        .select()
        .eq('user_id', _userId)
        .eq('api_id', apiId)
        .maybeSingle();

    if (response == null) return null;
    return FavoriteRecipe.fromJson(response);
  }

  Future<FavoriteRecipe?> update({
    required String id,
    String? notes,
    int? rating,
    DateTime? lastCookedAt,
  }) async {
    final updates = <String, dynamic>{};
    
    if (notes != null) updates['notes'] = notes;
    if (rating != null) updates['rating'] = rating;
    if (lastCookedAt != null) updates['last_cooked_at'] = lastCookedAt.toIso8601String();

    if (updates.isEmpty) {
      return null; 
    }

    final response = await _supabase
        .from(_table)
        .update(updates)
        .eq('id', id)
        .eq('user_id', _userId) 
        .select()
        .maybeSingle();

    if (response == null) {
      throw Exception("Não foi possível atualizar. Talvez sejam as permissões RLS.");
    }

    return FavoriteRecipe.fromJson(response);
  }

  Future<void> delete(String id) async {
    await _supabase
        .from(_table)
        .delete()
        .eq('id', id)
        .eq('user_id', _userId);
  }

  Future<void> deleteByApiId(int apiId) async {
    await _supabase
        .from(_table)
        .delete()
        .eq('user_id', _userId)
        .eq('api_id', apiId);
  }

  Future<bool> isFavorite(int apiId) async {
    final recipe = await getByApiId(apiId);
    return recipe != null;
  }

  Future<bool> toggleFavorite(RecipeDetails recipe) async {
    final isFav = await isFavorite(recipe.id);
    
    if (isFav) {
      await deleteByApiId(recipe.id);
      return false;
    } else {
      await create(recipe);
      return true;
    }
  }

  Future<FavoriteRecipe?> markAsCooked(String id) async {
    return await update(
      id: id,
      lastCookedAt: DateTime.now(),
    );
  }
}