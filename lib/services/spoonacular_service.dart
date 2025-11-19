// lib/services/spoonacular_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/env.dart';
import '../models/recipe_details.dart';
import '../models/recipe_api.dart';

class SpoonacularService {
  static const String _baseUrl = 'https://api.spoonacular.com';

  Future<List<RecipeAPI>> searchByIngredients(
    List<String> ingredients, {
    int quantity = 10,
  }) async {
    if (ingredients.isEmpty) {
      throw Exception('Adicione pelo menos um ingrediente');
    }

    final ingredientsStr = ingredients.join(',');

    final url = Uri.parse(
      '$_baseUrl/recipes/findByIngredients'
      '?ingredients=$ingredientsStr'
      '&number=$quantity'
      '&ranking=2'
      '&ignorePantry=true'
      '&apiKey=${Env.spoonacularApiKey}',
    );

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => RecipeAPI.fromJson(json)).toList();
      } else if (response.statusCode == 402) {
        throw Exception('Limite diário da API atingido. Tente amanhã!');
      } else {
        throw Exception('Erro ao buscar receitas: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erro de conexão: $e');
    }
  }

  Future<RecipeDetails> searchDetails(int recipeId) async {
    final url = Uri.parse(
      '$_baseUrl/recipes/$recipeId/information'
      '?apiKey=${Env.spoonacularApiKey}'
      '&includeNutrition=false',
    );

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        return RecipeDetails.fromJson(json.decode(response.body));
      } else if (response.statusCode == 402) {
        throw Exception('Limite diário da API atingido. Tente amanhã!');
      } else {
        throw Exception('Erro ao buscar detalhes: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erro de conexão: $e');
    }
  }

  // for home screen
  Future<List<RecipeDetails>> searchRandom({
    int quantity = 6,
  }) async {
    final url = Uri.parse(
      '$_baseUrl/recipes/random'
      '?number=$quantity'
      '&apiKey=${Env.spoonacularApiKey}',
    );

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> recipes = data['recipes'];
        return recipes.map((json) => RecipeDetails.fromJson(json)).toList();
      } else if (response.statusCode == 402) {
        throw Exception('Limite diário da API atingido. Tente amanhã!');
      } else {
        throw Exception('Erro ao buscar receitas aleatórias: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erro de conexão: $e');
    }
  }
}