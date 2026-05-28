import 'package:davai_store/core/extentions/theme_extentions.dart';
import 'package:davai_store/core/theme/spacing.dart';
import 'package:davai_store/features/product_details/presentation/components/product_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actionsPadding: const EdgeInsets.only(right: AppSpacing.md),
        actions: [
          Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: context.colorScheme.surfaceContainer,
              borderRadius: BorderRadius.circular(AppSpacing.lg),
            ),
            child: IconButton(
              icon: Icon(
                size: 16,
                Icons.notifications_none,
                color: context.colorScheme.primary,
              ),
              onPressed: () {
                context.go('/notifications');
              },
            ),
          ),
        ],
        title: Text('Product Details'),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xs),
          child: Column(
            children: [
              const ProductSlider(),
              SizedBox(height: AppSpacing.lg),

              Text(
                'sumsetlamp',
                style: context.textTheme.headlineLarge,
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
