import 'package:chefie/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ChefieSearchBar extends StatelessWidget {
  const ChefieSearchBar({
    super.key,
    this.hintText,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
  });

  final String? hintText;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      hintText: hintText,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      onTap: onTap,
      padding: WidgetStateProperty.all(EdgeInsets.only(left: 20, right: 20)),
      elevation: WidgetStateProperty.all(0.0),
      backgroundColor: WidgetStateProperty.all(AppColors.surfaceOf(context)),
      leading: Icon(Icons.search, color: AppColors.textOf(context)),
      textStyle: WidgetStateProperty.all(
        TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}