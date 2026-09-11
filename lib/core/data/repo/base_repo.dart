import 'package:davai_store/core/network/api_exception.dart';

class BaseRepository {
  T handleResponse<T>(dynamic data, T Function(dynamic json) parser) {
    if (data == null) {
      throw ApiException('No data');
    }
    return parser(data);
  }
}
