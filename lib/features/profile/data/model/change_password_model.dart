class ChangePasswordRequest {
  final int userId;
  final String currentPassword;
  final String newPassword;

  ChangePasswordRequest({
    required this.userId,
    required this.currentPassword,
    required this.newPassword,
  });

  Map<String, dynamic> toJson() {
    return {"current_password": currentPassword, "new_password": newPassword};
  }
}
