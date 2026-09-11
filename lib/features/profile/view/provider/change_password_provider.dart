import 'package:davai_store/features/auth/presentation/providers/user_provider.dart';
import 'package:davai_store/features/profile/data/model/change_password_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final changePasswordControllerProvider =
    AsyncNotifierProvider<ChangePasswordController, void>(
      ChangePasswordController.new,
    );

class ChangePasswordController extends AsyncNotifier<void> {
  late final UserProvider userProvider;

  @override
  Future<void> build() async {
    userProvider = ref.read(userApiProvider);
  }

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final prefs = await SharedPreferences.getInstance();

      final userId = prefs.getInt('userId');

      if (userId == null) {
        throw Exception('User not found');
      }

      final request = ChangePasswordRequest(
        userId: userId,
        currentPassword: currentPassword,
        newPassword: newPassword,
      );

      await userProvider.changePassword(request);
    });
  }
}
