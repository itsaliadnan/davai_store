import 'package:davai_store/core/network/dio_client.dart';
import 'package:davai_store/features/notifications/data/model/notifications_model.dart';
import 'package:dio/dio.dart';

class NotificationRepository {
  final Dio _dio;

  NotificationRepository(DioClient dioClient) : _dio = dioClient.functions;

  Future<List<NotificationModel>> getNotifications({int limit = 50}) async {
    final response = await _dio.get(
      'notifications',
      queryParameters: {'limit': limit},
    );

    final data = response.data;

    if (data is! Map) {
      throw Exception('Invalid notifications response');
    }

    final notificationsData = data['notifications'];

    if (notificationsData is! List) {
      return [];
    }

    return notificationsData
        .map(
          (item) => NotificationModel.fromJson(Map<String, dynamic>.from(item)),
        )
        .toList();
  }

  Future<int> getUnreadCount() async {
    final response = await _dio.get('notifications');

    final data = response.data;

    if (data is! Map) {
      throw Exception('Invalid notifications response');
    }

    return (data['unreadCount'] as num?)?.toInt() ?? 0;
  }

  Future<NotificationModel> markAsRead(int notificationId) async {
    final response = await _dio.patch(
      'notifications',
      data: {'id': notificationId},
    );

    final data = response.data;

    if (data is! Map || data['notification'] is! Map) {
      throw Exception('Invalid notification response');
    }

    return NotificationModel.fromJson(
      Map<String, dynamic>.from(data['notification']),
    );
  }
}
