import 'package:davai_store/features/products/data/providers/product_provider.dart';
import 'package:davai_store/core/extentions/theme_extentions.dart';
import 'package:davai_store/core/theme/spacing.dart';
import 'package:davai_store/features/products_category/data/model/category_model.dart';
import 'package:davai_store/features/products_category/data/providers/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StoryCategories extends ConsumerStatefulWidget {
  const StoryCategories({super.key});

  @override
  ConsumerState<StoryCategories> createState() => _StoryCategoriesState();
}

class _StoryCategoriesState extends ConsumerState<StoryCategories> {
  static const _prefsKey = 'viewed_story_categories';
  Set<int> _viewed = {};

  @override
  void initState() {
    super.initState();
    _loadViewed();
  }

  Future<void> _loadViewed() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getStringList(_prefsKey) ?? [];

    if (!mounted) return;
    setState(() => _viewed = saved.map(int.parse).toSet());
  }

  Future<void> _markViewed(int categoryId) async {
    if (_viewed.contains(categoryId)) return;

    setState(() => _viewed.add(categoryId));

    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      _prefsKey,
      _viewed.map((id) => id.toString()).toList(),
    );
  }

  static const _recentWindow = Duration(days: 7);

  List<String> _imagesFor(int categoryId) {
    final productsAsync = ref.read(productProvider);
    final cutoff = DateTime.now().subtract(_recentWindow);

    return productsAsync.maybeWhen(
      data: (products) => products
          .where((p) => p.categoryId == categoryId)
          .where((p) => p.createdAt != null && p.createdAt!.isAfter(cutoff))
          .map((p) => p.image)
          .where((image) => image.isNotEmpty)
          .toList(),
      orElse: () => const [],
    );
  }

  void _openStory(CategoryModel category) {
    _markViewed(category.id);

    final images = _imagesFor(category.id);
    if (images.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'لا يوجد إضافات جديدة بفئة "${category.name}" هالأسبوع',
          ),
        ),
      );
      return;
    }

    context.push('/story', extra: images);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final categoriesAsync = ref.watch(categoryProvider);

    return categoriesAsync.when(
      loading: () => const SizedBox(
        height: 78,
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (e, _) {
        return const SizedBox.shrink();
      },
      data: (categories) {
        final productsAsync = ref.watch(productProvider);

        return productsAsync.when(
          loading: () => const SizedBox(
            height: 78,
            child: Center(child: CircularProgressIndicator()),
          ),
          error: (e, _) {
            return const SizedBox.shrink();
          },
          data: (allProducts) {
            final cutoff = DateTime.now().subtract(_recentWindow);
            final recentProducts = allProducts.where(
              (p) => p.createdAt != null && p.createdAt!.isAfter(cutoff),
            );

            final activeCategories = categories.where((category) {
              return recentProducts.any((p) => p.categoryId == category.id);
            }).toList();

            if (activeCategories.isEmpty) return const SizedBox.shrink();

            return SizedBox(
              height: 78,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                itemCount: activeCategories.length,
                separatorBuilder: (_, __) => const SizedBox(width: 14),
                itemBuilder: (context, index) {
                  final category = activeCategories[index];
                  final unviewed = !_viewed.contains(category.id);

                  return GestureDetector(
                    onTap: () => _openStory(category),
                    child: SizedBox(
                      width: 56,
                      child: Column(
                        children: [
                          Container(
                            width: 52,
                            height: 52,
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: unviewed
                                  ? LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        colors.primary,
                                        colors.secondary,
                                      ],
                                    )
                                  : null,
                              border: unviewed
                                  ? null
                                  : Border.all(color: colors.outlineVariant),
                            ),
                            child: ClipOval(
                              child: Container(
                                color: colors.surfaceContainer,
                                child: category.image.isNotEmpty
                                    ? Image.network(
                                        category.image,
                                        fit: BoxFit.cover,
                                        errorBuilder: (_, __, ___) => Icon(
                                          Icons.category_outlined,
                                          size: 20,
                                          color: colors.onSurfaceVariant,
                                        ),
                                      )
                                    : Icon(
                                        Icons.category_outlined,
                                        size: 20,
                                        color: colors.onSurfaceVariant,
                                      ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            category.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: context.text.bodyMedium?.copyWith(
                              fontSize: 10,
                              fontWeight: unviewed
                                  ? FontWeight.w700
                                  : FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
