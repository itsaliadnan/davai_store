import 'package:davai_store/core/extentions/theme_extentions.dart';
import 'package:davai_store/features/profile/components/about_action_tile.dart';
import 'package:davai_store/features/profile/components/about_header.dart';
import 'package:davai_store/features/profile/components/about_info_tile.dart';
import 'package:davai_store/features/profile/components/about_section.dart';
import 'package:davai_store/localization/strings.g.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  static const String appVersion = '1.0.0';

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final text = context.text;

    return Scaffold(
      appBar: AppBar(title: Text(context.t.profile.about), centerTitle: true),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
          child: Column(
            children: [
              const AboutHeader(),

              const SizedBox(height: 32),

              AboutSection(
                title: context.t.profile.about,
                children: [
                  AboutInfoTile(
                    icon: Icons.info_outline_rounded,
                    title: context.t.profile.aboutDavaiTitle,
                    subtitle: context.t.profile.davaiAbout,
                  ),
                ],
              ),

              const SizedBox(height: 24),

              const SizedBox(height: 24),

              AboutSection(
                title: context.t.profile.support,
                children: [
                  AboutActionTile(
                    icon: Icons.star_outline_rounded,
                    title: context.t.profile.rateTheApp,
                    onTap: () {},
                  ),
                ],
              ),

              const SizedBox(height: 32),

              Text(
                'Version $appVersion',
                style: text.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),

              const SizedBox(height: 6),

              Text(
                '© 2026 Davai',
                style: text.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
