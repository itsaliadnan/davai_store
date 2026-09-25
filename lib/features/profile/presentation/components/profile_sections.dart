import 'package:davai_store/core/data/providers/locale_provider.dart';
import 'package:davai_store/core/data/providers/settings_provider.dart';
import 'package:davai_store/core/data/providers/theme_provider.dart';
import 'package:davai_store/core/extentions/theme_extentions.dart';
import 'package:davai_store/features/profile/data/model/delivery_zone_model.dart';
import 'package:davai_store/features/profile/presentation/components/language_bottom_sheet.dart';
import 'package:davai_store/features/profile/presentation/components/section_title.dart';
import 'package:davai_store/features/profile/presentation/components/settings_card.dart';
import 'package:davai_store/features/profile/presentation/components/settings_item.dart';
import 'package:davai_store/localization/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProfileSections extends ConsumerWidget {
  const ProfileSections({super.key});

  Future<void> _openZonePicker(BuildContext context, WidgetRef ref) async {
    final zonesAsync = ref.read(deliveryZonesProvider);
    final zones = zonesAsync.valueOrNull;

    if (zones == null || zones.isEmpty) return;

    final selectedId = await showModalBottomSheet<int>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),

              Text(
                context.t.profile.deliveryZones,
                style: Theme.of(context).textTheme.titleMedium,
              ),

              const SizedBox(height: 8),

              ...zones.map(
                (zone) => ListTile(
                  title: Text(zone.name),
                  trailing: Text('${zone.fee.toStringAsFixed(0)} د.ع'),
                  onTap: () => Navigator.pop(context, zone.id),
                ),
              ),

              const SizedBox(height: 100),
            ],
          ),
        );
      },
    );

    if (selectedId != null) {
      await ref.read(selectedZoneIdProvider.notifier).selectZone(selectedId);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _accountSection(context),

        _deliverySection(context, ref),

        _preferencesSection(context, ref),

        _securitySection(context),

        _moreSection(context),

        const SizedBox(height: 8),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // ACCOUNT
  // ---------------------------------------------------------------------------

  Widget _accountSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),

        SectionTitle(title: context.t.profile.account),

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
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // DELIVERY ZONES
  // ---------------------------------------------------------------------------

  Widget _deliverySection(BuildContext context, WidgetRef ref) {
    final zonesAsync = ref.watch(deliveryZonesProvider);
    final selectedZoneIdAsync = ref.watch(selectedZoneIdProvider);

    final selectedZoneName = zonesAsync.maybeWhen(
      data: (zones) {
        final selectedId = selectedZoneIdAsync.valueOrNull;

        final zone = zones
            .where((zone) => zone.id == selectedId)
            .cast<DeliveryZoneModel?>()
            .firstOrNull;

        return zone?.name;
      },
      orElse: () => null,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),

        SectionTitle(title: context.t.profile.deliveryZones),

        SettingsCard(
          items: [
            SettingItem(
              icon: Icons.location_on_outlined,
              title: context.t.profile.deliveryZones,
              subtitle: selectedZoneName ?? context.t.profile.selectZone,
              onTap: () => _openZonePicker(context, ref),
            ),
          ],
        ),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // PREFERENCES
  // ---------------------------------------------------------------------------

  Widget _preferencesSection(BuildContext context, WidgetRef ref) {
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

        SectionTitle(title: context.t.profile.prefrences),

        SettingsCard(
          items: [
            SettingItem(
              icon: Icons.dark_mode,
              title: context.t.profile.theme,
              subtitle: themeName,
              trailing: Icon(
                Icons.chevron_right,
                color: context.colorScheme.onSurfaceVariant,
              ),
              onTap: () {
                _showThemePicker(context, ref, theme);
              },
            ),

            const Divider(height: 1),

            SettingItem(
              icon: Icons.language,
              title: context.t.profile.language,
              subtitle: isEnglish
                  ? context.t.profile.english
                  : context.t.profile.arabic,
              trailing: Icon(
                Icons.chevron_right,
                color: context.colorScheme.onSurfaceVariant,
              ),
              onTap: () {
                LanguageBottomSheet.show(context, locale);
              },
            ),
          ],
        ),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // THEME PICKER
  // ---------------------------------------------------------------------------

  void _showThemePicker(BuildContext context, WidgetRef ref, ThemeMode theme) {
    showModalBottomSheet(
      backgroundColor: context.colorScheme.surfaceContainer,
      context: context,
      showDragHandle: true,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _themeTile(
                context: context,
                ref: ref,
                currentTheme: theme,
                mode: ThemeMode.light,
                icon: Icons.light_mode,
                title: context.t.profile.light,
              ),

              _themeTile(
                context: context,
                ref: ref,
                currentTheme: theme,
                mode: ThemeMode.dark,
                icon: Icons.dark_mode,
                title: context.t.profile.dark,
              ),

              _themeTile(
                context: context,
                ref: ref,
                currentTheme: theme,
                mode: ThemeMode.system,
                icon: Icons.settings_suggest,
                title: context.t.profile.system,
              ),

              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }

  Widget _themeTile({
    required BuildContext context,
    required WidgetRef ref,
    required ThemeMode currentTheme,
    required ThemeMode mode,
    required IconData icon,
    required String title,
  }) {
    return ListTile(
      leading: Icon(icon, color: context.colorScheme.onSurface),
      title: Text(title, style: context.text.bodyLarge),
      trailing: currentTheme == mode
          ? Icon(Icons.check, color: context.success)
          : null,
      onTap: () {
        ref.read(themeProvider.notifier).setTheme(mode);

        Navigator.pop(context);
      },
    );
  }

  // ---------------------------------------------------------------------------
  // SECURITY
  // ---------------------------------------------------------------------------

  Widget _securitySection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),

        SectionTitle(title: context.t.profile.security),

        const SizedBox(height: 12),

        SettingsCard(
          items: [
            SettingItem(
              icon: Icons.password,
              title: context.t.profile.changePassword,
              subtitle: context.t.profile.secureYourAccount,
              trailing: Icon(
                Icons.chevron_right,
                color: context.colorScheme.onSurfaceVariant,
              ),
              onTap: () {
                context.push('/change-password');
              },
            ),
          ],
        ),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // MORE
  // ---------------------------------------------------------------------------

  Widget _moreSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),

        SectionTitle(title: context.t.profile.more),

        SettingsCard(
          items: [
            SettingItem(
              icon: Icons.help_outline_rounded,
              title: context.t.profile.helpAndSupport,
              subtitle: '',
              onTap: () {
                context.push('/help-support');
              },
            ),

            const Divider(height: 1, indent: 74),

            SettingItem(
              icon: Icons.info_outline_rounded,
              title: context.t.profile.about,
              subtitle: '',
              onTap: () {
                context.push('/about');
              },
            ),
          ],
        ),
      ],
    );
  }
}
