import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    primary: Colors.blue,
    secondary: Colors.blueAccent,
    surface: Colors.grey[900]!,
    background: Colors.black,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey[900],
    elevation: 0,
  ),
  textTheme: const TextTheme(
    headlineMedium: TextStyle(color: Colors.white),
    bodyLarge: TextStyle(color: Colors.white70),
    bodyMedium: TextStyle(color: Colors.white70),
  ),
  useMaterial3: true,
);