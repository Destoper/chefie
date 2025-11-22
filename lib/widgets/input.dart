import 'package:flutter/material.dart';
import 'package:chefie/theme/app_theme.dart';
import 'package:chefie/widgets/text.dart';

class InputText extends StatelessWidget {
  const InputText({
    super.key,
    required this.text,
    this.hintText,
  });

  final String text;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FieldTitle(text: text),
        TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.backgroundOf(context),
            contentPadding: const EdgeInsets.all(15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: AppColors.primary.withValues(alpha: 0.3), width: 1.6)
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: AppColors.primary, width: 1.6)
            ),
            hintText: hintText,
            hintStyle: TextStyle(
              color: AppColors.textOf(context).withValues(alpha: 0.6),
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}

class NumberField extends StatelessWidget {
  const NumberField({
    super.key,
    required this.text,
    this.controller,
  });

  final String text;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FieldTitle(text: text),
        TextField(
          controller: controller,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.backgroundOf(context),
            contentPadding: const EdgeInsets.all(15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: AppColors.primary.withValues(alpha: 0.3), width: 1.6),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: AppColors.primary, width: 1.6),
            ),
            hintText: "1",
            hintStyle: TextStyle(
              color: AppColors.textOf(context).withValues(alpha: 0.6),
            ),
          ),
        ),
      ],
    );
  }
}