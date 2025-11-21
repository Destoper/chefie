import 'package:chefie/modelviews/ingrediente_categoria.dart';
import 'package:chefie/modelviews/unidades.dart';

class IngredienteModel {
  String nome;
  int quantidade;
  Unidade unidade;
  IngredienteCategoriaModel categoria;

  IngredienteModel({
    required this.nome,
    required this.quantidade,
    required this.unidade,
    required this.categoria,
  });

  static List<IngredienteModel> getIngredientes(){
    List<IngredienteModel> ingredientes = [];

    ingredientes.add(
      IngredienteModel(
        nome: "Tomate",
        quantidade: 500,
        unidade: Unidade(name: "g"),
        categoria: IngredienteCategoriaModel.categoriaFruta(),        
      )
    );

    ingredientes.add(
      IngredienteModel(
        nome: "Frango",
        quantidade: 2,
        unidade: Unidade(name: "un"),
        categoria: IngredienteCategoriaModel.categoriaCarne(),
      )
    );

    ingredientes.add(
      IngredienteModel(
        nome: "Arroz",
        quantidade: 1000,
        unidade: Unidade(name: "g"),
        categoria: IngredienteCategoriaModel.categoriaGrao(),        
      )
    );

    return ingredientes;
  }
}