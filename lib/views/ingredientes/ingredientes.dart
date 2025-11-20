import 'package:chefie/models/ingrediente.dart';
import 'package:chefie/theme/app_theme.dart';
import 'package:chefie/views/ingredientes/adicionar_ingrediente.dart';
import 'package:chefie/widgets/chefie_app_bar.dart';
import 'package:chefie/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';

class IngredientesPage extends StatefulWidget {
  const IngredientesPage({super.key});

  @override
  State<IngredientesPage> createState() => _IngredientesPageState();
}

class _IngredientesPageState extends State<IngredientesPage> {
  List<IngredienteModel> ingredientes = [];

  void _getIngredientes(){
    ingredientes = IngredienteModel.getIngredientes();
  }

  @override
  Widget build(BuildContext context) {
    _getIngredientes();
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: ChefieAppBar(title:"Meus ingredientes"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SearchBar(
              hintText: "Buscar em meus ingredientes...",
              padding: WidgetStateProperty.all(EdgeInsets.only(left: 20, right: 20)),
              elevation: WidgetStateProperty.all(0.0),
              backgroundColor: WidgetStateProperty.all(AppColors.surface),
              leading: Icon(Icons.search, color: AppColors.text),
              textStyle: WidgetStateProperty.all(
                TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: ingredientes.length,
            itemBuilder: (context, idx) {
            return ItemIngrediente(ingrediente: ingredientes[idx]);
          }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AdicionarIngredientePage()),
          );
        },
        shape: CircleBorder(),
        backgroundColor: AppColors.primary,
        tooltip: "Adicionar ingrediente",
        child: Icon(Icons.add, color: AppColors.textDark),
      ),
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
          border: Border.all(color: AppColors.borderLight, width: 1),
          color: AppColors.surfaceLight,
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: ingrediente.categoria.cor,
              ),
              child: Center(
                child: Text(
                  ingrediente.categoria.icone,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24)
              ),
            )
            ),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ingrediente.nome,
                    style: TextStyle(
                      color: AppColors.text, 
                      fontSize: 18,
                      fontWeight: FontWeight.w400
                    )
                  ),
                  Text(
                    "${ingrediente.quantidade}g",
                    style: TextStyle(
                      color: AppColors.text, 
                      fontSize: 16,
                      fontWeight: FontWeight.w300
                    )
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.mode_edit_outline_outlined, color: AppColors.text),
                SizedBox(width: 20),
                Icon(Icons.delete_outline_outlined, color: AppColors.destructive)
              ],
            )
          ],
        ),
      ),
    );
  }
}