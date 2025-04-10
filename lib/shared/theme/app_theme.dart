import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  // Light Theme
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: AppColors.getColorScheme(Brightness.light),
    scaffoldBackgroundColor: AppColors.lightBackground,
    appBarTheme: AppBarTheme(
      color: AppColors.lightPrimary,
      foregroundColor: AppColors.lightOnPrimary,
      elevation: 0,
    ),
    textTheme: _buildTextTheme(Brightness.light),
    elevatedButtonTheme: _buildElevatedButtonTheme(Brightness.light),
    inputDecorationTheme: _buildInputDecorationTheme(Brightness.light),
  );

  // Dark Theme
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: AppColors.getColorScheme(Brightness.dark),
    scaffoldBackgroundColor: AppColors.darkBackground,
    appBarTheme: AppBarTheme(
      color: AppColors.darkPrimary,
      foregroundColor: AppColors.darkOnPrimary,
      elevation: 0,
    ),
    textTheme: _buildTextTheme(Brightness.dark),
    elevatedButtonTheme: _buildElevatedButtonTheme(Brightness.dark),
    inputDecorationTheme: _buildInputDecorationTheme(Brightness.dark),
  );

  // Text Theme
  static TextTheme _buildTextTheme(Brightness brightness) {
    final baseColor = brightness == Brightness.light 
        ? AppColors.lightOnSurface 
        : AppColors.darkOnSurface;

    return TextTheme(
      displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: baseColor,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: baseColor,
      ),
      // Add more text styles as needed
    );
  }

  // ElevatedButton Theme
  static ElevatedButtonThemeData _buildElevatedButtonTheme(Brightness brightness) {
    final colors = brightness == Brightness.light 
        ? AppColors.lightPrimary 
        : AppColors.darkPrimary;

    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: colors,
        foregroundColor: brightness == Brightness.light 
            ? AppColors.lightOnPrimary 
            : AppColors.darkOnPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  // Input Decoration Theme
  static InputDecorationTheme _buildInputDecorationTheme(Brightness brightness) {
    final colors = brightness == Brightness.light 
        ? AppColors.lightPrimary 
        : AppColors.darkPrimary;

    return InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: colors,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: colors.withOpacity(0.5),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: colors,
          width: 2,
        ),
      ),
    );
  }
} 