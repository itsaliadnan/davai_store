import 'package:davai_store/core/network/dio_client.dart';
import 'package:davai_store/core/network/api_exception.dart';
import 'package:davai_store/core/model/product_model.dart';

class ProductRepository {
  final DioClient dioClient;

  ProductRepository(this.dioClient);

  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await dioClient.rest.get(
        'products?select=*,product_images(*)&order=id.desc',
      );

      if (response.data is List) {
        return (response.data as List)
            .map((e) => ProductModel.fromJson(Map<String, dynamic>.from(e)))
            .toList();
      } else {
        throw ApiException('Invalid data format');
      }
    } catch (e) {
      rethrow;
    }
  }
}
