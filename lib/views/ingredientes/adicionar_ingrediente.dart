
import 'package:chefie/models/ingrediente_categoria.dart';
import 'package:chefie/models/unidades.dart';
import 'package:chefie/widgets/button.dart';
import 'package:chefie/widgets/chefie_app_bar.dart';
import 'package:chefie/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:chefie/theme/app_theme.dart';
import 'package:chefie/widgets/input.dart';

class AdicionarIngredientePage extends StatelessWidget {
  const AdicionarIngredientePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: ChefieAppBar(title: "Adicionar Ingrediente")
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputText(
              text: "Nome do ingrediente",
              hintText: "Ex: Tomate",
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: NumberField(
                    text: "Quantidade"
                  )
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: campoDropdown(
                    context,
                    "Unidade",
                    Unidade.getUnidades(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            TextLabel(
              text: "Categoria", 
              fontSize: 28, 
              fontWeight: FontWeight.w600
            ),
            const SizedBox(height: 10),
            Center(
              child: Categorias(initialSelection: 0),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ButtonRounded(
          text: "Salvar", 
          onPressed: (){}, // TODO: logic
          borderWidth: 2.3, 
          height: 60,
        ),
      ),
    );
  }

  Column campoDropdown(BuildContext context, String text, List<Unidade> opcoes) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FieldTitle(text: text),
        DropdownMenu(
          initialSelection: 0,
          dropdownMenuEntries: List.generate(
            opcoes.length,
            (int idx) => DropdownMenuEntry(
              value: idx, 
              label: opcoes[idx].name,
            )
          ),
          inputDecorationTheme:InputDecorationTheme(
            filled: true,
            fillColor: AppColors.backgroundOf(context),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: AppColors.primary.withValues(alpha: 0.3), width: 1.6)
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: AppColors.primary, width: 1.6),
            ),
          ),
        ),
      ],
    );
  }
}

class Categorias extends StatefulWidget {
  final int? initialSelection;

  const Categorias({
    super.key,
    this.initialSelection
  });

  @override
  State<Categorias> createState() => _CategoriasState();
}

class _CategoriasState extends State<Categorias> {
  int? currentSelection;
  List<IngredienteCategoriaModel> categorias = IngredienteCategoriaModel.getCategorias();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        for (var i = 0; i < categorias.length; i++)
        //for (var categoria in IngredienteCategoriaModel.getCategorias())
        GestureDetector(
          onTap: () => setState(() => currentSelection = i),
          child: CategoriaItem(categoria: categorias[i], selected: (i == currentSelection)),
        ),
      ],
    );
  }
}


class CategoriaItem extends StatelessWidget {
  const CategoriaItem({
    super.key,
    required this.categoria,
    required this.selected,
  });

  final IngredienteCategoriaModel categoria;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105,
      width: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
  color: selected ? AppColors.primary.withValues(alpha: 0.25) : AppColors.primary.withValues(alpha:0.1),
        border: Border.all(
          color: selected ? AppColors.primary : Colors.transparent,
          width: 2,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10),
            width: 80,
            height: 70,
            child: Center(
              child: Text(
                categoria.icone,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 32),
              ),
            ),
          ),
          TextLabel(
            text: categoria.nome,
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: selected ? AppColors.primary : AppColors.textOf(context),
          ),
        ],
      ),
    );
  }
}