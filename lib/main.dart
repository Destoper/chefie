import 'package:chefie/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'views/home/home.dart';
import 'views/ingredientes/ingredientes.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chefie',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      home: MainScaffold(),
    );
  }
}

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _currentPageIndex = 0;

  // Define all your pages here
  final List<Widget> _pages = [
    HomePage(),
    IngredientesPage(),
    IngredientesPage(),
    IngredientesPage(),
  ];

  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
      controller: _pageController,
      onPageChanged: (index) {
        setState(() {
          _currentPageIndex = index;
        });
      },
      children: _pages,
    ),
      bottomNavigationBar: navigationBar(),
    );
  }

  NavigationBar navigationBar() {
    return NavigationBar(
      backgroundColor: AppColors.backgroundLight,
      elevation: 0.1,
      indicatorColor: Colors.transparent,
      onDestinationSelected: (int index) {
        _pageController.animateToPage(
          index,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
      selectedIndex: _currentPageIndex,
      destinations: const <Widget>[
        NavigationDestination(
          selectedIcon: Icon(Icons.home_outlined, color: AppColors.primary),
          icon: Icon(Icons.home_outlined),
          tooltip: 'Início',
          label: 'Início',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.shopping_basket_outlined, color: AppColors.primary),
          icon: Icon(Icons.shopping_basket_outlined),
          tooltip: 'Ingredientes',
          label: 'Ingredientes',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.search, color: AppColors.primary),
          icon: Icon(Icons.search),
          tooltip: 'Buscar',
          label: 'Buscar',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.favorite_border, color: AppColors.primary),
          icon: Icon(Icons.favorite_border),
          tooltip: 'Favoritos',
          label: 'Favoritos',
        ),
      ],
    );
  }
}
