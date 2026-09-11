import 'package:flutter/material.dart';
import '../storage/theme_storage.dart';

class ThemeService {
  final ThemeStorage storage;

  ThemeService(this.storage);

  Future<ThemeMode> getInitialTheme() async {
    return await storage.load();
  }

  Future<void> saveTheme(ThemeMode mode) async {
    await storage.save(mode);
  }
}
