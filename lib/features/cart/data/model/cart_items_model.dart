import 'package:davai_store/features/products/data/model/product_model.dart';
import 'package:flutter/material.dart';

@immutable
class CartItem {
  final ProductModel product;
  final Color selectedColor;
  final int quantity;

  const CartItem({
    required this.product,
    required this.selectedColor,
    this.quantity = 1,
  });

  CartItem copyWith({
    ProductModel? product,
    Color? selectedColor,
    int? quantity,
  }) {
    return CartItem(
      product: product ?? this.product,
      selectedColor: selectedColor ?? this.selectedColor,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CartItem &&
        other.product.id == product.id &&
        other.selectedColor == selectedColor;
  }

  @override
  int get hashCode => Object.hash(product.id, selectedColor);
}
