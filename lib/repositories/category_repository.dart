import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/category.dart';

class CategoryRepository {
  final SupabaseClient _supabase = Supabase.instance.client;
  final String _tableName = 'categories';

  Future<List<Category>> getAll() async {
    final response = await _supabase
        .from(_tableName)
        .select()
        .order('name');

    return (response as List)
        .map((json) => Category.fromJson(json))
        .toList();
  }

  Future<Category?> getById(String id) async {
    final response = await _supabase
        .from(_tableName)
        .select()
        .eq('id', id)
        .maybeSingle();

    if (response == null) return null;
    return Category.fromJson(response);
  }
}