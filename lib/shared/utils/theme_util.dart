import 'package:flutter/material.dart';

class ThemeUtil {
  static bool isDark(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
}

extension ThemeExtension on ThemeMode {
  String shortStr() {
    return toString().split('.').last;
  }
}