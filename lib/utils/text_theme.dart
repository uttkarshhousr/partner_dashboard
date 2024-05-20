import 'package:flutter/material.dart';

class AppTextTheme {
  static TextTheme lightTextTheme = const TextTheme(
    displayLarge: TextStyle(
        fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF121618)),
    displayMedium: TextStyle(
        fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
    displaySmall: TextStyle(
        fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF5B6B7A)),
    headlineMedium: TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
    headlineSmall: TextStyle(
        fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
    titleLarge: TextStyle(
        fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF121618)),
    bodyLarge: TextStyle(
        fontSize: 14, fontWeight: FontWeight.normal, color: Color(0xFF121618)),
    bodyMedium: TextStyle(
        fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black),
    titleMedium: TextStyle(
        fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black),
    titleSmall: TextStyle(
        fontSize: 14, fontWeight: FontWeight.normal, color: Color(0xFF5B6B7A)),
    labelLarge: TextStyle(
        fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF121618)),
    bodySmall: TextStyle(
        fontSize: 12, fontWeight: FontWeight.normal, color: Color(0xFF5B6B7A)),
    labelSmall: TextStyle(
        fontSize: 10, fontWeight: FontWeight.normal, color: Color(0xFF5B6B7A)),
  );
}
