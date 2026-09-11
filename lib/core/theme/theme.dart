import 'package:flutter/material.dart';

// ─────────────────────────────────────────────────────────────
// COLORS
// ─────────────────────────────────────────────────────────────
class AppColors {
  static const primary = Color(0xFFf1faee); // 🔥 لون حديث
}

// ─────────────────────────────────────────────────────────────
// LIGHT THEME
// ─────────────────────────────────────────────────────────────
ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,

  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primary,
    brightness: Brightness.light,
  ),

  scaffoldBackgroundColor: const Color(0xFFF8FAFC),

  // AppBar
  appBarTheme: const AppBarTheme(
    elevation: 0,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    centerTitle: false,
  ),

  // Cards
  cardTheme: CardThemeData(
    elevation: 0,
    color: Colors.white,
    shadowColor: Colors.black.withValues(alpha: 0.05),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  ),

  // Chips
  chipTheme: ChipThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    side: BorderSide.none,
  ),

  // Buttons
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      padding: const EdgeInsets.symmetric(vertical: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
  ),

  // Divider
  dividerTheme: DividerThemeData(
    color: Colors.grey.withValues(alpha: 0.1),
    thickness: 1,
  ),

  // Text
  textTheme: const TextTheme(
    titleLarge: TextStyle(fontWeight: FontWeight.w600),
    bodyMedium: TextStyle(height: 1.6),
  ),
);

// ─────────────────────────────────────────────────────────────
// DARK THEME
// ─────────────────────────────────────────────────────────────
ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,

  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primary,
    brightness: Brightness.dark,
  ),

  scaffoldBackgroundColor: const Color(0xFF0B0F14),

  // AppBar
  appBarTheme: const AppBarTheme(
    elevation: 0,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    centerTitle: false,
  ),

  // Cards
  cardTheme: CardThemeData(
    elevation: 0,
    color: const Color(0xFF111827),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  ),

  // Chips
  chipTheme: ChipThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    side: BorderSide.none,
  ),

  // Buttons
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      padding: const EdgeInsets.symmetric(vertical: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
  ),

  // Divider
  dividerTheme: DividerThemeData(
    color: Colors.white.withValues(alpha: 0.08),
    thickness: 1,
  ),

  // Text
  textTheme: const TextTheme(
    titleLarge: TextStyle(fontWeight: FontWeight.w600),
    bodyMedium: TextStyle(height: 1.6),
  ),
);
