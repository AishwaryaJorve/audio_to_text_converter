import 'package:flutter/material.dart';

class AppColors {
  // Light Theme Colors
  static const Color lightPrimary = Color(0xFF4A6CF7); // Vibrant blue
  static const Color lightOnPrimary = Colors.white;
  static const Color lightBackground = Color(0xFFF4F7FE); // Soft light blue-grey
  static const Color lightSurface = Colors.white;
  static const Color lightOnSurface = Color(0xFF333333); // Dark charcoal
  
  // Accent and Semantic Colors
  static const Color lightError = Color(0xFFFF4D4F); // Bright red for errors
  static const Color lightSuccess = Color(0xFF52C41A); // Green for success
  static const Color lightWarning = Color(0xFFFAAD14); // Amber for warnings
  static const Color lightInfo = Color(0xFF1890FF); // Bright blue for info

  // Dark Theme Colors
  static const Color darkPrimary = Color(0xFF6B8AFF); // Softer blue
  static const Color darkOnPrimary = Colors.white;
  static const Color darkBackground = Color(0xFF1A1A2E); // Deep dark blue-grey
  static const Color darkSurface = Color(0xFF252836); // Slightly lighter dark surface
  static const Color darkOnSurface = Colors.white;
  
  // Dark Theme Accent Colors
  static const Color darkError = Color(0xFFFF7875); // Softer red
  static const Color darkSuccess = Color(0xFF73D13D); // Bright green
  static const Color darkWarning = Color(0xFFFFC53D); // Bright amber
  static const Color darkInfo = Color(0xFF40A9FF); // Bright blue

  // Utility method to get colors based on brightness
  static ColorScheme getColorScheme(Brightness brightness) {
    return brightness == Brightness.light
        ? ColorScheme.light(
            primary: lightPrimary,
            onPrimary: lightOnPrimary,
            background: lightBackground,
            surface: lightSurface,
            onSurface: lightOnSurface,
            error: lightError,
          )
        : ColorScheme.dark(
            primary: darkPrimary,
            onPrimary: darkOnPrimary,
            background: darkBackground,
            surface: darkSurface,
            onSurface: darkOnSurface,
            error: darkError,
          );
  }

  // Helper method to get semantic colors based on brightness
  static Map<String, Color> getSemanticColors(Brightness brightness) {
    return brightness == Brightness.light
        ? {
            'error': lightError,
            'success': lightSuccess,
            'warning': lightWarning,
            'info': lightInfo,
          }
        : {
            'error': darkError,
            'success': darkSuccess,
            'warning': darkWarning,
            'info': darkInfo,
          };
  }
} 