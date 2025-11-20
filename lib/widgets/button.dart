import 'package:flutter/material.dart';
import 'package:chefie/theme/app_theme.dart';

class ButtonRounded extends StatelessWidget {
  final String text;
  final Icon? icon;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final Color backgroundColor;
  final Color foregroundColor;
  final double borderWidth;
  final double fontSize;
  final FontWeight fontWeight;
  final bool invertColors;
  final BorderRadiusGeometry borderRadius;

  const ButtonRounded({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.invertColors = false,
  this.width = double.infinity,
  this.height = 50,
  this.backgroundColor = AppColors.primary,
  this.foregroundColor = AppColors.white,
    this.borderWidth = 0,
    this.fontSize = 18,
    this.fontWeight = FontWeight.w600,
    this.borderRadius = const BorderRadius.all(Radius.circular(30)),
  });

  @override
  Widget build(BuildContext context) {
    return 
      SizedBox(
        width: width,
        height: height,
        child: TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(invertColors? foregroundColor : backgroundColor),
            foregroundColor: WidgetStateProperty.all<Color>(invertColors? backgroundColor : foregroundColor),
            shape: WidgetStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: borderRadius,
                side: BorderSide(
                  color: invertColors? backgroundColor : foregroundColor,
                  width: borderWidth,
                ),
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) icon!,
              if (icon != null) const SizedBox(width: 10),
              Text(
                text,
                style: TextStyle(
                  fontWeight: fontWeight,
                  fontSize: fontSize
                  ),
              ),
            ],
          ),
      ),
    );
  }
}