import 'package:flutter/material.dart';

/// Centralized color definitions and a small ThemeData helper.
class AppColors {
  AppColors._();

  static const Color primary = Color(0xFFff6933); // #ff6933
  static const Color backgroundLight = Color(0xFFF8F6F5);
  static const Color backgroundDark = Color(0xFF23140F);
  static const Color white = Colors.white;
  static const Color text = Color(0xFF1D110C);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color destructive = Color(0xFFDC3545);
}

class AppTheme {
  AppTheme._();

  static final ThemeData light = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary).copyWith(
      primary: AppColors.primary,
      surface: AppColors.backgroundLight,
      onPrimary: AppColors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundLight,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    ),
    textTheme: const TextTheme(
      headlineSmall: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black),
    ),
  );
}
