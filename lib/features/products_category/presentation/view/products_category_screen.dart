import 'package:davai_store/core/extentions/theme_extentions.dart';
import 'package:davai_store/core/theme/spacing.dart';

import 'package:davai_store/features/products_category/presentation/components/category_card.dart';
import 'package:davai_store/features/products_category/data/providers/category_provider.dart';
import 'package:davai_store/localization/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductsCategoryScreen extends ConsumerWidget {
  const ProductsCategoryScreen({super.key});

  void _openCategory(BuildContext context, String name) {}

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colorScheme;
    final categoriesAsync = ref.watch(categoryProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Material(
                    color: colors.surfaceContainer,
                    shape: const CircleBorder(),
                    child: InkWell(
                      customBorder: const CircleBorder(),
                      onTap: () => Navigator.of(context).pop(),
                      child: SizedBox(
                        width: 36,
                        height: 36,
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 16,
                          color: colors.onSurface,
                        ),
                      ),
                    ),
                  ),
                  Transform.rotate(
                    angle: 0.26,
                    child: Icon(
                      Icons.auto_awesome_rounded,
                      size: 22,
                      color: colors.secondary,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 14),

              Text(
                context.t.category.browseBy,
                style: context.text.headlineSmall?.copyWith(
                  letterSpacing: -0.3,
                  height: 1.15,
                ),
              ),

              const SizedBox(height: 2),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: colors.primary,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  context.t.category.category,
                  style: context.text.headlineSmall?.copyWith(
                    color: context.colorScheme.onPrimary,
                    letterSpacing: -0.3,
                    height: 1.15,
                  ),
                ),
              ),

              const SizedBox(height: 18),

              // CONTENT
              Expanded(
                child: categoriesAsync.when(
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (e, _) => Center(
                    child: Text(
                      'حدث خطأ: $e',
                      style: context.text.bodyMedium?.copyWith(
                        color: colors.error,
                      ),
                    ),
                  ),
                  data: (categories) {
                    if (categories.isEmpty) {
                      return Center(
                        child: Text(
                          context.t.category.noCategories,
                          style: context.text.bodyMedium?.copyWith(
                            color: colors.onSurfaceVariant,
                          ),
                        ),
                      );
                    }

                    final featured = categories.first;
                    final rest = categories.skip(1).toList();

                    return SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CategoryCard(
                            large: true,
                            name: featured.name,
                            itemCount: featured.productCount,
                            imageUrl: featured.image,
                            icon: Icons.category_outlined,
                            badgeLabel: context.t.category.mostProducts,
                            onTap: () => _openCategory(context, featured.name),
                          ),

                          if (rest.isNotEmpty) ...[
                            const SizedBox(height: 10),
                            GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: rest.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    childAspectRatio: 0.95,
                                  ),
                              itemBuilder: (context, index) {
                                final category = rest[index];

                                return CategoryCard(
                                  name: category.name,
                                  itemCount: category.productCount,
                                  imageUrl: category.image,
                                  icon: Icons.category_outlined,
                                  onTap: () =>
                                      _openCategory(context, category.name),
                                );
                              },
                            ),
                          ],
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
