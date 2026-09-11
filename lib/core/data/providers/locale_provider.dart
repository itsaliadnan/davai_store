import 'package:davai_store/core/services/locale_service.dart';
import 'package:davai_store/core/storage/locale_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:davai_store/localization/strings.g.dart';

final localeServiceProvider = Provider((ref) => LocaleService(LocaleStorage()));

final localeProvider = StateNotifierProvider<LocaleController, Locale>(
  (ref) => LocaleController(ref.read(localeServiceProvider)),
);

class LocaleController extends StateNotifier<Locale> {
  final LocaleService service;

  LocaleController(this.service) : super(AppLocale.en.flutterLocale);

  Future<void> load() async {
    final locale = await service.getInitialLocale();
    state = locale.flutterLocale;
    LocaleSettings.setLocale(locale);
  }

  Future<void> setLocale(AppLocale locale) async {
    state = locale.flutterLocale;
    LocaleSettings.setLocale(locale);

    await service.saveLocale(locale);
  }
}
