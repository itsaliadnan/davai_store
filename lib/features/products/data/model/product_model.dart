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

  final String image;

  final List<String> images;

  final int salesCount;

  final int? categoryId;

  final DateTime? createdAt;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.stock,
    required this.image,
    this.images = const [],
    this.salesCount = 0,
    this.categoryId,
    this.createdAt,
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
      salesCount: (json['sales_count'] as num?)?.toInt() ?? 0,
      categoryId: (json['category_id'] as num?)?.toInt(),
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'].toString())
          : null,
    );
  }
}
