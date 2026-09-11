import 'package:davai_store/localization/strings.g.dart';
import '../storage/locale_storage.dart';

class LocaleService {
  final LocaleStorage storage;

  LocaleService(this.storage);

  Future<AppLocale> getInitialLocale() async {
    return await storage.load() ?? AppLocale.en;
  }

  Future<void> saveLocale(AppLocale locale) async {
    await storage.save(locale);
  }
}
