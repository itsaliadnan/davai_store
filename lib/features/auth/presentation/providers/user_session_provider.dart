import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/model/user_session.dart';

final userSessionControllerProvider =
    StateNotifierProvider<UserSessionController, UserSession?>(
      (ref) => UserSessionController(),
    );

class UserSessionController extends StateNotifier<UserSession?> {
  UserSessionController() : super(null);

  Future<void> loadSession() async {
    final prefs = await SharedPreferences.getInstance();

    final userId = prefs.getInt('userId');
    final email = prefs.getString('email');
    final sessionToken = prefs.getString('sessionToken');
    final expiresAtString = prefs.getString('sessionExpiresAt');

    if (userId == null ||
        email == null ||
        sessionToken == null ||
        sessionToken.isEmpty ||
        expiresAtString == null) {
      state = null;
      return;
    }

    final expiresAt = DateTime.tryParse(expiresAtString);

    if (expiresAt == null || expiresAt.isBefore(DateTime.now())) {
      await clearSession();
      return;
    }

    state = UserSession(
      userId: userId,
      email: email,
      sessionToken: sessionToken,
      expiresAt: expiresAt,
    );
  }

  Future<void> saveSession(
    int userId,
    String email,
    String sessionToken,
    DateTime expiresAt,
  ) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setInt('userId', userId);
    await prefs.setString('email', email);
    await prefs.setString('sessionToken', sessionToken);
    await prefs.setString('sessionExpiresAt', expiresAt.toIso8601String());

    state = UserSession(
      userId: userId,
      email: email,
      sessionToken: sessionToken,
      expiresAt: expiresAt,
    );
  }

  Future<void> clearSession() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove('userId');
    await prefs.remove('email');
    await prefs.remove('sessionToken');
    await prefs.remove('sessionExpiresAt');

    state = null;
  }

  Future<void> logout() async {
    await clearSession();
  }
}
