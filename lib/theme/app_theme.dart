import 'package:flutter/material.dart';

/// Centralized color definitions and a small ThemeData helper.
class AppColors {
  AppColors._();

  static const Color primary = Color(0xFFff6933);
  static const Color backgroundLight = Color(0xFFF8F6F5);
  static const Color backgroundDark = Color(0xFF23140F);
  static const Color textLight = Color(0xFF1D110C);
  static const Color textDark = Color(0xFFF8F6F5);
  static const Color textSecondaryLight = Color(0xFF6C757D);
  static const Color textSecondaryDark = Color(0xFFA1A1AA);
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color surfaceDark = Color(0xFF2D1E19);
  static const Color borderLight = Color(0xFFE5E7EB);
  static const Color borderDark = Color(0xFF44403C); 
  static const Color destructive = Color(0xFFDC3545);

  static const Color white = Colors.white;
  static const Color text = textLight;
  static const Color surface = surfaceLight;
}

class AppTheme {
  AppTheme._();

  static final ThemeData light = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary).copyWith(
      primary: AppColors.primary,
      surface: AppColors.surfaceLight,
      onPrimary: AppColors.white,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundLight,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.textLight),
      titleTextStyle: TextStyle(
        color: AppColors.textLight,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    ),
    textTheme: TextTheme(
      headlineSmall: TextStyle(color: AppColors.textLight),
      bodyMedium: TextStyle(color: AppColors.textLight),
    ),
  );

  static final ThemeData dark = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.dark,
    ).copyWith(
      primary: AppColors.primary,
      surface: AppColors.surfaceDark,
      onPrimary: AppColors.white,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundDark,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.textDark),
      titleTextStyle: TextStyle(
        color: AppColors.textDark,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    ),
    textTheme: TextTheme(
      headlineSmall: TextStyle(color: AppColors.textDark),
      bodyMedium: TextStyle(color: AppColors.textDark),
    ),
  );
}