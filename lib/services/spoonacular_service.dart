import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/env.dart';
import '../models/recipe_api.dart';
import '../models/recipe_details.dart';

class SpoonacularService {
  static const String _baseUrl = 'https://api.spoonacular.com';

  Future<List<RecipeApi>> findByIngredients(
    List<String> ingredients, {
    int number = 10,
  }) async {
    if (ingredients.isEmpty) {
      throw Exception('Add at least one ingredient');
    }

    final ingredientsStr = ingredients.join(',');

    final url = Uri.parse(
      '$_baseUrl/recipes/findByIngredients'
      '?ingredients=$ingredientsStr'
      '&number=$number'
      '&ranking=2'
      '&ignorePantry=true'
      '&apiKey=${Env.spoonacularApiKey}',
    );

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => RecipeApi.fromJson(json)).toList();
      } else if (response.statusCode == 402) {
        throw Exception('Daily API limit reached.');
      } else {
        throw Exception('Error fetching recipes: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Connection error: $e');
    }
  }

  Future<RecipeDetails> getRecipeDetails(int recipeId) async {
    final url = Uri.parse(
      '$_baseUrl/recipes/$recipeId/information'
      '?apiKey=${Env.spoonacularApiKey}'
      '&includeNutrition=false',
    );

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        return RecipeDetails.fromApiJson(json.decode(response.body));
      } else if (response.statusCode == 402) {
        throw Exception('Daily API limit reached.');
      } else {
        throw Exception('Error fetching details: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Connection error: $e');
    }
  }

  Future<List<RecipeDetails>> getRandomRecipes({int number = 6}) async {
    final url = Uri.parse(
      '$_baseUrl/recipes/random'
      '?number=$number'
      '&apiKey=${Env.spoonacularApiKey}',
    );

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> recipes = data['recipes'];
        return recipes.map((json) => RecipeDetails.fromApiJson(json)).toList();
      } else if (response.statusCode == 402) {
        throw Exception('Daily API limit reached.');
      } else {
        throw Exception('Error fetching random recipes: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Connection error: $e');
    }
  }
}