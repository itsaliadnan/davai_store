class ApiEndpoints {
  static const baseUrl = 'https://fkojngejmyyujpvcvhsr.supabase.co';

  // REST
  static const rest = '$baseUrl/rest/v1';

  // Edge Functions
  static const functions = '$baseUrl/functions/v1';

  // Auth
  static const register = '$functions/register';
  static const login = '$functions/login';
  static const changePassword = '$functions/change-password';

  static const sendResetEmail = '$functions/send-reset-email';

  static const verifyOtp = '$functions/verify-otp';

  static const resetPassword = '$functions/reset-password';

  // Profile
  static const updateProfile = '$functions/update-profile';
}
