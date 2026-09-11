import 'package:davai_store/core/data/providers/product_provider.dart';
import 'package:davai_store/core/theme/spacing.dart';
import 'package:davai_store/features/favorite/controller/favorite_controller.dart';
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
      appBar: AppBar(title: const Text('Favorites')),

      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: productsAsync.when(
          data: (products) {
            final favoriteProducts = products
                .where((product) => favoriteIds.contains(product.id))
                .toList();

            if (favoriteProducts.isEmpty) {
              return const Center(child: Text('No favorites yet'));
            }

            return ListView.builder(
              itemCount: favoriteProducts.length,
              itemBuilder: (context, index) {
                final product = favoriteProducts[index];

                return Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.lg),
                  child: ListTile(
                    leading: Image.network(product.image), // ✅ من API
                    title: Text(product.title),
                    subtitle: Text("${product.price}\$"),
                    trailing: IconButton(
                      icon: const Icon(Icons.favorite),
                      onPressed: () {
                        ref
                            .read(favoritesProvider.notifier)
                            .toggleFavorite(product.id); // ✅ id بدل title
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
