import 'package:flutter/material.dart';
import 'package:chefie/theme/app_theme.dart';

class ButtonRounded extends StatelessWidget {
  final String text;
  final Icon? icon;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? textColor; 
  final Color? borderColor;
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
    this.backgroundColor,
    this.foregroundColor,
    this.textColor,
    this.borderColor,
    this.borderWidth = 0,
    this.fontSize = 18,
    this.fontWeight = FontWeight.w600,
    this.borderRadius = const BorderRadius.all(Radius.circular(30)),
  });

  @override
  Widget build(BuildContext context) {
    final Color baseBg = backgroundColor ?? AppColors.primary;
    final Color baseFg = foregroundColor ?? AppColors.backgroundOf(context);

    final Color effectiveBg = invertColors ? baseFg : baseBg;
    final Color effectiveFg = invertColors ? baseBg : baseFg;

    final Color finalTextColor = textColor ?? effectiveFg;
    final Color finalBorderColor = borderColor ?? effectiveFg;

    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(effectiveBg),
          foregroundColor: WidgetStateProperty.all<Color>(finalTextColor),
          shape: WidgetStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: borderRadius,
              side: BorderSide(
                color: finalBorderColor,
                width: borderWidth > 0 ? borderWidth : (invertColors ? 2.0 : 0), 
              ),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              icon!,
              const SizedBox(width: 10),
            ],
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