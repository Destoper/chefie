import 'package:chefie/modelviews/ingrediente.dart';
import 'package:chefie/modelviews/ingrediente_categoria.dart';
import 'package:chefie/modelviews/unidades.dart';
import 'package:flutter/material.dart';

class ReceitaModel {
  String name;
  Image image;
  String category;
  Color color;
  int estimatedTimeMin;
  int portionSizePeople;
  int difficulty; // easy - 0, medium - 1, hard 2
  List<IngredienteModel> ingredients;
  String instructions;

  ReceitaModel({
    required this.name,
    required this.image,
    required this.category,
    required this.color,
    required this.estimatedTimeMin,
    required this.portionSizePeople,
    required this.difficulty,
    required this.ingredients,
    required this.instructions,
  });

static List<ReceitaModel> getReceitas(){
  List<ReceitaModel> receitas = [];

  receitas.add(
    ReceitaModel(
      name: "Salada Fresca com Salmão", 
      image: Image.network("https://lh3.googleusercontent.com/aida-public/AB6AXuBTZfocev5P7atMqL5ieZyt60lF96v2c7JvuYvwCL2kSb6vGPF2Cg5luZJXCP9F9rfWaWWCjxnfLtTGSM7NG83hLl3LI327Fsr_sZfIdZ-ni9qx-BO_0-nS7Z73od1JQFxaaYizhtwfMEIsIl4rveh2-MJUHjZeN7FSh3hNqZCBiF8q54z0fJES12MShhYDGu1GHa9fozrtOb14A9Xt_0rC9fSl4nyA5Pu99Kp2AZCQDh9jKKyr64n72Uh6jEuRlYHBKmoAPcFnRNpS"), 
      category: "Salada", 
      color: Colors.green,
      estimatedTimeMin: 15,
      portionSizePeople: 2,
      difficulty: 0,
      instructions: "Asse o salmão e misture tudo.",
      ingredients: [
        IngredienteModel(
            nome: "Salmão", 
            quantidade: 300, 
            unidade: Unidade(name: "g"),
            categoria: IngredienteCategoriaModel.categoriaCarne(),
          ),
        IngredienteModel(
            nome: "Sal", 
            quantidade: 1, 
            unidade: Unidade(name: "g"),
            categoria: IngredienteCategoriaModel.categoriaTempero(),
          ),
        IngredienteModel(
            nome: "Tomate", 
            quantidade: 1, 
            unidade: Unidade(name: "un"),
            categoria: IngredienteCategoriaModel.categoriaFruta(),
          ),
        IngredienteModel(
            nome: "Brócolis", 
            quantidade: 5, 
            unidade: Unidade(name: "un"),
            categoria: IngredienteCategoriaModel.categoriaVegetal(),
          ),
        IngredienteModel(
            nome: "Cenoura", 
            quantidade: 1, 
            unidade: Unidade(name: "un"),
            categoria: IngredienteCategoriaModel.categoriaVegetal(),
          ),
        IngredienteModel(
            nome: "Alface", 
            quantidade: 1, 
            unidade: Unidade(name: "un"),
            categoria: IngredienteCategoriaModel.categoriaVegetal(),
          ),
        ]
    )
  );

  receitas.add(
    ReceitaModel(
      name: "Pizza de Pepperoni Caseira", 
      image: Image.network("https://lh3.googleusercontent.com/aida-public/AB6AXuCngXUggbffAilVyZUX9AwUQMN0ivQjwa43RP_pNzjBqYGbcetVdjTIvEFAqanDa0qg1u19cca75ELIsmV8lN2c1fQPquUqBRIjdyV4qzrvO7xmw0LwdEqTXEsIdS42e3MzeaFtc9Uo9jukCckhOZ3a-U43Qzix8uds0rX6jbVmfAMQ3BQYBzQBlHUxvzb7ibxMBDCYFf6_dsHPniWzcUmLNknYbRo-sS9c78Fpe_99j1A-U3rTSFr5xkw78gaYXYWQCDH-a_aPvM6x"), 
      category: "Italiana", 
      color: Colors.orange.shade200, 
      estimatedTimeMin: 45,
      portionSizePeople: 4,
      difficulty: 1,
      instructions: "Faça a máquina depois asse em um forno por 15 minutos",
      ingredients: [
        IngredienteModel(
            nome: "Queijo", 
            quantidade: 200, 
            unidade: Unidade(name: "g"),
            categoria: IngredienteCategoriaModel.categoriaLaticinio(),
          ),
        IngredienteModel(
            nome: "Pepperoni", 
            quantidade: 100, 
            unidade: Unidade(name: "g"),
            categoria: IngredienteCategoriaModel.categoriaCarne(),
          ),
        IngredienteModel(
            nome: "Massa de Pizza", 
            quantidade: 300, 
            unidade: Unidade(name: "g"),
            categoria: IngredienteCategoriaModel.categoriaGrao(),
          ),
      ]
    )
  );

  receitas.add(
    ReceitaModel(
      name: "Torrada de Abacate com Ovo", 
      image: Image.network("https://lh3.googleusercontent.com/aida-public/AB6AXuCNlbh9wyFpYFxHV_Jnu50vKyOh2KtCOO_lcmT5dMnT41mAfnneU4y6Xa7plNU7kQn_FV13nfWLcjChsrWGBxm-uyn8YnSliv8b3SjIvD6qat4IwYFhEnWl-sm62DXFasPEyoBpz-BkR5ysYcgh6by2JqJcEi2yQTTzgRpilXaHdBXGSk7oJNmIQocSHmuYfcqUjDsJorWizm_JIN6TaVG0bTeli1IrOsWoX7VKJJqkpsmPq9uIagrS47B2dKXQg-WGMRECDncBFmt1"), 
      category: "Café da Manhã", 
      color: Colors.brown.shade300, 
      estimatedTimeMin: 45,
      portionSizePeople: 1,
      difficulty: 0,
      instructions: "Cozinhe os ovos, depois bata com o abacate. Sirva com torradas.",
      ingredients: [
        IngredienteModel(
            nome: "Ovo", 
            quantidade: 5, 
            unidade: Unidade(name: "un"),
            categoria: IngredienteCategoriaModel.categoriaCarne(),
          ),
        IngredienteModel(
            nome: "Abacate", 
            quantidade: 1, 
            unidade: Unidade(name: "un"),
            categoria: IngredienteCategoriaModel.categoriaFruta(),
          ),
        IngredienteModel(
            nome: "Torrada", 
            quantidade: 10, 
            unidade: Unidade(name: "un"),
            categoria: IngredienteCategoriaModel.categoriaGrao(),
          ),
      ]
    )    
  );  

  receitas.add(
    ReceitaModel(
      name: "Bolo de Cenoura com Cobertura de Chocolate", 
      image: Image.network("https://receitatodahora.com.br/wp-content/uploads/2024/11/bolo-de-cenoura-com-chocolate-1411.jpg"), 
      category: "Sobremesa", 
      color: Colors.deepOrange, 
      estimatedTimeMin: 60,
      portionSizePeople: 8,
      difficulty: 2, // Dificuldade mais alta
      instructions: "Misture os ingredientes, asse e cubra com o chocolate derretido.",
      ingredients: [
        IngredienteModel(
            nome: "Cenoura", 
            quantidade: 3, 
            unidade: Unidade(name: "un"),
            categoria: IngredienteCategoriaModel.categoriaVegetal(),
          ),
        IngredienteModel(
            nome: "Farinha de Trigo", 
            quantidade: 300, 
            unidade: Unidade(name: "g"),
            categoria: IngredienteCategoriaModel.categoriaGrao(),
          ),
        IngredienteModel(
            nome: "Ovo", 
            quantidade: 4, 
            unidade: Unidade(name: "un"),
            categoria: IngredienteCategoriaModel.categoriaCarne(),
          ),
        IngredienteModel(
            nome: "Açúcar", 
            quantidade: 250, 
            unidade: Unidade(name: "g"),
            categoria: IngredienteCategoriaModel.categoriaTempero(),
          ),
        IngredienteModel(
            nome: "Chocolate em Barra", 
            quantidade: 150, 
            unidade: Unidade(name: "g"),
            categoria: IngredienteCategoriaModel.categoriaLaticinio(),
          ),
      ]
    )
  );

  receitas.add(
    ReceitaModel(
      name: "Sopa de Legumes Simples", 
      image: Image.network("https://assets.unileversolutions.com/recipes-v2/36850.jpg"), 
      category: "Sopa", 
      color: Colors.yellow.shade800, 
      estimatedTimeMin: 30,
      portionSizePeople: 4,
      difficulty: 0,
      instructions: "Cozinhe os legumes em água temperada até ficarem macios. Bata ou sirva em pedaços.",
      ingredients: [
        IngredienteModel(
            nome: "Batata", 
            quantidade: 500, 
            unidade: Unidade(name: "g"),
            categoria: IngredienteCategoriaModel.categoriaVegetal(),
          ),
        IngredienteModel(
            nome: "Abobrinha", 
            quantidade: 1, 
            unidade: Unidade(name: "un"),
            categoria: IngredienteCategoriaModel.categoriaVegetal(),
          ),
        IngredienteModel(
            nome: "Cebola", 
            quantidade: 1, 
            unidade: Unidade(name: "un"),
            categoria: IngredienteCategoriaModel.categoriaTempero(),
          ),
        IngredienteModel(
            nome: "Caldo de Legumes", 
            quantidade: 1, 
            unidade: Unidade(name: "L"),
            categoria: IngredienteCategoriaModel.categoriaTempero(),
          ),
      ]
    )
  );

  receitas.add(
    ReceitaModel(
      name: "Picanha na Grelha com Sal Grosso", 
      image: Image.network("https://img.freepik.com/fotos-premium/churrasco-de-picanha-brasileiro-assado-na-grelha-e-servido-em-fatias_491130-4526.jpg"), 
      category: "Churrasco", 
      color: Colors.red.shade900, 
      estimatedTimeMin: 20,
      portionSizePeople: 3,
      difficulty: 1,
      instructions: "Tempere a picanha com sal grosso e asse na grelha até o ponto desejado.",
      ingredients: [
        IngredienteModel(
            nome: "Picanha", 
            quantidade: 800, 
            unidade: Unidade(name: "g"),
            categoria: IngredienteCategoriaModel.categoriaCarne(),
          ),
        IngredienteModel(
            nome: "Sal Grosso", 
            quantidade: 50, 
            unidade: Unidade(name: "g"),
            categoria: IngredienteCategoriaModel.categoriaTempero(),
          ),
      ]
    )
  );

  return receitas;  
}


}