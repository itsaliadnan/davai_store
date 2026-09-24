import 'dart:io';
import 'package:davai_store/core/data/providers/dio_client_provider.dart';
import 'package:davai_store/features/auth/data/model/reqister_model.dart';
import 'package:davai_store/features/auth/data/repo/user_repo.dart';
import 'package:davai_store/features/auth/data/model/user_model.dart';
import 'package:davai_store/features/profile/data/model/change_password_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// =========================
// UserRepo Provider
// =========================

final userRepoProvider = Provider<UserRepo>((ref) {
  final dioClient = ref.read(dioClientProvider);

  return UserRepo(
    restDio: dioClient.restDio,
    functionsDio: dioClient.functionsDio,
  );
});

// =========================
// UserProvider
// =========================

final userApiProvider = Provider<UserProvider>((ref) {
  final repo = ref.read(userRepoProvider);

  return UserProvider(repo);
});

class UserProvider {
  final UserRepo repo;

  UserProvider(this.repo);

  // =========================
  // Forgot Password
  // =========================

  Future forgotPassword(String email) async {
    await repo.sendResetEmail(email);
  }

  // =========================
  // Register
  // =========================

  Future registerUser(
    String name,
    String email,
    String password,
    String phone,
  ) async {
    final user = RegisterModel(
      name: name,
      email: email,
      password: password,
      phone: phone,
    );

    await repo.register(user);
  }

  // =========================
  // Login
  // =========================

  Future<Map<String, dynamic>> loginUser(String email, String password) async {
    return await repo.login(email, password);
  }

  // =========================
  // Change Password
  // =========================

  Future changePassword(ChangePasswordRequest request) async {
    await repo.changePassword(
      request.userId,
      request.currentPassword,
      request.newPassword,
    );
  }

  // =========================
  // Verify OTP
  // =========================

  Future verifyResetOtp(String email, String otp) async {
    await repo.verifyOtp(email, otp);
  }

  // =========================
  // Reset Password
  // =========================

  Future resetPassword(String email, String otp, String newPassword) async {
    await repo.resetPassword(email, otp, newPassword);
  }

  // =========================
  // Upload Profile Image
  // =========================

  Future<String> uploadProfileImage(File file, int userId) async {
    return await repo.uploadProfileImage(file: file, userId: userId);
  }

  // =========================
  // Update Profile
  // =========================

  Future updateProfile({
    required int userId,
    required String name,
    String? imageUrl,
  }) async {
    await repo.updateProfile(userId: userId, name: name, imageUrl: imageUrl);
  }

  // =========================
  // Get Current User
  // =========================
  Future<UserModel> getCurrentUser(int userId) async {
    return await repo.getCurrentUser(userId);
  }
}
