import 'package:flutter/material.dart';
import 'package:chefie/models/ingrediente_categoria.dart';

class IngredienteModel {
  String nome;
  int quantidade;
  IngredienteCategoriaModel categoria;

  IngredienteModel({
    required this.nome,
    required this.quantidade,
    required this.categoria,
  });

  static List<IngredienteModel> getIngredientes(){
    List<IngredienteModel> ingredientes = [];

    ingredientes.add(
      IngredienteModel(
        nome: "Tomate",
        quantidade: 500,
        categoria: IngredienteCategoriaModel.categoriaFruta(),        
      )
    );

    ingredientes.add(
      IngredienteModel(
        nome: "Frango",
        quantidade: 2,
        categoria: IngredienteCategoriaModel.categoriaCarne(),
      )
    );

    ingredientes.add(
      IngredienteModel(
        nome: "Arroz",
        quantidade: 1000,
        categoria: IngredienteCategoriaModel.categoriaGrao(),        
      )
    );

    return ingredientes;
  }
}