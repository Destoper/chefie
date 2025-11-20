import 'package:flutter/material.dart';

class ReceitaModel {
  String name;
  Image image;
  String category;
  Color color;
  int estimatedTimeMin;

  ReceitaModel({
    required this.name,
    required this.image,
    required this.category,
    required this.color,
    required this.estimatedTimeMin,
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
    )
  );

  receitas.add(
    ReceitaModel(
      name: "Pizza de Pepperoni Caseira", 
      image: Image.network("https://lh3.googleusercontent.com/aida-public/AB6AXuCngXUggbffAilVyZUX9AwUQMN0ivQjwa43RP_pNzjBqYGbcetVdjTIvEFAqanDa0qg1u19cca75ELIsmV8lN2c1fQPquUqBRIjdyV4qzrvO7xmw0LwdEqTXEsIdS42e3MzeaFtc9Uo9jukCckhOZ3a-U43Qzix8uds0rX6jbVmfAMQ3BQYBzQBlHUxvzb7ibxMBDCYFf6_dsHPniWzcUmLNknYbRo-sS9c78Fpe_99j1A-U3rTSFr5xkw78gaYXYWQCDH-a_aPvM6x"), 
      category: "Italiana", 
      color: Colors.orange.shade200, 
      estimatedTimeMin: 45,
    )
  );

  receitas.add(
    ReceitaModel(
      name: "Torrada de Abacate com Ovo", 
      image: Image.network("https://lh3.googleusercontent.com/aida-public/AB6AXuCNlbh9wyFpYFxHV_Jnu50vKyOh2KtCOO_lcmT5dMnT41mAfnneU4y6Xa7plNU7kQn_FV13nfWLcjChsrWGBxm-uyn8YnSliv8b3SjIvD6qat4IwYFhEnWl-sm62DXFasPEyoBpz-BkR5ysYcgh6by2JqJcEi2yQTTzgRpilXaHdBXGSk7oJNmIQocSHmuYfcqUjDsJorWizm_JIN6TaVG0bTeli1IrOsWoX7VKJJqkpsmPq9uIagrS47B2dKXQg-WGMRECDncBFmt1"), 
      category: "Café da Manhã", 
      color: Colors.brown.shade300, 
      estimatedTimeMin: 45,
    )
  );  

  return receitas;  
}


}