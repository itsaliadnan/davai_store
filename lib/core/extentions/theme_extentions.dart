import 'package:flutter/material.dart';

extension AppThemeContext on BuildContext {
  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => theme.colorScheme;

  TextTheme get text => theme.textTheme;

  Color get success => const Color(0xFF81C784);

  Color get warning => const Color(0xFFF2C94C);

  bool get isDark => theme.brightness == Brightness.dark;

  bool get isLight => !isDark;
}
