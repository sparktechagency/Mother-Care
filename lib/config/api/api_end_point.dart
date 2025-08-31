class ApiEndPoint {
  static const baseUrl = "http://10.10.7.111:5001/api/v1";
  static const imageUrl = "http://10.10.7.111:5001";
  static const socketUrl = "http://10.10.7.111:5001";

  static const signUp = "$baseUrl/users";
  static const verifyEmail = "$baseUrl/auth/verify-email";
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
  static const resendOtp = "$baseUrl/auth/resend-otp";
  static const checkout = "/payments/create-checkout-session";
  static const bookingSlote = "/bookings/slots";



  //=============ajay

  static const editProfileUrl = "/users/profile";
  static const getProfileUrl = "/users/profile";
  static const getBookmarkListUrl = "/bookmarks";
  static const childrenUrl = "/childrens";
  static const supports = "/supports";
  static const termsAndConditionsUrl = "/rules/terms-and-conditions";
  static const privacyPolicyUrl = "/rules/privacy-policy";
  static const aboutUsUrl = "/rules/about";
  static const parentsHomepageGetNannies = "/users/nearby-nannies";
  static const getNannyDetailsUrl = "/users/nanny/";
  static const getBannerUrl = "/banners";
  static const bookmarkUrl = "/bookmarks";
  static const chatUrl = "/chats";
  static const signIn = "/auth/login";
  static const messageUrl = "/messages/";
  static const sendMessageUrl = "/messages/send-message/";
  static const notificationUrl = "/notifications/";
  static const parentBookingUrl = "/bookings/me/parent";

  //===============nasim
  static const naniAllBookings = '/bookings/me/nanny';
  static const naniPefrence = '/nanny-preferences';
  static const naniGalleries = '/nanny-galleries';


}
