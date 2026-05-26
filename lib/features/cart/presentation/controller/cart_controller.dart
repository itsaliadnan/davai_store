import 'package:davai_store/core/model/product_model.dart';
import 'package:riverpod/legacy.dart';

class CartController extends StateNotifier<List<Product>> {
  CartController() : super([]);

  void addItem(Product product) {
    state = [...state, product];
  }

  void removeItem(Product product) {
    state = state.where((p) => p != product).toList();
  }

  void clearItems() {
    state = [];
  }
}

final cartProvider = StateNotifierProvider<CartController, List<Product>>((
  ref,
) {
  return CartController();
});
