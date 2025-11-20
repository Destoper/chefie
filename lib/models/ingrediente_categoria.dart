import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IngredienteCategoriaModel {
  String nome;
  Color cor;
  String icone;

  IngredienteCategoriaModel({
    required this.nome,
    required this.cor,
    required this.icone,
  });

  static List<IngredienteCategoriaModel> getCategorias(){
    List<IngredienteCategoriaModel> categorias = [
      IngredienteCategoriaModel.categoriaCarne(),
      IngredienteCategoriaModel.categoriaVegetal(),
      IngredienteCategoriaModel.categoriaFruta(),
      IngredienteCategoriaModel.categoriaLaticinio(),
      IngredienteCategoriaModel.categoriaGrao(),
      IngredienteCategoriaModel.categoriaTempero(),
    ];

    return categorias;
  }
  static IngredienteCategoriaModel categoriaCarne() {
    return IngredienteCategoriaModel(
      nome:"Carnes", 
      cor: Colors.red.shade200, 
      icone: '🥩', 
    );
  }

  static IngredienteCategoriaModel categoriaVegetal() {
      return IngredienteCategoriaModel(
      nome:"Vegetais", 
      cor: Colors.lightGreen.shade200, 
      icone: '🥬',
    );
  }

  static IngredienteCategoriaModel categoriaFruta () {
    return IngredienteCategoriaModel(
    nome:"Frutas", 
    cor: Colors.yellow.shade200, 
    icone: '🍎',
  );
  }

  static IngredienteCategoriaModel categoriaLaticinio () {
    return IngredienteCategoriaModel (
      nome:"Laticínios", 
      cor: Colors.orange.shade200, 
      icone: '🧀',
    );
  }

  static IngredienteCategoriaModel categoriaGrao () {
    return IngredienteCategoriaModel (
      nome:"Grãos", 
      cor: Colors.amber.shade200, 
      icone: '🍞',
    );
  }

  static IngredienteCategoriaModel categoriaTempero () {
    return IngredienteCategoriaModel (
      nome:"Temperos", 
      cor: Colors.pink.shade100, 
      icone: '🌿',
    );
  }
}
