import 'package:flutter/material.dart';

class AppTheme {
  // Modern coffee-inspired color palette
  static const Color primaryBrown = Color(0xFF8D6E63);
  static const Color lightBrown = Color(0xFFBCAAA4);
  static const Color darkBrown = Color(0xFF5D4037);
  static const Color cream = Color(0xFFFFF8E1);
  static const Color lightGrey = Color(0xFFF8F8F8);
  static const Color darkGrey = Color(0xFF424242);
  static const Color accentOrange = Color(0xFFFF8A65);
  static const Color cardBackground = Color(0xFFFFFFFF);

  static const TextTheme textTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 96,
      fontWeight: FontWeight.bold,
      color: darkBrown,
    ),
    displayMedium: TextStyle(
      fontSize: 60,
      fontWeight: FontWeight.bold,
      color: darkBrown,
    ),
    displaySmall: TextStyle(
      fontSize: 48,
      fontWeight: FontWeight.bold,
      color: darkBrown,
    ),
    headlineLarge: TextStyle(
      fontSize: 34,
      fontWeight: FontWeight.bold,
      color: darkBrown,
    ),
    headlineMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: darkBrown,
    ),
    headlineSmall: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: darkBrown,
    ),
    titleLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: primaryBrown,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: primaryBrown,
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: primaryBrown,
    ),
    bodyLarge: TextStyle(fontSize: 16, color: darkGrey),
    bodyMedium: TextStyle(fontSize: 14, color: darkGrey),
    bodySmall: TextStyle(fontSize: 12, color: darkGrey),
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    labelMedium: TextStyle(fontSize: 12, color: lightBrown),
    labelSmall: TextStyle(fontSize: 10, color: lightBrown),
  );

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryBrown,
        brightness: Brightness.light,
        primary: primaryBrown,
        secondary: accentOrange,
        surface: cardBackground,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: darkBrown,
      ),

      scaffoldBackgroundColor: lightGrey,

      // App Bar Theme
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: darkBrown,
        titleTextStyle: textTheme.headlineMedium,
        surfaceTintColor: Colors.transparent,
      ),

      // Card Theme
      cardTheme: CardThemeData(
        elevation: 8,
        shadowColor: primaryBrown.withValues(alpha: 0.15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: cardBackground,
        surfaceTintColor: Colors.transparent,
      ),

      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 6,
          shadowColor: primaryBrown.withValues(alpha: 0.3),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          backgroundColor: primaryBrown,
          foregroundColor: Colors.white,
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),

      // Floating Action Button Theme
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: accentOrange,
        foregroundColor: Colors.white,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),

      // Bottom Navigation Bar Theme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 20,
        backgroundColor: cardBackground,
        selectedItemColor: primaryBrown,
        unselectedItemColor: Colors.grey.shade400,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 12,
        ),
      ),

      textTheme: textTheme,

      // Chip Theme
      chipTheme: ChipThemeData(
        backgroundColor: cream,
        selectedColor: primaryBrown,
        labelStyle: const TextStyle(color: darkBrown),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),

      // Progress Indicator Theme
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: primaryBrown,
        linearTrackColor: lightBrown,
        circularTrackColor: lightBrown,
      ),
    );
  }
}
