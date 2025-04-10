import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    primary: Colors.blue,
    secondary: Colors.blueAccent,
    surface: Colors.grey[50]!,
    background: Colors.white,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey[50],
    elevation: 0,
  ),
  textTheme: const TextTheme(
    headlineMedium: TextStyle(color: Colors.black),
    bodyLarge: TextStyle(color: Colors.black87),
    bodyMedium: TextStyle(color: Colors.black87),
  ),
  useMaterial3: true,
);