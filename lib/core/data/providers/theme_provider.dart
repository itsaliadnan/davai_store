import 'package:davai_store/core/services/theme_service.dart';
import 'package:davai_store/core/storage/theme_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeServiceProvider = Provider((ref) => ThemeService(ThemeStorage()));

final themeProvider = StateNotifierProvider<ThemeController, ThemeMode>(
  (ref) => ThemeController(ref.read(themeServiceProvider)),
);

class ThemeController extends StateNotifier<ThemeMode> {
  final ThemeService service;

  ThemeController(this.service) : super(ThemeMode.system);

  Future<void> load() async {
    state = await service.getInitialTheme();
  }

  Future<void> setTheme(ThemeMode mode) async {
    state = mode;
    await service.saveTheme(mode);
  }

  Future<void> toggle() async {
    switch (state) {
      case ThemeMode.light:
        await setTheme(ThemeMode.dark);
        break;

      case ThemeMode.dark:
        await setTheme(ThemeMode.system);
        break;

      case ThemeMode.system:
        await setTheme(ThemeMode.light);
        break;
    }
  }
}
