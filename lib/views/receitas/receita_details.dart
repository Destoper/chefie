import 'package:chefie/modelviews/ingrediente.dart';
import 'package:chefie/modelviews/receita.dart';
import 'package:chefie/theme/app_theme.dart';
import 'package:chefie/widgets/text.dart';
import 'package:flutter/material.dart';

class ReceitaDetailsPage extends StatelessWidget {
  final ReceitaModel receita;

  const ReceitaDetailsPage({
    super.key,
    required this.receita,
  });

  @override
  Widget build(BuildContext context) {
    List<String> dificuldades = ["Fácil", "Médio", "Difícil"];
    return Scaffold(
      backgroundColor: AppColors.backgroundOf(context),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context), 
          icon: Icon(Icons.arrow_back)
        ),
        actions: [
          IconButton(
            onPressed: (){}, // TODO: share receita logic
            icon: Icon(Icons.ios_share)
          ),
          IconButton(
            onPressed: (){}, // TODO: save receitas logic
            icon: Icon(Icons.favorite_border),
            selectedIcon: Icon(Icons.favorite),
          ),
        ],
      ),
      body: ListView(
         padding: EdgeInsets.all(10),
         shrinkWrap: false,
         children: [
          Container(
            width: double.infinity,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
              color: AppColors.primary.withValues(alpha: 0.6),
            ),
              child: receita.image,
          ),
          SizedBox(height: 20),
          TextTitle(
            text: receita.name, 
            fontWeight: FontWeight.w700
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ReceitaInfoItem(
                text: "${receita.estimatedTimeMin} min", 
                icon: Icons.access_time
              ),
              ReceitaInfoItem(
                text: "${receita.portionSizePeople} pessoas", 
                icon: Icons.people_alt_outlined
              ),
              ReceitaInfoItem(
                text: dificuldades[receita.difficulty], 
                icon: Icons.lunch_dining_outlined
              ),
            ],
          ),

          Divider(color: AppColors.borderOf(context)),
          SizedBox(height: 20),
          TextLabel(text: "Ingredientes", fontSize: 22, fontWeight: FontWeight.w600),
          SizedBox(height: 12),
          Column(
            spacing: 10,
            children: [
              for (var ingredient in receita.ingredients)
                IngredienteItem(ingredient: ingredient),
            ],
          ),
          SizedBox(height: 20),
          Divider(color: AppColors.borderOf(context)),
          SizedBox(height: 12),
          TextLabel(text: "Modo de Preparo", fontSize: 22, fontWeight: FontWeight.w600),
          SizedBox(height: 12),
          TextLabel(
            text:receita.instructions,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          SizedBox(height: 120)
        ],
      )
    );
  }
}

class ReceitaInfoItem extends StatelessWidget {
  const ReceitaInfoItem({
    super.key,
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      padding: EdgeInsets.all(5),
      child: Column(
        spacing: 5,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(45),
            ),
            child: Icon(icon, color: AppColors.destructive)
          ),
          Text(text, style: TextStyle(fontWeight: FontWeight.w600))
        ],
      ),
    );
  }
}

class IngredienteItem extends StatelessWidget {
  const IngredienteItem({
    super.key,
    required this.ingredient,
  });

  final IngredienteModel ingredient;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.surfaceOf(context),
        border: BoxBorder.all(
          color: AppColors.borderOf(context)
        )
      ),
      child: Row(
        children: [
          Checkbox(
            value: false,
            onChanged: (newValue) { },
            activeColor: AppColors.primary,
            checkColor: AppColors.white,
          ),
          TextLabel(
            text: "${ingredient.quantidade}${ingredient.unidade.name} de ${ingredient.nome}",
            fontSize: 18,
            fontWeight: FontWeight.w400,
          )
        ],
      )
    );
  }
}
