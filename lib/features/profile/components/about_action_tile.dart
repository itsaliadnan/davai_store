import 'package:davai_store/core/extentions/theme_extentions.dart';
import 'package:davai_store/features/profile/components/about_icon.dart';
import 'package:flutter/material.dart';

class AboutActionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const AboutActionTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: AboutIcon(icon: icon, color: colorScheme.onSurfaceVariant),
      title: Text(
        title,
        style: context.text.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
      ),
      trailing: Icon(
        Icons.chevron_right_rounded,
        color: colorScheme.onSurfaceVariant,
      ),
      onTap: onTap,
    );
  }
}
