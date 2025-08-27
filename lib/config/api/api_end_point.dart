class ApiEndPoint {
  static const baseUrl = "http://10.10.7.111:5001/api/v1";
  static const imageUrl = "http://10.10.7.111:5001";
  static const socketUrl = "http://10.10.7.111:5001";

  static const signUp = "$baseUrl/users";
  static const verifyEmail = "$baseUrl/auth/verify-email";
  static const signIn = "users/sign-in";
  static const forgotPassword = "$baseUrl/auth/forget-password";
  static const verifyOtp = "$baseUrl/auth/verify-email";
  static const resetPassword = "$baseUrl/auth/reset-password";
  static const changePassword = "users/change-password";
  static const user = "users";
  static const notifications = "Notifications";
  static const privacyPolicies = "privacy-policies";
  static const termsOfServices = "terms-and-conditions";
  static const chats = "chats";
  static const messages = "messages";
  static const profile = "$baseUrl/users/profile";
}
