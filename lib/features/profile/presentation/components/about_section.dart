import 'package:davai_store/core/extentions/theme_extentions.dart';
import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const AboutSection({super.key, required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 4, bottom: 10),
          child: Text(
            title,
            style: context.text.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ),

        Container(
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerLow,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            children: _buildSeparatedChildren(
              children,
              colorScheme.outlineVariant,
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildSeparatedChildren(
    List<Widget> children,
    Color dividerColor,
  ) {
    final items = <Widget>[];

    for (var i = 0; i < children.length; i++) {
      items.add(children[i]);

      if (i < children.length - 1) {
        items.add(
          Divider(
            height: 1,
            thickness: 1,
            indent: 60,
            endIndent: 16,
            color: dividerColor.withValues(alpha: 0.35),
          ),
        );
      }
    }

    return items;
  }
}
