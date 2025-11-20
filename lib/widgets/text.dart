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
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;

  const TextLabel({
    super.key,
    required this.text,
    this.color = AppColors.text,
    this.fontSize = 20,
    this.fontWeight = FontWeight.w700,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight
      )
    );
  }
}

class FieldTitle extends StatelessWidget {
  const FieldTitle({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Text(
        text,
        style: TextStyle(
          color: AppColors.text, 
          fontSize: 21,
          fontWeight: FontWeight.w400,
        )
      ),
    );
  }
}