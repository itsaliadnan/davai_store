import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // ─────────────────────────────────────────────
  // GOLD RAMP — shared across both modes
  // ─────────────────────────────────────────────
  static const Color goldSubtle = Color(0xFFFBF6EE); // hero bg wash
  static const Color goldLight = Color(0xFFDFCFA0); // tint · image bg
  static const Color gold = Color(0xFFC8A86C); // primary · CTAs · accents
  static const Color goldDark = Color(0xFFB8954D); // prices · hover · pressed
  static const Color onGold = Color(0xFF1A0E00); // text placed on gold buttons

  // ─────────────────────────────────────────────
  // SEMANTIC — shared across both modes
  // ─────────────────────────────────────────────
  static const Color alertRed = Color(0xFFE24B4A); // error · badges · sale dots
  static const Color alertRedTint = Color(
    0xFFFEF0F0,
  ); // error bg (light mode only)
  static const Color successGreen = Color(
    0xFF639922,
  ); // free shipping · ok states
  static const Color successTint = Color(
    0xFFEAF3DE,
  ); // success bg (light mode only)

  // ─────────────────────────────────────────────
  // DARK MODE — SURFACES
  // ─────────────────────────────────────────────
  static const Color darkBackground = Color(0xFF090909); // app base bg
  static const Color darkNavBar = Color(0xFF0C0C0C); // bottom nav bg
  static const Color darkCard = Color(0xFF131313); // product cards
  static const Color darkElevated = Color(0xFF161616); // chips · icon buttons
  static const Color darkInput = Color(0xFF111111); // search · text fields
  static const Color darkStepper = Color(0xFF1A1A1A); // qty steppers · tags

  // DARK MODE — TEXT
  static const Color darkTextPrimary = Color(0xFFE4DDD0); // headlines · labels
  static const Color darkTextSecondary = Color(
    0xFF9A9A94,
  ); // subtitles · values
  static const Color darkTextTertiary = Color(0xFF666260); // greetings · hints
  static const Color darkTextMuted = Color(0xFF555550); // meta · brand names
  static const Color darkTextDisabled = Color(
    0xFF444440,
  ); // strikethrough · off

  // DARK MODE — BORDERS
  static const Color darkBorderSubtle = Color(
    0xFF1E1E1E,
  ); // dividers · sections
  static const Color darkBorderInput = Color(0xFF222222); // search · inputs
  static const Color darkBorderElement = Color(0xFF252525); // chips · buttons
  static const Color darkBorderFrame = Color(0xFF2E2E2E); // device frame

  // DARK MODE — NAV
  static const Color darkNavInactive = Color(0xFF3A3A36);
  static const Color darkNavActive = gold;

  // ─────────────────────────────────────────────
  // LIGHT MODE — SURFACES
  // ─────────────────────────────────────────────
  static const Color lightBackground = Color(0xFFFFFFFF); // app base bg
  static const Color lightNavBar = Color(0xFFFAF8F5); // bottom nav bg
  static const Color lightCard = Color(0xFFEEEBE5); // product cards
  static const Color lightElevated = Color(0xFFE8E4DC); // chips · icon buttons
  static const Color lightInput = Color(0xFFF0EDE8); // search · text fields
  static const Color lightPageBg = Color(0xFFF5F2EE); // warm canvas

  // LIGHT MODE — TEXT
  static const Color lightTextPrimary = Color(0xFF1A1410); // headlines · labels
  static const Color lightTextSecondary = Color(0xFF3D3530); // body · values
  static const Color lightTextTertiary = Color(0xFF6B6460); // hints · greetings
  static const Color lightTextMuted = Color(0xFF9A9490); // meta · brand names
  static const Color lightTextDisabled = Color(
    0xFFB8B2AC,
  ); // inactive · off states

  // LIGHT MODE — BORDERS
  static const Color lightBorderSubtle = Color(
    0xFFE2DED8,
  ); // dividers · sections
  static const Color lightBorderInput = Color(0xFFD5D0CA); // search · inputs
  static const Color lightBorderElement = Color(0xFFC8C2BC); // chips · buttons

  // LIGHT MODE — NAV
  static const Color lightNavInactive = Color(0xFF8A8A80);
  static const Color lightNavActive = gold;

  // ─────────────────────────────────────────────
  // PRODUCT IMAGE BACKGROUNDS
  // ─────────────────────────────────────────────
  static const Color imgBgCamel = Color(0xFF17130B);
  static const Color imgBgNavy = Color(0xFF0D1119);
  static const Color imgBgForest = Color(0xFF0B140F);
  static const Color imgBgBrown = Color(0xFF14100D);
  static const Color imgBgPurple = Color(0xFF100D15);
}
