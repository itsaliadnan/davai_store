import 'package:davai_store/features/auth/presentation/providers/user_provider.dart';
import 'package:davai_store/features/profile/data/model/change_password_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final changePasswordControllerProvider =
    AsyncNotifierProvider<ChangePasswordController, bool>(
      ChangePasswordController.new,
    );

class ChangePasswordController extends AsyncNotifier<bool> {
  @override
  Future<bool> build() async => false;

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

      final userProvider = ref.read(userApiProvider);
      await userProvider.changePassword(request);

      return true;
    });
  }
}
