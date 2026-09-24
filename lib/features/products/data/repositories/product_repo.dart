import 'package:davai_store/core/network/dio_client.dart';
import 'package:davai_store/core/network/api_exception.dart';
import 'package:davai_store/features/products/data/model/product_model.dart';

class ProductRepository {
  final DioClient dioClient;

  ProductRepository(this.dioClient);

  Future<List<ProductModel>> getProducts() async {
    try {
      final productsResponse = await dioClient.rest.get(
        'products?select=*,product_images(*)&order=id.desc',
      );

      if (productsResponse.data is! List) {
        throw ApiException('Invalid data format');
      }

      final productsJson = (productsResponse.data as List)
          .map((e) => Map<String, dynamic>.from(e))
          .toList();

      final salesMap = await _getSalesCountMap();

      for (final json in productsJson) {
        json['sales_count'] = salesMap[json['id']] ?? 0;
      }

      return productsJson.map(ProductModel.fromJson).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<int, int>> _getSalesCountMap() async {
    try {
      final response = await dioClient.rest.get(
        'products_with_sales?select=id,sales_count',
      );

      if (response.data is! List) return {};

      final map = <int, int>{};
      for (final row in (response.data as List)) {
        final id = row['id'] as int?;
        final count = (row['sales_count'] as num?)?.toInt() ?? 0;
        if (id != null) map[id] = count;
      }
      return map;
    } catch (_) {
      return {};
    }
  }

  Future<List<ProductModel>> searchProducts(String query) async {
    try {
      final safeQuery = query.trim();
      if (safeQuery.isEmpty) return [];

      final productsResponse = await dioClient.rest.get(
        'products?select=*,product_images(*)&title=ilike.*$safeQuery*&order=id.desc',
      );

      if (productsResponse.data is! List) {
        throw ApiException('Invalid data format');
      }

      final productsJson = (productsResponse.data as List)
          .map((e) => Map<String, dynamic>.from(e))
          .toList();

      final salesMap = await _getSalesCountMap();

      for (final json in productsJson) {
        json['sales_count'] = salesMap[json['id']] ?? 0;
      }

      return productsJson.map(ProductModel.fromJson).toList();
    } catch (e) {
      rethrow;
    }
  }
}
