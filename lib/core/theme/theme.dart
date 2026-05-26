import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'colors.dart';

// ─────────────────────────────────────────────────────────────────────────────
// LIGHT THEME
// ─────────────────────────────────────────────────────────────────────────────
ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,

  colorScheme: const ColorScheme.light(
    // Primary — gold
    primary: AppColors.gold,
    onPrimary: AppColors.onGold,
    primaryContainer: AppColors.goldSubtle,
    onPrimaryContainer: AppColors.goldSubtle,

    // Secondary — main text
    secondary: AppColors.lightTextPrimary,
    onSecondary: AppColors.lightBackground,
    secondaryContainer: AppColors.lightElevated,
    onSecondaryContainer: AppColors.lightTextPrimary,

    // Tertiary — muted text
    tertiary: AppColors.lightTextTertiary,
    onTertiary: AppColors.lightBackground,
    tertiaryContainer: AppColors.lightCard,
    onTertiaryContainer: AppColors.lightTextSecondary,

    // Surfaces
    surface: AppColors.lightBackground,
    onSurface: AppColors.lightTextPrimary,
    onSurfaceVariant: AppColors.lightTextSecondary,
    surfaceContainerLowest: AppColors.lightBackground,
    surfaceContainerLow: AppColors.lightNavBar,
    surfaceContainer: AppColors.lightPageBg,
    surfaceContainerHigh: AppColors.lightCard,
    surfaceContainerHighest: AppColors.lightInput,

    // Outline
    outline: AppColors.lightBorderElement,
    outlineVariant: AppColors.lightBorderSubtle,

    // Error / Alert
    error: AppColors.alertRed,
    onError: AppColors.lightBackground,
    errorContainer: AppColors.alertRedTint,
    onErrorContainer: AppColors.alertRed,

    // Misc
    shadow: Color(0x1A000000),
    scrim: Color(0x33000000),
    inverseSurface: AppColors.lightTextPrimary,
    onInverseSurface: AppColors.lightBackground,
    inversePrimary: AppColors.goldLight,
  ),

  scaffoldBackgroundColor: AppColors.lightBackground,

  // Text
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      color: AppColors.lightTextPrimary,
      height: 1.2,
    ),
    displayMedium: TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.w700,
      color: AppColors.lightTextPrimary,
      height: 1.2,
    ),
    displaySmall: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: AppColors.lightTextPrimary,
      height: 1.3,
    ),
    headlineLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.lightTextPrimary,
      height: 1.3,
    ),
    headlineMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColors.lightTextPrimary,
      height: 1.3,
    ),
    headlineSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.lightTextPrimary,
      height: 1.4,
    ),
    titleLarge: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: AppColors.lightTextPrimary,
      height: 1.4,
    ),
    titleMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.lightTextPrimary,
      height: 1.4,
    ),
    titleSmall: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      color: AppColors.lightTextPrimary,
      height: 1.4,
    ),
    bodyLarge: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: AppColors.lightTextPrimary,
      height: 1.6,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.lightTextSecondary,
      height: 1.6,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.lightTextTertiary,
      height: 1.5,
    ),
    labelLarge: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w600,
      color: AppColors.lightTextPrimary,
      letterSpacing: 0.1,
    ),
    labelMedium: TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w500,
      color: AppColors.lightTextMuted,
      letterSpacing: 0.2,
    ),
    labelSmall: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: AppColors.lightTextMuted,
      letterSpacing: 1.2,
    ),
  ),
);

// ─────────────────────────────────────────────────────────────────────────────
// DARK THEME
// ─────────────────────────────────────────────────────────────────────────────
ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,

  colorScheme: const ColorScheme.dark(
    // Primary — gold
    primary: AppColors.gold,
    onPrimary: AppColors.onGold,
    primaryContainer: AppColors.darkElevated,
    onPrimaryContainer: AppColors.darkBackground,

    // Secondary — main text
    secondary: AppColors.darkTextPrimary,
    onSecondary: AppColors.darkBackground,
    secondaryContainer: AppColors.darkCard,
    onSecondaryContainer: AppColors.darkTextPrimary,

    // Tertiary — muted text
    tertiary: AppColors.darkTextTertiary,
    onTertiary: AppColors.darkBackground,
    tertiaryContainer: AppColors.darkStepper,
    onTertiaryContainer: AppColors.darkTextSecondary,

    // Surfaces
    surface: AppColors.darkBackground,
    onSurface: AppColors.darkTextPrimary,
    onSurfaceVariant: AppColors.darkTextSecondary,
    surfaceContainerLowest: AppColors.darkBackground,
    surfaceContainerLow: AppColors.darkNavBar,
    surfaceContainer: AppColors.darkCard,
    surfaceContainerHigh: AppColors.darkElevated,
    surfaceContainerHighest: AppColors.darkInput,

    // Outline
    outline: AppColors.darkBorderElement,
    outlineVariant: AppColors.darkBorderSubtle,

    // Error / Alert
    error: AppColors.alertRed,
    onError: AppColors.darkBackground,
    errorContainer: Color(0xFF3D1010),
    onErrorContainer: AppColors.alertRed,

    // Misc
    shadow: Colors.black,
    scrim: Color(0x80000000),
    inverseSurface: AppColors.darkTextPrimary,
    onInverseSurface: AppColors.darkBackground,
    inversePrimary: AppColors.goldDark,
  ),

  scaffoldBackgroundColor: AppColors.darkBackground,

  // Text
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      color: AppColors.darkTextPrimary,
      height: 1.2,
    ),
    displayMedium: TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.w700,
      color: AppColors.darkTextPrimary,
      height: 1.2,
    ),
    displaySmall: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: AppColors.darkTextPrimary,
      height: 1.3,
    ),
    headlineLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.darkTextPrimary,
      height: 1.3,
    ),
    headlineMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColors.darkTextPrimary,
      height: 1.3,
    ),
    headlineSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.darkTextPrimary,
      height: 1.4,
    ),
    titleLarge: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: AppColors.darkTextPrimary,
      height: 1.4,
    ),
    titleMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.darkTextPrimary,
      height: 1.4,
    ),
    titleSmall: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      color: AppColors.darkTextPrimary,
      height: 1.4,
    ),
    bodyLarge: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: AppColors.darkTextPrimary,
      height: 1.6,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.darkTextSecondary,
      height: 1.6,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.darkTextTertiary,
      height: 1.5,
    ),
    labelLarge: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w600,
      color: AppColors.darkTextPrimary,
      letterSpacing: 0.1,
    ),
    labelMedium: TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w500,
      color: AppColors.darkTextMuted,
      letterSpacing: 0.2,
    ),
    labelSmall: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: AppColors.darkTextMuted,
      letterSpacing: 1.2,
    ),
  ),
);
