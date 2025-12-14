import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:translator/translator.dart';
import '../config/env.dart';
import '../models/recipe_api.dart';
import '../models/recipe_details.dart';

class SpoonacularService {
  static const String _baseUrl = 'https://api.spoonacular.com';
  final _translator = GoogleTranslator();

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
        final recipes = data.map((json) => RecipeApi.fromJson(json)).toList();

        final titles = recipes.map((r) => r.title).join(' ||| ');
        if (titles.isNotEmpty) {
          final translated = await _translator.translate(titles, to: 'pt');
          final splitTitles = translated.text.split(' ||| ');
          
          for (var i = 0; i < recipes.length; i++) {
            if (i < splitTitles.length) {
              recipes[i] = recipes[i].copyWith(title: splitTitles[i].trim());
            }
          }
        }
        
        return recipes;
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
        final recipe = RecipeDetails.fromApiJson(json.decode(response.body));
        return recipe; 
        
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
        final List<dynamic> recipesJson = data['recipes'];
        final recipes = recipesJson.map((json) => RecipeDetails.fromApiJson(json)).toList();
        
        return await Future.wait(recipes.map((r) => translateRecipe(r)));
      } else if (response.statusCode == 402) {
        throw Exception('Daily API limit reached.');
      } else {
        throw Exception('Error fetching random recipes: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Connection error: $e');
    }
  }

  Future<RecipeDetails> translateRecipe(RecipeDetails recipe) async {
    try {
      final results = await Future.wait([
        _translator.translate(recipe.title, to: 'pt'),
        recipe.instructions != null && recipe.instructions!.isNotEmpty
            ? _translator.translate(recipe.instructions!, to: 'pt')
            : Future.value(null),
      ]);

      List<ExtendedIngredient> translatedIngredients = [];
      if (recipe.extendedIngredients.isNotEmpty) {
        final ingredientsText = recipe.extendedIngredients
            .map((e) => e.original)
            .join(' ||| '); 
        
        final ingredientsTranslation = await _translator.translate(ingredientsText, to: 'pt');
        final splitIngredients = ingredientsTranslation.text.split(' ||| ');

        for (int i = 0; i < recipe.extendedIngredients.length; i++) {
            final translatedDisplay = i < splitIngredients.length 
                ? splitIngredients[i].trim() 
                : recipe.extendedIngredients[i].original;

            translatedIngredients.add(
              recipe.extendedIngredients[i].copyWith(
                original: translatedDisplay,  
              ),
            );
        }
      }

      return recipe.copyWith(
        title: results[0]!.text,
        instructions: results[1]?.text ?? recipe.instructions,
        extendedIngredients: translatedIngredients.isNotEmpty 
            ? translatedIngredients 
            : recipe.extendedIngredients,
      );

    } catch (e) {
      return recipe;
    }
  }
}