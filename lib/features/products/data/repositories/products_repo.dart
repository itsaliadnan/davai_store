// import 'package:davai_store/features/products/data/model/product_model.dart';
// import 'package:dio/dio.dart';
// import '../../../../core/network/dio_client.dart';

// class ProductRepository {
//   final Dio dio = DioClient().dio;

//   Future<List<ProductModel>> getProducts() async {
//     try {
//       final response = await dio.get('products');

//       final data = response.data as List;

//       return data.map((e) => ProductModel.fromJson(e)).toList();
//     } catch (e) {
//       print(e); // 🔥 اطبع الخطأ الحقيقي
//       throw Exception(e.toString());
//     }
//   }
// }
