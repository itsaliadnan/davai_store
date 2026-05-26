import 'package:flutter/material.dart';

class Product {
  final String title;
  final String image;
  final double price;
  final List<Color> colors;

  const Product({
    required this.title,
    required this.image,
    required this.price,
    this.colors = const [],
  });
}
