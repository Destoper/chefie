import 'package:flutter/material.dart';

class ButtonRounded extends StatelessWidget {
  final String text;
  final Icon icon;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color borderColor;
  final double borderWidth;
  final double fontSize;

  const ButtonRounded({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon = const Icon(Icons.add, size: 28, color: Colors.white),
    this.width = double.infinity,
    this.height = 50,
    this.backgroundColor = const Color.fromARGB(255, 255, 105, 51),
    this.foregroundColor = Colors.white,
    this.borderColor = Colors.white,
    this.borderWidth = 0,
    this.fontSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return 
      SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(backgroundColor),
            foregroundColor: WidgetStateProperty.all<Color>(foregroundColor),
            shape: WidgetStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.elliptical(18, 20)),
                side: BorderSide(
                  color: borderColor,
                  width: borderWidth,
                ),
              ),
            ),
          ),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 10),
            Text(
              text,
              style: TextStyle(fontSize: fontSize),
            ),
          ],
        ),
      ),
    );
  }
}