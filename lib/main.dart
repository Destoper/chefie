import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'theme/app_theme.dart';
import 'views/ingredientes/ingredientes.dart';
import 'views/receitas/find_receita.dart';
import 'package:chefie/views/favoritos/favorites.dart';
import 'views/home/home.dart';
import 'views/login/login.dart';
import 'controllers/auth_controller.dart';
import 'config/env.dart';

import 'package:intl/date_symbol_data_local.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Supabase.initialize(
    url: Env.supabaseUrl,
    anonKey: Env.supabaseAnonKey,
  );
  
  await initializeDateFormatting('pt_BR', null);
  
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Chefie',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      home: AuthWrapper(),
    );
  }
}

class AuthWrapper extends ConsumerWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateChangesProvider);

    return authState.when(
      data: (user) {
        if (user != null) {
          return const MainScaffold();
        }
        return const LoginScreen();
      },
      loading: () => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (error, _) => Scaffold(
        body: Center(
          child: Text('Erro: $error'),
        ),
      ),
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

  final List<Widget> _pages = [
    HomePage(),
    IngredientesPage(),
    FindReceitaPage(),
    FavoritosPage(),
  ];

  final PageController _pageController = PageController();

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
      backgroundColor: AppColors.backgroundOf(context),
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