class UserSession {
  final int userId;
  final String email;
  final String sessionToken;
  final DateTime expiresAt;

  UserSession({
    required this.userId,
    required this.email,
    required this.sessionToken,
    required this.expiresAt,
  });
}
