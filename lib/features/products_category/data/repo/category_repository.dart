import 'package:davai_store/core/network/dio_client.dart';
import 'package:davai_store/core/network/api_exception.dart';
import 'package:davai_store/features/products_category/data/model/category_model.dart';

class CategoryRepository {
  final DioClient dioClient;

  CategoryRepository(this.dioClient);

  Future<List<CategoryModel>> getCategories() async {
    try {
      final response = await dioClient.rest.get(
        'categories_with_count?select=*&order=product_count.desc',
      );

      if (response.data is! List) {
        throw ApiException('Invalid data format');
      }

      return (response.data as List)
          .map((e) => CategoryModel.fromJson(Map<String, dynamic>.from(e)))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
