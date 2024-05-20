// lib/main.dart
import 'package:flutter/material.dart';
import 'package:partner_dashboard/screens/partner_screen.dart';
import 'package:partner_dashboard/utils/text_theme.dart';

void main() {
  runApp(PartnerDashboardApp());
}

class PartnerDashboardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Partner Dashboard',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color(0xFF557AF9),  // Primary color for buttons
          primaryContainer: Colors.white, // Container color
          background: Color(0xFFF0F4FF), // Background color
          onPrimary: Colors.white, // Text color on primary color (e.g., buttons)
          onBackground: Color(0xFF121618), // Text color on background (headings)
          secondary: Color(0xFF5B6B7A), // Secondary color for helping text/description
          onSecondary: Colors.white,
        ),
        textTheme: AppTextTheme.lightTextTheme,
      ),
      home: PartnerScreen(),
    );
  }
}
