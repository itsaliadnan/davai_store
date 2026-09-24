import 'package:flutter/material.dart';

class AppColors {
  // Background (Light)
  static const lightBg = Color(0xFFFFFFFF);

  static const lightSurface = Color(0xFFFDF8E3);

  static const lightSurfaceContainer = Color(0xFFF3F0E4);
  static const lightSurfaceContainerHigh = Color(0xFFFFFFFF);

  static const darkBg = Color(0xFF000000);
  static const darkSurface = Color(0xFF141414);
  static const darkSurfaceContainer = Color(0xFF1E1E1E);
  static const darkSurfaceContainerHigh = Color(0xFF292929);

  static const teal = Color(0xFF2FAE8B);
  static const tealDark = Color(0xFF3FCBA3);

  static const red = Color(0xFFE23B4E);
  static const redDark = Color(0xFFF0576A);

  static const magenta = Color(0xFFB838C7);
  static const magentaDark = Color(0xFFD157E0);

  static const ink = Color(0xFF141414);
  static const cream = Color(0xFFF5F0DC);

  static const neutral = Color(0xFFC5C8D0);

  static const warning = Color(0xFFF2C94C);
}

// ─────────────────────────────────────────────────────────────
// LIGHT THEME
// ─────────────────────────────────────────────────────────────

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,

  scaffoldBackgroundColor: AppColors.lightBg,

  colorScheme:
      ColorScheme.fromSeed(
        seedColor: AppColors.teal,
        brightness: Brightness.light,
      ).copyWith(
        primary: AppColors.teal,
        secondary: AppColors.magenta,
        tertiary: AppColors.red,
        surface: AppColors.lightSurface,
        surfaceContainer: AppColors.lightSurfaceContainer,
        surfaceContainerHigh: AppColors.lightSurfaceContainerHigh,
        surfaceContainerHighest: AppColors.lightSurfaceContainer,
        onSurface: AppColors.ink,
        onSurfaceVariant: AppColors.ink.withValues(alpha: 0.6),
        outline: AppColors.neutral,
        outlineVariant: AppColors.neutral.withValues(alpha: 0.35),
        shadow: AppColors.ink,
        error: AppColors.red,
      ),

  // AppBar
  appBarTheme: const AppBarTheme(
    elevation: 0,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    centerTitle: false,
    foregroundColor: AppColors.ink,
  ),

  // Cards
  cardTheme: CardThemeData(
    elevation: 0,
    color: AppColors.lightSurface,
    shadowColor: AppColors.ink.withValues(alpha: 0.06),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  ),

  // Chips
  chipTheme: ChipThemeData(
    backgroundColor: AppColors.lightSurface,
    selectedColor: AppColors.teal.withValues(alpha: 0.12),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    side: BorderSide.none,
  ),

  // Buttons
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: AppColors.red,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
  ),

  // Outlined Buttons
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColors.magenta,
      side: const BorderSide(color: AppColors.magenta),
      padding: const EdgeInsets.symmetric(vertical: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
  ),

  // Divider
  dividerTheme: DividerThemeData(
    color: AppColors.neutral.withValues(alpha: 0.45),
    thickness: 1,
  ),

  // Input
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.lightSurface,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: AppColors.teal, width: 1.5),
    ),
  ),

  // Text
  textTheme: const TextTheme(
    titleLarge: TextStyle(fontWeight: FontWeight.w600, color: AppColors.ink),
    bodyMedium: TextStyle(height: 1.6, color: AppColors.ink),
  ),
);

// ─────────────────────────────────────────────────────────────
// DARK THEME
// ─────────────────────────────────────────────────────────────

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,

  scaffoldBackgroundColor: AppColors.darkBg,

  colorScheme:
      ColorScheme.fromSeed(
        seedColor: AppColors.tealDark,
        brightness: Brightness.dark,
      ).copyWith(
        primary: AppColors.tealDark,
        secondary: AppColors.magentaDark,
        tertiary: AppColors.redDark,
        surface: AppColors.darkSurface,
        surfaceContainer: AppColors.darkSurfaceContainer,
        surfaceContainerHigh: AppColors.darkSurfaceContainerHigh,
        surfaceContainerHighest: AppColors.darkSurfaceContainerHigh,
        onSurface: AppColors.cream,
        onSurfaceVariant: AppColors.cream.withValues(alpha: 0.6),
        outline: AppColors.neutral.withValues(alpha: 0.4),
        outlineVariant: AppColors.neutral.withValues(alpha: 0.2),
        shadow: Colors.black,
        error: AppColors.redDark,
      ),

  // AppBar
  appBarTheme: const AppBarTheme(
    elevation: 0,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    centerTitle: false,
    foregroundColor: AppColors.cream,
  ),

  // Cards
  cardTheme: CardThemeData(
    elevation: 0,
    color: AppColors.darkSurface,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  ),

  // Chips
  chipTheme: ChipThemeData(
    backgroundColor: AppColors.darkSurface,
    selectedColor: AppColors.tealDark.withValues(alpha: 0.25),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    side: BorderSide.none,
  ),

  // Buttons
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: AppColors.redDark,
      foregroundColor: AppColors.darkBg,
      padding: const EdgeInsets.symmetric(vertical: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
  ),

  // Outlined Buttons
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColors.magentaDark,
      side: const BorderSide(color: AppColors.magentaDark),
      padding: const EdgeInsets.symmetric(vertical: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
  ),

  // Divider
  dividerTheme: DividerThemeData(
    color: Colors.white.withValues(alpha: 0.10),
    thickness: 1,
  ),

  // Input
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.darkSurface,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: AppColors.tealDark, width: 1.5),
    ),
  ),

  // Text
  textTheme: const TextTheme(
    titleLarge: TextStyle(fontWeight: FontWeight.w600, color: AppColors.cream),
    bodyMedium: TextStyle(height: 1.6, color: AppColors.cream),
  ),
);
