import 'package:flutter/material.dart';
import 'package:chefie/models/ingrediente_categoria.dart';

class IngredienteModel {
  String nome;
  int quantidade;
  String categoria;

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
        categoria: "Fruta",        
      )
    );

    ingredientes.add(
      IngredienteModel(
        nome: "Frango",
        quantidade: 2,
        categoria: "Carne",        
      )
    );

    ingredientes.add(
      IngredienteModel(
        nome: "Arroz",
        quantidade: 1000,
        categoria: "Grão",        
      )
    );

    return ingredientes;
  }
}