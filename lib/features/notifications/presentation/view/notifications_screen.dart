import 'package:davai_store/features/notifications/data/model/notifications_model.dart';
import 'package:davai_store/features/notifications/data/provider/notification_provider.dart';
import 'package:davai_store/features/notifications/presentation/components/filter_chip.dart';
import 'package:davai_store/features/notifications/presentation/components/notification_card.dart';
import 'package:davai_store/localization/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationsScreen extends ConsumerStatefulWidget {
  const NotificationsScreen({super.key});

  @override
  ConsumerState<NotificationsScreen> createState() =>
      _NotificationsScreenState();
}

class _NotificationsScreenState extends ConsumerState<NotificationsScreen> {
  int selectedFilter = 0;

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref.read(notificationProvider.notifier).loadNotifications();
    });
  }

  List<NotificationModel> _filteredNotifications(NotificationState state) {
    if (selectedFilter == 1) {
      return state.notifications
          .where((notification) => !notification.isRead)
          .toList();
    }

    return state.notifications;
  }

  Future<void> _markAllAsRead(NotificationState state) async {
    final unreadNotifications = state.notifications
        .where((notification) => !notification.isRead)
        .toList();

    if (unreadNotifications.isEmpty) {
      return;
    }

    for (final notification in unreadNotifications) {
      await ref.read(notificationProvider.notifier).markAsRead(notification.id);
    }
  }

  Future<void> _markAsRead(NotificationModel notification) async {
    if (notification.isRead) {
      return;
    }

    await ref.read(notificationProvider.notifier).markAsRead(notification.id);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(notificationProvider);
    final filteredNotifications = _filteredNotifications(state);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.t.home.notifications),
        centerTitle: false,
        actions: [
          if (state.unreadCount > 0)
            TextButton(
              onPressed: state.isLoading ? null : () => _markAllAsRead(state),
              child: const Text('قراءة الكل'),
            ),
          const SizedBox(width: 8),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return ref.read(notificationProvider.notifier).refresh();
        },
        child: Column(
          children: [
            _buildFilters(context, state),
            Expanded(
              child: _buildContent(context, state, filteredNotifications),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    NotificationState state,
    List<NotificationModel> notifications,
  ) {
    if (state.isLoading && state.notifications.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.error != null && state.notifications.isEmpty) {
      return _buildErrorState(context);
    }

    if (notifications.isEmpty) {
      return _buildEmptyState(context);
    }

    return ListView.separated(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      itemCount: notifications.length,
      separatorBuilder: (_, _) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final notification = notifications[index];

        return NotificationCard(
          notification: notification,
          onTap: () => _markAsRead(notification),
        );
      },
    );
  }

  Widget _buildFilters(BuildContext context, NotificationState state) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
      child: Row(
        children: [
          FilterChips(
            label: context.t.home.all,
            selected: selectedFilter == 0,
            onTap: () {
              setState(() {
                selectedFilter = 0;
              });
            },
          ),
          const SizedBox(width: 8),
          FilterChips(
            label: context.t.home.unread,
            count: state.unreadCount,
            selected: selectedFilter == 1,
            onTap: () {
              setState(() {
                selectedFilter = 1;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.65,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 88,
                    height: 88,
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceContainerHighest,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.notifications_none_rounded,
                      size: 42,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    context.t.home.noNotifications,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    context.t.home.yourNewNotificationsWillAppearHere,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildErrorState(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.65,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 88,
                    height: 88,
                    decoration: BoxDecoration(
                      color: colorScheme.errorContainer,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.error_outline_rounded,
                      size: 42,
                      color: colorScheme.onErrorContainer,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    context.t.home.anErrorOccurred,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    context.t.home.unableToLoadNotifications,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 20),
                  FilledButton.icon(
                    onPressed: () {
                      ref
                          .read(notificationProvider.notifier)
                          .loadNotifications();
                    },
                    icon: const Icon(Icons.refresh_rounded),
                    label: Text(context.t.home.retry),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
