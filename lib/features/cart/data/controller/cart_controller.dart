import 'package:davai_store/features/cart/data/model/cart_items_model.dart';
import 'package:davai_store/features/products/data/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartController extends StateNotifier<List<CartItem>> {
  CartController() : super([]);

  void addItem(ProductModel product, Color color) {
    final index = state.indexWhere(
      (item) => item.product.id == product.id && item.selectedColor == color,
    );

    if (index != -1) {
      increaseQuantity(index);
      return;
    }

    state = [...state, CartItem(product: product, selectedColor: color)];
  }

  void increaseQuantity(int index) {
    final item = state[index];

    if (item.quantity >= item.product.stock) {
      return;
    }

    item.quantity++;

    state = [...state];
  }

  void decreaseQuantity(int index) {
    final item = state[index];

    if (item.quantity <= 1) {
      return;
    }

    item.quantity--;

    state = [...state];
  }

  void removeItem(CartItem item) {
    state = state.where((e) => e != item).toList();
  }

  void clearItems() {
    state = [];
  }
}

final cartProvider = StateNotifierProvider<CartController, List<CartItem>>(
  (ref) => CartController(),
);
