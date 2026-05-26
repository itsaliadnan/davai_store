import 'package:davai_store/core/extentions/theme_extentions.dart';
import 'package:davai_store/core/theme/spacing.dart';
import 'package:davai_store/core/theme/typography.dart';
import 'package:davai_store/core/model/promo_model.dart';
import 'package:flutter/material.dart';

class PromoCard extends StatelessWidget {
  final PromoModel promo;
  final VoidCallback onTap;

  const PromoCard({super.key, required this.promo, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      padding: const EdgeInsets.all(AppSpacing.lg),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSpacing.lg),
        gradient: LinearGradient(
          colors: [
            context.colorScheme.primaryContainer,
            context.colorScheme.primaryContainer,
          ],
        ),
      ),

      child: Stack(
        children: [
          // النص + الزر
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                promo.title,
                style: AppTextStyles.small.copyWith(
                  color: context.colorScheme.primary,
                ),

                // color: context.colorScheme.secondary,
                // fontSize: 22,
                // fontWeight: FontWeight.bold,
              ),

              const SizedBox(height: AppSpacing.sm),

              SizedBox(
                height: 60,
                child: Text(
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  promo.subtitle,
                  style: AppTextStyles.title.copyWith(
                    color: context.colorScheme.secondary,
                  ),
                ),
              ),

              const SizedBox(height: AppSpacing.md),

              ElevatedButton(
                onPressed: onTap,
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.colorScheme.primary,
                  foregroundColor: context.colorScheme.onPrimary,
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.lg,
                    vertical: AppSpacing.xs,
                  ),
                ),
                child: Text(promo.buttonText),
              ),
            ],
          ),

          // الصورة
          Positioned(
            right: 0,
            child: Image.asset(
              promo.image,
              height: 140,
              width: 120,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
