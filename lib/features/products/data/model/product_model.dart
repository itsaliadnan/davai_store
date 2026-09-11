// class ProductModel {
//   final int id;
//   final String title;
//   final String description;
//   final double price;
//   final int stock;
//   final String? image;

//   ProductModel({
//     required this.id,
//     required this.title,
//     required this.description,
//     required this.price,
//     required this.stock,
//     this.image,
//   });

//   factory ProductModel.fromJson(Map<String, dynamic> json) {
//     return ProductModel(
//       id: json['id'],
//       title: json['title'],
//       description: json['description'],
//       price: double.parse(json['price'].toString()),
//       stock: json['stock'],
//       image: json['image'],
//     );
//   }
// }
