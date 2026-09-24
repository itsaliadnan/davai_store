import 'package:davai_store/core/data/providers/locale_provider.dart';
import 'package:davai_store/core/data/providers/theme_provider.dart';
import 'package:davai_store/core/extentions/theme_extentions.dart';
import 'package:davai_store/features/profile/components/language_bottom_sheet.dart';
import 'package:davai_store/features/profile/components/section_title.dart';
import 'package:davai_store/features/profile/components/settings_card.dart';
import 'package:davai_store/features/profile/components/settings_item.dart';
import 'package:davai_store/localization/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PreferencesCard extends ConsumerWidget {
  const PreferencesCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final locale = ref.watch(localeProvider);

    final isEnglish = locale == AppLocale.en.flutterLocale;

    final themeName = switch (theme) {
      ThemeMode.light => context.t.profile.light,
      ThemeMode.dark => context.t.profile.dark,
      ThemeMode.system => context.t.profile.system,
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        const SizedBox(height: 8),

        SectionTitle(title: context.t.profile.prefrences),

        SettingsCard(
          items: [
            //THEME
            SettingItem(
              icon: Icons.dark_mode,
              title: context.t.profile.theme,
              subtitle: themeName,
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                showModalBottomSheet(
                  backgroundColor: context.colorScheme.surfaceContainer,
                  context: context,
                  showDragHandle: true,
                  builder: (context) {
                    return SafeArea(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            leading: const Icon(Icons.light_mode),
                            title: Text(context.t.profile.light),
                            trailing: theme == ThemeMode.light
                                ? const Icon(Icons.check)
                                : null,
                            onTap: () {
                              ref
                                  .read(themeProvider.notifier)
                                  .setTheme(ThemeMode.light);

                              Navigator.pop(context);
                            },
                          ),

                          ListTile(
                            leading: const Icon(Icons.dark_mode),
                            title: Text(context.t.profile.dark),
                            trailing: theme == ThemeMode.dark
                                ? const Icon(Icons.check)
                                : null,
                            onTap: () {
                              ref
                                  .read(themeProvider.notifier)
                                  .setTheme(ThemeMode.dark);

                              Navigator.pop(context);
                            },
                          ),

                          ListTile(
                            leading: const Icon(Icons.settings_suggest),
                            title: Text(context.t.profile.system),
                            trailing: theme == ThemeMode.system
                                ? const Icon(Icons.check)
                                : null,
                            onTap: () {
                              ref
                                  .read(themeProvider.notifier)
                                  .setTheme(ThemeMode.system);

                              Navigator.pop(context);
                            },
                          ),

                          const SizedBox(height: 8),
                        ],
                      ),
                    );
                  },
                );
              },
            ),

            const Divider(height: 1),

            // LANGUAGE
            SettingItem(
              icon: Icons.language,
              title: context.t.profile.language,
              subtitle: isEnglish
                  ? context.t.profile.english
                  : context.t.profile.arabic,
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                LanguageBottomSheet.show(context, locale);
              },
            ),
          ],
        ),

        const SizedBox(height: 8),
      ],
    );
  }
}
