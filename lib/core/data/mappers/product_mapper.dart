import 'package:davai_store/core/model/product_model.dart';
import 'package:flutter/material.dart';

extension ProductMapper on ProductModel {
  Product toUI() {
    return Product(
      title: title,
      image: image,
      price: price,
      colors: const [Colors.black, Colors.blue, Colors.red],
      selectedColor: Colors.black,
    );
  }
}
