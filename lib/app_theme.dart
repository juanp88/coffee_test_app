import 'package:flutter/material.dart';

class AppTheme {
  static const Color aliceBlue = Color(0xFFD5DFE5);
  static const Color thistle = Color(0xFFC9B1BD);
  static const Color rosyBrown = Color(0xFFB49594);
  static const Color resedaGreen = Color(0xFF7F9172);
  static const Color hookersGreen = Color(0xFF567568);
  static const Color lightGrey = Color.fromARGB(255, 174, 184, 179);

  static const TextTheme textTheme = TextTheme(
    displayLarge: TextStyle(
        fontSize: 96, fontWeight: FontWeight.bold, color: hookersGreen),
    displayMedium: TextStyle(
        fontSize: 60, fontWeight: FontWeight.bold, color: hookersGreen),
    displaySmall: TextStyle(
        fontSize: 48, fontWeight: FontWeight.bold, color: hookersGreen),
    headlineLarge: TextStyle(
        fontSize: 34, fontWeight: FontWeight.bold, color: hookersGreen),
    headlineMedium: TextStyle(
        fontSize: 24, fontWeight: FontWeight.bold, color: hookersGreen),
    headlineSmall: TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: hookersGreen),
    titleLarge: TextStyle(
        fontSize: 16, fontWeight: FontWeight.bold, color: resedaGreen),
    titleMedium: TextStyle(
        fontSize: 14, fontWeight: FontWeight.bold, color: resedaGreen),
    titleSmall: TextStyle(
        fontSize: 12, fontWeight: FontWeight.bold, color: resedaGreen),
    bodyLarge: TextStyle(fontSize: 16, color: hookersGreen),
    bodyMedium: TextStyle(fontSize: 14, color: hookersGreen),
    bodySmall: TextStyle(fontSize: 12, color: hookersGreen),
    labelLarge:
        TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: aliceBlue),
    labelMedium: TextStyle(fontSize: 12, color: thistle),
    labelSmall: TextStyle(fontSize: 10, color: thistle),
  );

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true, // Enable Material 3
      colorScheme: const ColorScheme(
        primary: resedaGreen,
        secondary: hookersGreen,
        surface: thistle,
        error: rosyBrown,
        onPrimary: aliceBlue,
        onSecondary: aliceBlue,
        onSurface: resedaGreen,
        onError: aliceBlue,
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: aliceBlue,
      appBarTheme: AppBarTheme(
        backgroundColor: resedaGreen,
        foregroundColor: aliceBlue,
        titleTextStyle: textTheme.headlineSmall,
      ),
      textTheme: textTheme,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: resedaGreen,
          foregroundColor: aliceBlue,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: resedaGreen,
        ),
      ),
    );
  }
}
