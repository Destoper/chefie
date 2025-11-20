import 'package:chefie/models/receita.dart';
import 'package:chefie/widgets/chefie_app_bar.dart';
import 'package:chefie/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:chefie/widgets/button.dart';
import 'package:chefie/widgets/text.dart';
import 'package:chefie/theme/app_theme.dart';
import 'package:chefie/widgets/receita_preview.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ReceitaModel> receitas  = [];
  int currentPageIndex = 0;

  void _getReceitas(){
    receitas = ReceitaModel.getReceitas();
  }

  @override
  Widget build(BuildContext context) {
    _getReceitas();
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: ChefieAppBar(title: "Chefie", leading: Icon(Icons.restaurant_menu)),
      ),      
      body: ListView(
        children: <Widget>[
          Padding(
            padding:  EdgeInsets.only(left: 10.0, right: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
          TextTitle(text: "Olá, o que vamos cozinhar hoje?"),
          SizedBox(height: 15),
          Container(
            width: double.infinity,
            height: 200,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(shape: BoxShape.rectangle, borderRadius: BorderRadius.all(Radius.circular(25.0))),
            child:Image.network(
              "https://lh3.googleusercontent.com/aida-public/AB6AXuBnRdwr4pPmUz7lSSqXJfcAIaP4fAB3B0vc0orpjJw5-_5G5iTQBBMVZ_g48p5HNYimB-akiA3EF5xt-Q9UUum8lSk9pm09V5hGFPdQ5k_4I56DwxRka_2VpWR1YvnaXCV74qCf2_gspq01qt92toGeuXGTX-gXOUEQV8PXqZjNbGmeAej9XQul0HhszsJOGEeGdx1EwxG9QqoQL7ybuFzYVcaFpP1V685As7TH8JYOQLIf4xh5z5S_iw8UUN919Lups5eJHC0jEraK",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 20),
          ButtonRounded(
            onPressed: (){}, 
            text: "Meus ingredientes",
            height: 55.0,
          ),
          SizedBox(height: 10),
          ButtonRounded(
            onPressed: (){}, 
            text: "Explorar receitas", 
            height: 55.0,
            invertColors: true, 
            borderWidth: 2.5
          ),
          ],),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 5),
            child: TextLabel(text: "Sugestões do Dia"),
          ),
          sugestoesDoDiaCarousel()
        ],
      ),
      bottomNavigationBar: ChefieNavBar(),
    );
  }

  SizedBox sugestoesDoDiaCarousel() {
    return SizedBox(
          height: 220,
          child: ListView.separated(
            padding: EdgeInsets.only(left:10.0, right: 10.0),
            itemCount: receitas.length,
            scrollDirection: Axis.horizontal,
            separatorBuilder:(context, index) => SizedBox(width: 15),
            itemBuilder: (context, index) => ReceitaPreview(receita: receitas[index]),
          )
        );
  }
  
  AppBar appBar() {
    return AppBar(
      title: Text(
        "Chefie",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        )
      ),
      leading: Icon(Icons.restaurant_menu),
      centerTitle: true,
      backgroundColor: Color(0xfff8f6f5),
      elevation: 0.0,
    );
  }
}
