import 'package:chefie/theme/app_theme.dart';
import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  final String text;

  const TextTitle({
    super.key,
    this.text = "Title!",
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.black, 
        fontSize: 32,
        fontWeight: FontWeight.w800
      )
    );
  }
}

class TextLabel extends StatelessWidget {
  final String text;
  final double fontSize;

  const TextLabel({
    super.key,
    required this.text,
    this.fontSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: AppColors.text, 
        fontSize: fontSize,
        fontWeight: FontWeight.w700
      )
    );
  }
}