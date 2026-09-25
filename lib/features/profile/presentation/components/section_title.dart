import 'package:davai_store/core/extentions/theme_extentions.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        title,
        style: context.text.labelMedium?.copyWith(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: context.colorScheme.surfaceDim,
          letterSpacing: 0.6,
        ),
      ),
    );
  }
}
