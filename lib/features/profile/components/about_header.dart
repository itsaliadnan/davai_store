import 'package:davai_store/core/extentions/theme_extentions.dart';
import 'package:davai_store/localization/strings.g.dart';
import 'package:flutter/material.dart';

class AboutHeader extends StatelessWidget {
  const AboutHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final text = context.text;

    return Column(
      children: [
        Container(
          width: 96,
          height: 96,
          decoration: BoxDecoration(
            color: colorScheme.primaryContainer,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.storefront_rounded,
            size: 48,
            color: colorScheme.onPrimaryContainer,
          ),
        ),

        const SizedBox(height: 20),

        Text(
          context.t.profile.davai,
          style: text.headlineSmall?.copyWith(fontWeight: FontWeight.w700),
        ),

        const SizedBox(height: 8),

        Text(
          context.t.profile.yourHomeYourStyle,
          textAlign: TextAlign.center,
          style: text.bodyMedium?.copyWith(color: colorScheme.onSurfaceVariant),
        ),
      ],
    );
  }
}
