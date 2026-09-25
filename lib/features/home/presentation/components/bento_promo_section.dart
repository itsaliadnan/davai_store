import 'package:davai_store/core/extentions/theme_extentions.dart';
import 'package:davai_store/features/home/presentation/components/promo_slider.dart';
import 'package:davai_store/localization/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BentoPromoSection extends StatelessWidget {
  const BentoPromoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(flex: 3, child: PromoSlider()),
          const SizedBox(width: 10),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Expanded(
                  child: _BentoTile(
                    label: context.t.home.newCollection,
                    icon: Icons.auto_awesome_rounded,
                    route: '/products-category-screen',
                    dark: true,
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: _BentoTile(
                    label: context.t.home.discounts,
                    icon: Icons.percent_rounded,
                    route: '/products-category-screen',
                    dark: false,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BentoTile extends StatelessWidget {
  final String label;
  final IconData icon;
  final String route;
  final bool dark;

  const _BentoTile({
    required this.label,
    required this.icon,
    required this.route,
    required this.dark,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;

    return GestureDetector(
      onTap: () => context.push(route),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: dark ? colors.inverseSurface : colors.error,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 18,
              color: dark
                  ? colors.onInverseSurface
                  : context.colorScheme.onPrimary,
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: context.text.labelSmall?.copyWith(
                fontWeight: FontWeight.w800,
                color: dark
                    ? colors.onInverseSurface
                    : context.colorScheme.onPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
