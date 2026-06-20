import 'package:flutter/material.dart';

class AppColors {
  static const Color nelBlue = Color(0xFF1A4A9B);
  static const Color nelCyan = Color(0xFF65D2E1);
  static const Color nelYellow = Color(0xFFF6C344);
  static const Color nelGrey = Color(0xFF757575);
  static const Color nelPink = Color(0xFFFACAB0);
}

final ColorScheme lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: AppColors.nelBlue,
  onPrimary: Colors.white,
  secondary: AppColors.nelYellow,
  onSecondary: Colors.black,
  tertiary: AppColors.nelCyan,
  surface: Colors.white,
  onSurface: Colors.black,
  error: Colors.redAccent,
  onError: Colors.white,
);
