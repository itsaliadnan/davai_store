import 'package:davai_store/features/profile/components/section_title.dart';
import 'package:davai_store/features/profile/components/settings_card.dart';
import 'package:davai_store/features/profile/components/settings_item.dart';
import 'package:davai_store/localization/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SecurityCard extends ConsumerWidget {
  const SecurityCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),

        //SECURITY
        SectionTitle(title: context.t.profile.security),

        const SizedBox(height: 12),

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
}
