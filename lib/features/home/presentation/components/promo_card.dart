import 'package:davai_store/core/extentions/theme_extentions.dart';
import 'package:davai_store/features/home/data/model/promo_model.dart';
import 'package:flutter/material.dart';

class PromoCard extends StatelessWidget {
  final PromoModel promo;
  final VoidCallback onTap;

  const PromoCard({super.key, required this.promo, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: context.colorScheme.primary.withValues(alpha: 0.25),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            /// BACKGROUND IMAGE
            Image.network(
              promo.image,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(color: context.colorScheme.primary);
              },
            ),

            /// FADED OVERLAY
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    context.colorScheme.primary.withValues(alpha: 0.85),
                    context.colorScheme.primary.withValues(alpha: 0.55),
                    context.colorScheme.primary.withValues(alpha: 0.20),
                  ],
                ),
              ),
            ),

            /// CONTENT
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    promo.title.toUpperCase(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                      color: context.colorScheme.onPrimary.withValues(
                        alpha: 0.85,
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  SizedBox(
                    width: 220,
                    child: Text(
                      promo.description ?? '',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 20,
                        height: 1.2,
                        fontWeight: FontWeight.w700,
                        color: context.colorScheme.onPrimary,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  ElevatedButton(
                    onPressed: onTap,
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: context.colorScheme.onPrimary,
                      foregroundColor: context.colorScheme.primary,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Text(
                      'تسوق الان',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
