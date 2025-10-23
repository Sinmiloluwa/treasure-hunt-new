import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const TreasureHuntApp());
}

class TreasureHuntApp extends StatelessWidget {
  const TreasureHuntApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Treasure Hunt',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Jakarta',
        primaryColor: const Color(0xFF0f1c22),
        scaffoldBackgroundColor: const Color(0xFF0f1c22),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF0f1c22),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          ),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
