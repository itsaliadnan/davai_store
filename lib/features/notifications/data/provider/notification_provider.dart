import 'package:davai_store/core/network/dio_client.dart';
import 'package:davai_store/features/notifications/data/model/notifications_model.dart';
import 'package:davai_store/features/notifications/data/repo/notification_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final notificationRepositoryProvider = Provider<NotificationRepository>((ref) {
  return NotificationRepository(DioClient());
});

final notificationProvider =
    StateNotifierProvider<NotificationController, NotificationState>((ref) {
      return NotificationController(ref.read(notificationRepositoryProvider));
    });

class NotificationState {
  final List<NotificationModel> notifications;
  final int unreadCount;
  final bool isLoading;
  final String? error;

  const NotificationState({
    this.notifications = const [],
    this.unreadCount = 0,
    this.isLoading = false,
    this.error,
  });

  NotificationState copyWith({
    List<NotificationModel>? notifications,
    int? unreadCount,
    bool? isLoading,
    String? error,
  }) {
    return NotificationState(
      notifications: notifications ?? this.notifications,
      unreadCount: unreadCount ?? this.unreadCount,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

class NotificationController extends StateNotifier<NotificationState> {
  final NotificationRepository _repository;

  NotificationController(this._repository) : super(const NotificationState());

  Future<void> loadNotifications() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final notifications = await _repository.getNotifications();

      final unreadCount = notifications
          .where((notification) => !notification.isRead)
          .length;

      state = state.copyWith(
        notifications: notifications,
        unreadCount: unreadCount,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> markAsRead(int notificationId) async {
    try {
      final updatedNotification = await _repository.markAsRead(notificationId);

      final updatedNotifications = state.notifications.map((notification) {
        if (notification.id == updatedNotification.id) {
          return updatedNotification;
        }

        return notification;
      }).toList();

      final unreadCount = updatedNotifications
          .where((notification) => !notification.isRead)
          .length;

      state = state.copyWith(
        notifications: updatedNotifications,
        unreadCount: unreadCount,
      );
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> refresh() async {
    await loadNotifications();
  }
}
