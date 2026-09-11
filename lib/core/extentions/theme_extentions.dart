import 'package:flutter/material.dart';

extension AppThemeContext on BuildContext {
  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => theme.colorScheme;

  TextTheme get text => theme.textTheme;

  bool get isDark => theme.brightness == Brightness.dark;

  bool get isLight => !isDark;
}
