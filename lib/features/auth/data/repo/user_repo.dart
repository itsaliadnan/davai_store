import 'dart:convert';
import 'dart:io';

import 'package:davai_store/core/network/api_endpoints.dart';
import 'package:davai_store/features/auth/data/model/reqister_model.dart';
import 'package:davai_store/features/auth/data/model/user_model.dart';
import 'package:dio/dio.dart';

class UserRepo {
  final Dio restDio;
  final Dio functionsDio;

  UserRepo({required this.restDio, required this.functionsDio});

  // =========================
  // Register
  // =========================

  Future register(RegisterModel user) async {
    await functionsDio.post(ApiEndpoints.register, data: user.toJson());
  }

  // =========================
  // Login
  // =========================
  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await functionsDio.post(
      ApiEndpoints.login,
      data: {'email': email, 'password': password},
    );

    final data = response.data is String
        ? jsonDecode(response.data)
        : response.data;

    final session = data['session'];

    if (session == null) {
      throw Exception('Session was not returned');
    }

    final sessionToken = session['token']?.toString();

    final expiresAtString = session['expiresAt']?.toString();

    if (sessionToken == null || sessionToken.isEmpty) {
      throw Exception('Session token was not returned');
    }

    if (expiresAtString == null || expiresAtString.isEmpty) {
      throw Exception('Session expiration was not returned');
    }

    final expiresAt = DateTime.tryParse(expiresAtString);

    if (expiresAt == null) {
      throw Exception('Invalid session expiration');
    }

    return {
      'user': UserModel.fromJson(data['user']),
      'sessionToken': sessionToken,
      'expiresAt': expiresAt,
    };
  }
  // =========================
  // Get Users
  // =========================

  Future<List<UserModel>> getUsers() async {
    final response = await restDio.get('users');

    return (response.data as List).map((e) => UserModel.fromJson(e)).toList();
  }

  // =========================
  // Change Password
  // =========================

  Future changePassword(
    int userId,
    String currentPassword,
    String newPassword,
  ) async {
    final response = await functionsDio.post(
      ApiEndpoints.changePassword,
      data: {
        'userId': userId,
        'currentPassword': currentPassword,
        'newPassword': newPassword,
      },
    );

    final data = response.data is String
        ? jsonDecode(response.data)
        : response.data;

    if (data == null || data['success'] != true) {
      throw Exception(data?['error'] ?? 'Change password failed');
    }
  }

  // =========================
  // Send Reset Email
  // =========================

  Future sendResetEmail(String email) async {
    await functionsDio.post(
      ApiEndpoints.sendResetEmail,
      data: {'email': email},
    );
  }

  // =========================
  // Verify OTP
  // =========================

  Future verifyOtp(String email, String otp) async {
    await functionsDio.post(
      ApiEndpoints.verifyOtp,
      data: {'email': email, 'otp': otp},
    );
  }

  // =========================
  // Reset Password
  // =========================

  Future resetPassword(String email, String otp, String newPassword) async {
    await functionsDio.post(
      ApiEndpoints.resetPassword,
      data: {'email': email, 'otp': otp, 'newPassword': newPassword},
    );
  }

  // =========================
  // Get Current User
  // =========================
  Future<UserModel> getCurrentUser(int userId) async {
    final response = await restDio.get(
      'users',
      queryParameters: {'select': '*', 'id': 'eq.$userId'},
    );

    final data = response.data as List;

    if (data.isEmpty) {
      throw Exception('User not found');
    }

    return UserModel.fromJson(data.first);
  }
  // =========================
  // Upload Profile Image
  // =========================

  Future<String> uploadProfileImage({
    required File file,
    required int userId,
  }) async {
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(file.path, filename: 'avatar.jpg'),
      'user_id': userId.toString(),
    });

    final response = await functionsDio.post(
      ApiEndpoints.updateProfile,
      data: formData,
    );

    final data = response.data is String
        ? jsonDecode(response.data)
        : response.data;

    final imageUrl = data['image'];

    if (imageUrl == null || imageUrl.toString().isEmpty) {
      throw Exception('Image URL was not returned');
    }

    return imageUrl.toString();
  }

  // =========================
  // Update Profile
  // =========================

  Future<UserModel> updateProfile({
    required int userId,
    String? name,
    String? imageUrl,
  }) async {
    final body = <String, dynamic>{};

    if (name?.isNotEmpty == true) {
      body['name'] = name;
    }

    if (imageUrl != null) {
      body['image_url'] = imageUrl;
    }
    final response = await restDio.patch(
      'users?id=eq.$userId&select=*',
      data: body,
    );

    final data = response.data as List;

    if (data.isEmpty) {
      throw Exception('Update failed: no rows updated');
    }

    return UserModel.fromJson(data.first);
  }
}
