import 'package:flutter/material.dart';

class SettingItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  const SettingItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
      leading: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: colorScheme.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          size: 21,
          color: colorScheme.onSurfaceVariant.withValues(alpha: 0.65),
        ),
      ),
      title: Text(
        title,
        style: theme.textTheme.titleSmall?.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: subtitle.isEmpty
          ? null
          : Padding(
              padding: const EdgeInsets.only(top: 3),
              child: Text(
                subtitle,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.textTheme.bodySmall?.color?.withValues(
                    alpha: 0.65,
                  ),
                ),
              ),
            ),
      trailing:
          trailing ??
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 15,
            color: theme.iconTheme.color?.withValues(alpha: 0.45),
          ),
      onTap: onTap,
    );
  }
}
