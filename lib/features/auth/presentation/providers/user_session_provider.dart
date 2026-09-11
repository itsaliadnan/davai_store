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

    if (userId != null && email != null) {
      state = UserSession(userId: userId, email: email);
    } else {
      state = null;
    }
  }

  Future<void> saveSession(int userId, String email) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setInt('userId', userId);
    await prefs.setString('email', email);

    state = UserSession(userId: userId, email: email);
  }

  Future<void> clearSession() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove('userId');
    await prefs.remove('email');

    state = null;
  }

  Future<void> logout() async {
    await clearSession();
  }
}
