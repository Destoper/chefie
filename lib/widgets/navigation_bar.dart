import 'package:chefie/views/home/home.dart';
import 'package:flutter/material.dart';
import 'package:chefie/views/ingredientes/ingredientes.dart';
import 'package:chefie/theme/app_theme.dart';

class ChefieNavBar extends StatefulWidget {
  const ChefieNavBar({
    super.key,
    this.currentPageIndex = 0,
  });

  final int currentPageIndex;

  @override
  State<ChefieNavBar> createState() => _ChefieNavBarState();
}

class _ChefieNavBarState extends State<ChefieNavBar> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      backgroundColor: AppColors.backgroundLight,
      elevation: 0.1,
      indicatorColor: Colors.transparent,
      onDestinationSelected: (int idx) {
        switch (idx) {
          case 0:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage())
            );
            break;
          case 1:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => IngredientesPage()),
            );
            break;
          case 2:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => IngredientesPage()),
            );
            break;
          default:
            break;
        }
        setState(() {
          currentPageIndex = idx;
        });
      },
      selectedIndex: widget.currentPageIndex,
      destinations: <Widget>[
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
          selectedIcon: Icon(Icons.favorite_border, color: AppColors.primary),
          icon: Icon(Icons.favorite_border),
          tooltip: 'Favoritos',
          label: 'Favoritos',
        ),
      ],
  );
  }
}



