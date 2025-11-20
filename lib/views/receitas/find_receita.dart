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

  void _carregarReceitas(){
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
        child: ChefieAppBar(title:"Buscar receitas"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextLabel(text: "${receitas.length} receitas encontradas", 
              fontSize: 20, 
              fontWeight: FontWeight.w300, 
              color: AppColors.textSecondaryOf(context)
            ),
            SizedBox(
              height: 56,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(vertical: 6),
                children: [
                  FilterOption(text: "Ordenar por", icon: Icons.swap_vert,),
                  FilterOption(text: "Match %"),
                  FilterOption(text: "Tempo",)
                ],
              ),
            ),
            Expanded(
              flex: 10,
              child: ListView.builder(
                itemCount: receitas.length,
                itemBuilder: (context, idx) =>
                  ReceitaPreview(receita: receitas[idx]),
              ),
            )
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
  });

  final String text;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(45),
        color: AppColors.borderOf(context),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 20, color: AppColors.textOf(context)),
          const SizedBox(width: 8),
          Text(text, style: TextStyle(color: AppColors.textOf(context))),
        ],
      ),
    );
  }
}