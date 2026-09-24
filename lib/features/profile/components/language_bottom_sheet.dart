import 'package:davai_store/core/data/providers/locale_provider.dart';
import 'package:davai_store/core/extentions/theme_extentions.dart';
import 'package:davai_store/localization/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LanguageBottomSheet extends StatelessWidget {
  final Locale currentLocale;

  const LanguageBottomSheet({super.key, required this.currentLocale});

  static void show(BuildContext context, Locale currentLocale) {
    showModalBottomSheet(
      backgroundColor: context.colorScheme.surfaceContainer,

      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return LanguageBottomSheet(currentLocale: currentLocale);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 8),

          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: context.colorScheme.surfaceContainer,
              borderRadius: BorderRadius.circular(20),
            ),
          ),

          const SizedBox(height: 8),

          Text(
            context.t.profile.chooseLanguage,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),

          const SizedBox(height: 8),

          LanguageTile(
            locale: AppLocale.en,
            title: context.t.profile.english,
            currentLocale: currentLocale,
          ),

          const SizedBox(height: 8),

          LanguageTile(
            locale: AppLocale.ar,
            title: context.t.profile.arabic,
            currentLocale: currentLocale,
          ),

          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class LanguageTile extends ConsumerWidget {
  final AppLocale locale;
  final String title;
  final Locale currentLocale;

  const LanguageTile({
    super.key,
    required this.locale,
    required this.title,
    required this.currentLocale,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelected = currentLocale == locale.flutterLocale;

    return ListTile(
      leading: const Icon(Icons.language),
      title: Text(title),
      trailing: isSelected
          ? const Icon(Icons.check, color: Colors.green)
          : null,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      tileColor: isSelected
          ? context.colorScheme.onSurfaceVariant.withValues(alpha: 0.08)
          : null,
      onTap: () {
        ref.read(localeProvider.notifier).setLocale(locale);
        Navigator.pop(context);
      },
    );
  }
}
