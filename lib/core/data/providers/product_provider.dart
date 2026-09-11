import 'package:davai_store/core/data/providers/dio_client_provider.dart';
import 'package:davai_store/core/data/repo/product_repo.dart';
import 'package:davai_store/core/model/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productRepositoryProvider = Provider(
  (ref) => ProductRepository(ref.read(dioClientProvider)),
);

final productProvider = FutureProvider<List<ProductModel>>((ref) async {
  final repo = ref.read(productRepositoryProvider);
  return repo.getProducts();
});
