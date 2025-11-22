import 'package:chefie/models/recipe_details.dart';
import 'package:chefie/theme/app_theme.dart';
import 'package:chefie/widgets/text.dart';
import 'package:flutter/material.dart';

class ReceitaDetailsPage extends StatelessWidget {
  final RecipeDetails receita;

  const ReceitaDetailsPage({
    super.key,
    required this.receita,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundOf(context),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {}, // TODO: share receita logic
            icon: Icon(Icons.ios_share),
          ),
          IconButton(
            onPressed: () {}, // TODO: save receitas logic
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
            height: 250,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
              color: AppColors.primary.withOpacity(0.6),
            ),
            child: receita.image != null && receita.image!.isNotEmpty
                ? Image.network(
                    receita.image!,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Center(
                      child: Icon(Icons.restaurant, size: 64, color: AppColors.textOf(context)),
                    ),
                  )
                : Center(
                    child: Icon(Icons.restaurant, size: 64, color: AppColors.textOf(context)),
                  ),
          ),
          SizedBox(height: 20),
          
          TextTitle(text: receita.title, fontWeight: FontWeight.w700),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ReceitaInfoItem(
                text: "${receita.readyInMinutes} min",
                icon: Icons.access_time,
              ),
              ReceitaInfoItem(
                text: "${receita.servings} pessoas",
                icon: Icons.people_alt_outlined,
              ),
              ReceitaInfoItem(
                text: "${receita.ingredients.length} itens",
                icon: Icons.kitchen_outlined,
              ),
            ],
          ),

          Divider(color: AppColors.borderOf(context)),
          SizedBox(height: 20),

          TextLabel(text: "Ingredientes", fontSize: 22, fontWeight: FontWeight.w600),
          SizedBox(height: 12),
          Column(
            children: [
              for (var ingredient in receita.ingredients)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: IngredienteItem(ingredient: ingredient),
                ),
            ],
          ),
          SizedBox(height: 20),
          Divider(color: AppColors.borderOf(context)),
          SizedBox(height: 12),
          
          TextLabel(text: "Modo de Preparo", fontSize: 22, fontWeight: FontWeight.w600),
          SizedBox(height: 12),
          if (receita.instructions != null && receita.instructions!.isNotEmpty)
            _buildInstructions(receita.instructions!, context)
          else
            Text(
              'Instruções não disponíveis',
              style: TextStyle(
                color: AppColors.textOf(context).withOpacity(0.6),
                fontStyle: FontStyle.italic,
              ),
            ),
          SizedBox(height: 120),
        ],
      ),
    );
  }

  Widget _buildInstructions(String instructions, BuildContext context) {
    final cleanInstructions = instructions
        .replaceAll(RegExp(r'<[^>]*>'), '\n')
        .replaceAll(RegExp(r'\n\s*\n'), '\n\n')
        .trim();

    return TextLabel(
      text: cleanInstructions,
      fontSize: 14,
      fontWeight: FontWeight.w400,
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
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.3),
              borderRadius: BorderRadius.circular(45),
            ),
            child: Icon(icon, color: AppColors.destructive),
          ),
          SizedBox(height: 5),
          Text(text, style: TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

class IngredienteItem extends StatefulWidget {
  const IngredienteItem({
    super.key,
    required this.ingredient,
  });

  final String ingredient;

  @override
  State<IngredienteItem> createState() => _IngredienteItemState();
}

class _IngredienteItemState extends State<IngredienteItem> {
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.surfaceOf(context),
        border: Border.all(color: AppColors.borderOf(context)),
      ),
      child: Row(
        children: [
          Checkbox(
            value: _checked,
            onChanged: (newValue) {
              setState(() => _checked = newValue ?? false);
            },
            activeColor: AppColors.primary,
            checkColor: AppColors.white,
          ),
          Expanded(
            child: Text(
              widget.ingredient,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.textOf(context),
                decoration: _checked ? TextDecoration.lineThrough : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}