import 'package:davai_store/features/products/data/model/product_model.dart';
import 'package:flutter/material.dart';

class CartItem {
  final ProductModel product;
  final Color selectedColor;
  int quantity;

  CartItem({
    required this.product,
    required this.selectedColor,
    this.quantity = 1,
  });
}
