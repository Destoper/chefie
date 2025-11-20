import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IngredienteCategoriaModel {
  String nome;
  Color cor;
  SvgPicture icone;

  IngredienteCategoriaModel({
    required this.nome,
    required this.cor,
    required this.icone,
  });

  static List<IngredienteCategoriaModel> getCategorias(){
    List<IngredienteCategoriaModel> categorias = [];

    categorias.add(IngredienteCategoriaModel(
      nome:"Tempero", 
      cor: Colors.amber.shade200, 
      icone: SvgPicture.asset('assets/icons/tempero.svg')
      )
    );

    return categorias;
  }
}