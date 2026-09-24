class CategoryModel {
  final int id;
  final String name;
  final String description;
  final String image;
  final int productCount;

  CategoryModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.productCount,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      image: json['image'] ?? '',
      productCount: (json['product_count'] as num?)?.toInt() ?? 0,
    );
  }
}
