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
    this.borderWidth = 0,
    this.fontSize = 18,
    this.fontWeight = FontWeight.w600,
    this.borderRadius = const BorderRadius.all(Radius.circular(30)),
  });

  @override
  Widget build(BuildContext context) {
    final Color bgColor = backgroundColor ?? AppColors.primary;
    final Color borderColor = foregroundColor ?? AppColors.backgroundOf(context);
    return 
      SizedBox(
        width: width,
        height: height,
        child: TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(invertColors? borderColor : bgColor),
            foregroundColor: WidgetStateProperty.all<Color>(invertColors? bgColor : borderColor),
            shape: WidgetStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: borderRadius,
                side: BorderSide(
                  color: invertColors? bgColor : borderColor,
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