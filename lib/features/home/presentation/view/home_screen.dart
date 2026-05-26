import 'package:davai_store/core/extentions/theme_extentions.dart';
import 'package:davai_store/core/theme/spacing.dart';
import 'package:davai_store/features/home/presentation/components/category_section.dart';
import 'package:davai_store/features/home/presentation/components/products_section.dart';
import 'package:davai_store/features/home/presentation/components/search_bar.dart';
import 'package:davai_store/features/home/presentation/components/promo_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
        title: Text('Davai Store'),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xs),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SearchBarWidget(),
              SizedBox(height: AppSpacing.lg),
              const PromoSlider(),
              SizedBox(height: AppSpacing.lg),
              const CategorySection(),
              SizedBox(height: AppSpacing.lg),
              const ProductsSection(),
              SizedBox(height: AppSpacing.lg),
            ],
          ),
        ),
      ),
    );
  }
}
// lib/
//  ├── core/
//  │    ├── theme/
//  │    ├── router/
//  │    ├── extensions/
//  │    ├── utils/
//  │    ├── widgets/
//  │
//  ├── features/
//  │    ├── home/
//  │    │    ├── presentation/
//  │    │    ├── domain/
//  │    │    ├── data/
//  │    │
//  │    ├── search/
//  │    ├── notifications/
//  │
//  ├── shared/
//  └── main.dart