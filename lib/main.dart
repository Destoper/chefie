import 'package:flutter/material.dart';
import 'package:chefie/widgets/ButtonRounded.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chefie',
      theme: ThemeData(
        colorScheme: ColorScheme.light(),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    int currentPageIndex = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text("Chefie"),
        leading: Icon(Icons.restaurant_menu),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Title(
              color: Colors.black, 
              child: Text("Olá, o que vamos cozinhar hoje?", textAlign: TextAlign.left),
            ),
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
            ButtonRounded(onPressed: _incrementCounter, text: "Meus ingredientes"),
            ButtonRounded(onPressed: _incrementCounter, text: "Explorar receitas"),
            // CarouselView(
            //   scrollDirection: Axis.horizontal,
            //   itemExtent: 100.0,
            //   shrinkExtent: 200.0,
            //   itemSnapping: true,
            //   children: List<Widget>.generate(20, (int index) {
            //     return Image.network(
            //       'https://picsum.photos/500/?image=$index',
            //       fit: BoxFit.cover,
            //     );
            //   }),         
            // ),
            Text("Sugestões do Dia"),
            Placeholder(),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int idx) {},
        indicatorColor: const Color.fromARGB(255, 255, 105, 51),
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Início',
          ),
          NavigationDestination(
            icon: Badge(child: Icon(Icons.shopping_basket_outlined)),
            label: 'Ingredientes',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_border),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }
}
