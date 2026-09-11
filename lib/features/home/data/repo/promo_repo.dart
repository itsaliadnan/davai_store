import 'package:davai_store/features/home/data/model/promo_model.dart';
import 'package:dio/dio.dart';

class PromoRepository {
  final Dio dio;

  PromoRepository(this.dio);
  Future<List<PromoModel>> getPromos() async {
    try {
      final response = await dio.get(
        '/promos',
        queryParameters: {'is_active': 'eq.true', 'order': 'priority.desc'},
      );

      print('STATUS CODE: ${response.statusCode}');
      print('TYPE: ${response.data.runtimeType}');
      print('RESPONSE DATA: ${response.data}');

      // 👇 مهم جداً
      if (response.data is! List) {
        throw Exception('Response is not List');
      }

      final List data = response.data;

      return data.map((e) => PromoModel.fromJson(e)).toList();
    } catch (e, stack) {
      print('❌ ERROR IN getPromos: $e');
      print(stack);
      rethrow;
    }
  }
}
