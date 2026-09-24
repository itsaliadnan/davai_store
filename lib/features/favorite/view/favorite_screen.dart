import 'package:davai_store/features/products/data/providers/product_provider.dart';
import 'package:davai_store/core/theme/spacing.dart';
import 'package:davai_store/features/favorite/controller/favorite_controller.dart';
import 'package:davai_store/localization/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Favorites Screen
class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteIds = ref.watch(favoritesProvider);

    final productsAsync = ref.watch(productProvider);

    return Scaffold(
      appBar: AppBar(title: Text(context.t.products.favorites)),

      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: productsAsync.when(
          data: (products) {
            final favoriteProducts = products
                .where((product) => favoriteIds.contains(product.id))
                .toList();

            if (favoriteProducts.isEmpty) {
              return Center(child: Text(context.t.products.noFavoritesYet));
            }

            return ListView.builder(
              itemCount: favoriteProducts.length,
              itemBuilder: (context, index) {
                final product = favoriteProducts[index];

                return Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.lg),
                  child: ListTile(
                    leading: Image.network(product.image),
                    title: Text(product.title),
                    subtitle: Text("${product.price}\$"),
                    trailing: IconButton(
                      icon: const Icon(Icons.favorite),
                      onPressed: () {
                        ref
                            .read(favoritesProvider.notifier)
                            .toggleFavorite(product.id);
                      },
                    ),
                  ),
                );
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(child: Text("Error: $e")),
        ),
      ),
    );
  }
}
