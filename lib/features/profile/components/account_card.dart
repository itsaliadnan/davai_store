import 'package:davai_store/core/data/providers/locale_provider.dart';
import 'package:davai_store/core/data/providers/theme_provider.dart';
import 'package:davai_store/features/auth/presentation/providers/user_session_provider.dart';
import 'package:davai_store/features/profile/components/settings_card.dart';
import 'package:davai_store/features/profile/components/settings_item.dart';
import 'package:davai_store/localization/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AccountCard extends ConsumerWidget {
  const AccountCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(themeProvider) == ThemeMode.dark;
    final locale = ref.watch(localeProvider);

    final isEnglish = locale == AppLocale.en.flutterLocale;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),

        // ================= ACCOUNT =================
        _sectionTitle(context.t.profile.account),

        SettingsCard(
          items: [
            SettingItem(
              icon: Icons.person,
              title: context.t.profile.myAccount,
              subtitle: context.t.profile.editProfile,
              onTap: () {},
            ),
          ],
        ),

        const SizedBox(height: 8),

        // ================= PREFERENCES =================
        _sectionTitle(context.t.profile.prefrences),

        SettingsCard(
          items: [
            // 🌙 THEME
            SettingItem(
              icon: Icons.dark_mode,
              title: context.t.profile.theme,
              subtitle: isDark
                  ? context.t.profile.dark
                  : context.t.profile.light,
              trailing: Switch.adaptive(
                value: isDark,
                onChanged: (_) {
                  ref.read(themeProvider.notifier).toggle();
                },
              ),
            ),

            const Divider(height: 1),

            // 🌐 LANGUAGE
            SettingItem(
              icon: Icons.language,
              title: context.t.profile.language,
              subtitle: isEnglish ? "English" : "العربية",
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                _showLanguageSheet(context, ref, locale);
              },
            ),
          ],
        ),

        const SizedBox(height: 8),

        // ================= SECURITY =================
        _sectionTitle(context.t.profile.security),
        SettingsCard(
          items: [
            SettingItem(
              icon: Icons.password_rounded,
              title: context.t.profile.changePassword,
              subtitle: context.t.profile.secureYourAccount,
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () {
                context.push('/change-password');
              },
            ),
          ],
        ),

        const SizedBox(height: 12),

        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: Colors.red.withValues(alpha: 0.12)),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(18),
              onTap: () async {
                await ref.read(userSessionControllerProvider.notifier).logout();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 15,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: Colors.red.withValues(alpha: 0.10),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.logout_rounded,
                        color: Colors.red,
                        size: 21,
                      ),
                    ),

                    const SizedBox(width: 14),

                    Expanded(
                      child: Text(
                        context.t.profile.logout,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 15,
                      color: Colors.red.withValues(alpha: 0.45),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SettingsCard(
          items: [
            SettingItem(
              icon: Icons.password,
              title: context.t.profile.changePassword,
              subtitle: context.t.profile.secureYourAccount,
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                context.push('/change-password');
              },
            ),
          ],
        ),

        const SizedBox(height: 8),
      ],
    );
  }

  // ================= SECTION TITLE =================
  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: Colors.grey,
          letterSpacing: 0.6,
        ),
      ),
    );
  }

  // ================= LANGUAGE BOTTOM SHEET =================
  void _showLanguageSheet(
    BuildContext context,
    WidgetRef ref,
    Locale currentLocale,
  ) {
    showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 8),

              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "Choose Language",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 8),

              _languageTile(
                context,
                ref,
                AppLocale.en,
                "English",
                currentLocale,
              ),
              const SizedBox(height: 8),

              _languageTile(
                context,
                ref,
                AppLocale.ar,
                "العربية",
                currentLocale,
              ),

              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }

  // ================= LANGUAGE TILE =================
  Widget _languageTile(
    BuildContext context,
    WidgetRef ref,
    AppLocale locale,
    String title,
    Locale currentLocale,
  ) {
    final isSelected = currentLocale == locale.flutterLocale;

    return ListTile(
      leading: const Icon(Icons.language),
      title: Text(title),
      trailing: isSelected
          ? const Icon(Icons.check, color: Colors.green)
          : null,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      tileColor: isSelected ? Colors.green.withValues(alpha: 0.08) : null,
      onTap: () {
        ref.read(localeProvider.notifier).setLocale(locale);
        Navigator.pop(context);
      },
    );
  }
}
