import 'package:davai_store/features/profile/components/section_title.dart';
import 'package:davai_store/features/profile/components/settings_card.dart';
import 'package:davai_store/features/profile/components/settings_item.dart';
import 'package:davai_store/features/profile/components/theme_color_test.dart';
import 'package:davai_store/localization/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MoreCard extends StatelessWidget {
  const MoreCard({super.key});

  @override
  Widget build(BuildContext context) {
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

            const Divider(height: 1, indent: 74),

            SettingItem(
              icon: Icons.palette_outlined,
              title: 'Theme Colors',
              subtitle: 'Preview app colors',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ColorPreviewScreen()),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
