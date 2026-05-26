import 'package:davai_store/core/extentions/theme_extentions.dart';
import 'package:davai_store/core/theme/spacing.dart';
import 'package:davai_store/features/home/presentation/components/category_section.dart';
import 'package:davai_store/features/home/presentation/components/products_section.dart';
import 'package:davai_store/features/search/presentation/components/sorted_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              icon: SvgPicture.asset(
                'assets/icons/filter.svg',
                color: context.colorScheme.primary,
                height: 16,
              ),
              onPressed: () {
                context.go('/notifications');
              },
            ),
          ),
          SizedBox(width: AppSpacing.md),
          Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: context.colorScheme.surfaceContainer,
              borderRadius: BorderRadius.circular(AppSpacing.lg),
            ),
            child: IconButton(
              icon: SvgPicture.asset(
                'assets/icons/category.svg',
                color: context.colorScheme.primary,
                height: 16,
              ),
              onPressed: () {
                context.go('/notifications');
              },
            ),
          ),
        ],
        title: Text('Shop'),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: AppSpacing.lg),
              const CategorySection(),
              SizedBox(height: AppSpacing.lg),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Products', style: context.textTheme.titleMedium),

                  SortByButton(),
                ],
              ),

              SizedBox(height: AppSpacing.sm),
              const ProductsSection(),
              SizedBox(height: AppSpacing.lg),
            ],
          ),
        ),
      ),
    );
  }
}
