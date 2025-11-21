import 'package:chefie/theme/app_theme.dart';
import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double fontSize;

  const TextTitle({
    super.key,
    this.text = "Title!",
    this.fontWeight = FontWeight.w800,
    this.fontSize = 32,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: AppColors.textOf(context),
        fontSize: fontSize,
        fontWeight: fontWeight
      )
    );
  }
}

class TextLabel extends StatelessWidget {
  final String text;
  final Color? color;
  final double fontSize;
  final FontWeight fontWeight;

  const TextLabel({
    super.key,
    required this.text,
    this.color,
    this.fontSize = 20,
    this.fontWeight = FontWeight.w700,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? AppColors.textOf(context),
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
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
          color: AppColors.textOf(context), 
          fontSize: 21,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}