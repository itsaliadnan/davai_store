import 'package:davai_store/core/extentions/theme_extentions.dart';
import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color? iconColor;

  const CircleButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;

    return Material(
      color: context.colorScheme.onPrimary,
      elevation: 2,
      shadowColor: context.colorScheme.onSurface.withValues(alpha: 0.15),
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(
          width: 42,
          height: 42,
          child: Icon(
            icon,
            size: 19,
            color: iconColor ?? colors.onPrimaryFixed,
          ),
        ),
      ),
    );
  }
}
