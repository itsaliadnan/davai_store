import 'package:davai_store/core/model/cart_items_model.dart';
import 'package:davai_store/core/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartController extends StateNotifier<List<CartItem>> {
  CartController() : super([]);

  void addItem(ProductModel product, Color color) {
    state = [...state, CartItem(product: product, selectedColor: color)];
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
