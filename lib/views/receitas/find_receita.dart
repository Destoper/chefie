import 'package:chefie/models/receita.dart';
import 'package:chefie/theme/app_theme.dart';
import 'package:chefie/widgets/chefie_app_bar.dart';
import 'package:chefie/widgets/receita_preview.dart';
import 'package:chefie/widgets/text.dart';
import 'package:flutter/material.dart';

class FindReceitaPage extends StatefulWidget {
  const FindReceitaPage({super.key});

  @override
  State<FindReceitaPage> createState() => _FindReceitaPageState();
}

class _FindReceitaPageState extends State<FindReceitaPage> {
  List<ReceitaModel> receitas = [];

  void _carregarReceitas() {
    receitas = ReceitaModel.getReceitas();
  }

  @override
  void initState() {
    super.initState();
    _carregarReceitas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: ChefieAppBar(title: "Buscar receitas"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextLabel(
              text: "${receitas.length} receitas encontradas",
              fontSize: 18,
              fontWeight: FontWeight.w300,
              color: AppColors.textOf(context),
            ),
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(vertical: 6),
                children: [
                  FilterOption(text: "Ordenar por", icon: Icons.swap_vert),
                  FilterOption(
                    text: "Match %",
                    color: AppColors.primary.withValues(alpha: 0.2),
                    textColor: AppColors.primary,
                    fontWeight: FontWeight.w500,
                  ),
                  FilterOption(text: "Tempo"),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 15,
                  childAspectRatio: 3/5
                ),
                itemCount: receitas.length,
                itemBuilder: (context, idx) =>
                    ReceitaPreview(
                      receita: receitas[idx], 
                      previewWidth: double.infinity,
                      previewHeight: 500,
                      showInfoIcons: true,
                      showMissingIngredientCount: true,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FilterOption extends StatelessWidget {
  const FilterOption({
    super.key,
    required this.text,
    this.icon,
    this.color,
    this.textColor,
    this.fontWeight,
  });

  final String text;
  final IconData? icon;
  final Color? color;
  final Color? textColor;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(45),
        color: color ?? AppColors.borderOf(context),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null)
            Row(
              children: [
                Icon(icon, size: 20, color: AppColors.textOf(context)),
                const SizedBox(width: 8),
              ],
            ),
          Text(
            text,
            style: TextStyle(
              fontSize: 15,
              fontWeight: fontWeight ?? FontWeight.w500,
              color: textColor ?? AppColors.textOf(context),
            ),
          ),
        ],
      ),
    );
  }
}
