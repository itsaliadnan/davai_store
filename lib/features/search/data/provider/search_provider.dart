// features/search/presentation/providers/search_provider.dart

import 'package:davai_store/features/products/data/model/product_model.dart';
import 'package:davai_store/features/products/data/providers/product_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

final sortByProvider = StateProvider<String>((ref) => 'newest');

final searchResultsProvider = FutureProvider<List<ProductModel>>((ref) async {
  final query = ref.watch(searchQueryProvider);
  final sortBy = ref.watch(sortByProvider);

  if (query.trim().isEmpty) return [];

  final repo = ref.read(productRepositoryProvider);
  final results = await repo.searchProducts(query);

  return _sortProducts(results, sortBy);
});

List<ProductModel> _sortProducts(List<ProductModel> products, String sortBy) {
  final sorted = [...products];

  switch (sortBy) {
    case 'price_low':
      sorted.sort((a, b) => a.price.compareTo(b.price));
      break;
    case 'price_high':
      sorted.sort((a, b) => b.price.compareTo(a.price));
      break;
    case 'popular':
      sorted.sort((a, b) => b.salesCount.compareTo(a.salesCount));
      break;
    case 'newest':
    default:
      sorted.sort((a, b) {
        final aDate = a.createdAt;
        final bDate = b.createdAt;
        if (aDate == null || bDate == null) return b.id.compareTo(a.id);
        return bDate.compareTo(aDate);
      });
      break;
  }

  return sorted;
}
