import 'package:davai_store/core/data/providers/dio_client_provider.dart';
import 'package:davai_store/features/products_category/data/model/category_model.dart';
import 'package:davai_store/features/products_category/data/repo/category_repository.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryRepositoryProvider = Provider(
  (ref) => CategoryRepository(ref.read(dioClientProvider)),
);

final categoryProvider = FutureProvider<List<CategoryModel>>((ref) async {
  final repo = ref.read(categoryRepositoryProvider);
  return repo.getCategories();
});
