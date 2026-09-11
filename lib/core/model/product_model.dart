import 'package:flutter/material.dart';

class Product {
  final String title;
  final String image;
  final double price;
  final List<Color> colors;
  final Color selectedColor;

  Product({
    required this.title,
    required this.image,
    required this.price,
    required this.colors,
    required this.selectedColor,
  });
}

class ProductModel {
  final int id;
  final String title;
  final String description;
  final double price;
  final int stock;

  // الصورة الرئيسية
  final String image;

  // الصور الإضافية
  final List<String> images;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.stock,
    required this.image,
    this.images = const [],
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    final imagesJson = json['product_images'];

    final images = imagesJson is List
        ? imagesJson
              .whereType<Map>()
              .map((item) => item['image_url']?.toString() ?? '')
              .where((url) => url.isNotEmpty)
              .toList()
        : <String>[];

    return ProductModel(
      id: json['id'],
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] as num).toDouble(),
      stock: json['stock'] ?? 0,
      image: json['image'] ?? '',
      images: images,
    );
  }
}
