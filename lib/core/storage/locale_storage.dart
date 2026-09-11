import 'package:shared_preferences/shared_preferences.dart';
import 'package:davai_store/localization/strings.g.dart';

class LocaleStorage {
  static const _key = 'locale';

  Future<void> save(AppLocale locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, locale.name);
  }

  Future<AppLocale?> load() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(_key);

    if (value == null) return null;

    return AppLocale.values.firstWhere(
      (e) => e.name == value,
      orElse: () => AppLocale.en,
    );
  }
}
