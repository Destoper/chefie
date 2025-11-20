import 'package:chefie/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ChefieAppBar extends StatelessWidget {
  final String title;
  final Widget? leading;

  const ChefieAppBar({
    super.key,
    required this.title,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        )
      ),
      backgroundColor: AppColors.backgroundLight,
      centerTitle: true,
      elevation: 0.5,
      leading: leading
    );
  }
}