import 'package:chefie/models/ingrediente.dart';
import 'package:chefie/modelviews/ingrediente_categoria.dart';
import 'package:chefie/modelviews/unidades.dart';
import 'package:chefie/widgets/button.dart';
import 'package:chefie/widgets/chefie_app_bar.dart';
import 'package:chefie/widgets/chefie_search_bar.dart';
import 'package:chefie/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:chefie/theme/app_theme.dart';

class AdicionarIngredientePage extends StatefulWidget {
  const AdicionarIngredientePage({super.key});

  @override
  State<AdicionarIngredientePage> createState() => _AdicionarIngredientePageState();
}

class _AdicionarIngredientePageState extends State<AdicionarIngredientePage> {

  List<IngredienteModel> ingredientes = [];

  @override
  void initState() {
    super.initState();
    ingredientes = IngredienteModel.getIngredientes(); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: ChefieAppBar(title: "Busque um ingrediente")
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ChefieSearchBar(
              hintText: "Busque um ingrediente",
              onChanged: (query) {}, // TODO: Filter logic,
            ),
            SizedBox(height: 20),
            TextLabel(text: "Ingredientes"),
            Expanded(
              child: ListView.builder(
                itemCount: ingredientes.length,
                itemBuilder: (context, idx) => ItemIngrediente(ingrediente: ingredientes[idx])
              ),
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
      )
    );
  }
}

class ItemIngrediente extends StatelessWidget {
  final IngredienteModel ingrediente;

  const ItemIngrediente({
    super.key,
    required this.ingrediente,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10.0, 
        right: 10.0, 
        top: 5.0, 
        bottom: 5.0
      ),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.borderOf(context), width: 1),
          color: AppColors.surfaceOf(context),
        ),
        child: Row(
          children: [
            Text(
              ingrediente.categoria.icone,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24)
            ),
            SizedBox(width: 15),
            TextLabel(text:ingrediente.nome, fontWeight: FontWeight.w500, fontSize: 16,)
          ],
        ),
      ),
    );
  }
}