import 'package:davai_store/core/extentions/theme_extentions.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String name;
  final int itemCount;
  final String imageUrl;
  final IconData icon;
  final bool large;
  final String? badgeLabel;
  final VoidCallback onTap;

  const CategoryCard({
    super.key,
    required this.name,
    required this.itemCount,
    required this.imageUrl,
    required this.icon,
    required this.onTap,
    this.large = false,
    this.badgeLabel,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(large ? 18 : 16),
        child: AspectRatio(
          aspectRatio: large ? 16 / 9 : 0.95,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                color: colors.surfaceContainer,
                child: imageUrl.isNotEmpty
                    ? Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (_, _, _) => Center(
                          child: Icon(
                            icon,
                            size: large ? 36 : 26,
                            color: colors.onSurfaceVariant,
                          ),
                        ),
                      )
                    : Center(
                        child: Icon(
                          icon,
                          size: large ? 36 : 26,
                          color: colors.onSurfaceVariant,
                        ),
                      ),
              ),

              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        context.colorScheme.onSurface.withValues(alpha: 0.75),
                      ],
                      stops: const [0.45, 1],
                    ),
                  ),
                ),
              ),

              if (badgeLabel != null)
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 9,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: context.colorScheme.onPrimary.withValues(
                        alpha: 0.9,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      badgeLabel!,
                      style: context.text.labelSmall?.copyWith(
                        fontSize: 8,
                        fontWeight: FontWeight.w700,
                        color: colors.onSurface,
                      ),
                    ),
                  ),
                ),

              Positioned(
                left: 12,
                bottom: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: context.text.labelLarge?.copyWith(
                        fontSize: large ? 14 : 11,
                        fontWeight: FontWeight.w800,
                        color: context.colorScheme.onPrimary,
                      ),
                    ),
                    const SizedBox(height: 1),
                    Text(
                      '$itemCount منتج',
                      style: context.text.labelSmall?.copyWith(
                        fontSize: large ? 9 : 8,
                        color: context.colorScheme.onPrimary.withValues(
                          alpha: 0.75,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
