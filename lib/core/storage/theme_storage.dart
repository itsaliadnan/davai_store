import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class ThemeStorage {
  static const _key = 'theme_mode';

  Future<void> save(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, mode.name);
  }

  Future<ThemeMode> load() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(_key);

    if (value == null) return ThemeMode.system;

    return ThemeMode.values.firstWhere(
      (e) => e.name == value,
      orElse: () => ThemeMode.system,
    );
  }
}
