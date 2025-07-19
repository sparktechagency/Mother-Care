import 'package:get/get.dart';
import 'package:mother_care/features/another_screens/children/presentation/screens/childen_details_screen.dart';
import 'package:mother_care/features/another_screens/nunny_dettails/presentation/screens/nunny_dettails_screen.dart';
import 'package:mother_care/features/another_screens/parents_home/presentation/screens/nunny_see_all_screen.dart';
import 'package:mother_care/features/another_screens/request_booking/presentation/screens/request_booking_screen.dart';
import 'package:mother_care/features/auth/sign%20up/presentation/screen/account_verified_screen.dart';
import 'package:mother_care/features/auth/sign%20up/presentation/screen/add_photo_screen.dart';
import 'package:mother_care/features/auth/sign%20up/presentation/screen/join_mamaCare_screen.dart';
import 'package:mother_care/features/onboarding_screen/screens/onboarding_screen_two.dart';
import 'package:mother_care/features/onboarding_screen/screens/onboarding_three_screen.dart';
import '../../features/another_screens/parent_booking/presentation/screens/parent_booking_screen.dart';
import '../../features/another_screens/parents_home/presentation/screens/parents_home_screen.dart';
import '../../features/another_screens/saved/presentation/screens/saved_screens.dart';
import '../../features/auth/change_password/presentation/screen/change_password_screen.dart';
import '../../features/auth/forgot password/presentation/screen/create_password.dart';
import '../../features/auth/forgot password/presentation/screen/forgot_password.dart';
import '../../features/auth/forgot password/presentation/screen/verify_screen.dart';
import '../../features/auth/sign in/presentation/screen/sign_in_screen.dart';
import '../../features/auth/sign up/presentation/screen/sign_up_screen.dart';
import '../../features/auth/sign up/presentation/screen/verify_user.dart';
import '../../features/message/presentation/screen/chat_screen.dart';
import '../../features/message/presentation/screen/message_screen.dart';
import '../../features/notifications/presentation/screen/notifications_screen.dart';
import '../../features/onboarding_screen/screens/onboarding_screen.dart';
import '../../features/profile/presentation/screen/edit_profile.dart';
import '../../features/profile/presentation/screen/profile_screen.dart';
import '../../features/setting/presentation/screen/privacy_policy_screen.dart';
import '../../features/setting/presentation/screen/setting_screen.dart';
import '../../features/setting/presentation/screen/terms_of_services_screen.dart';
import '../../features/splash/splash_screen.dart';

class AppRoutes {
  static const String test = "/test_screen.dart";
  static const String splash = "/splash_screen.dart";
  static const String onboarding = "/onboarding_screen.dart";
  static const String signUp = "/sign_up_screen.dart";
  static const String verifyUser = "/verify_user.dart";
  static const String signIn = "/sign_in_screen.dart";
  static const String forgotPassword = "/forgot_password.dart";
  static const String verifyEmail = "/verify_screen.dart";
  static const String createPassword = "/create_password.dart";
  static const String changePassword = "/change_password_screen.dart";
  static const String notifications = "/notifications_screen.dart";
  static const String chat = "/chat_screen.dart";
  static const String message = "/message_screen.dart";
  static const String profile = "/profile_screen.dart";
  static const String editProfile = "/edit_profile.dart";
  static const String privacyPolicy = "/privacy_policy_screen.dart";
  static const String termsOfServices = "/terms_of_services_screen.dart";
  static const String setting = "/setting_screen.dart";
  static const String onboardingTwoScreen = "/onboardingTwoScreen.dart";
  static const String onboardingThreeScreen = "/onboardingThreeScreen.dart";
  static const String mamaCareScreen = "/mamaCareScreen.dart";
  static const String accountVerifiedScreen = "/account_verified_screen.dart";
  static const String addPhotoScreen = "/add_photo_screen.dart";
  static const String parentHomeScreen = "/parent_home.dart";
  static const String parentBookingScreen = "/parentBookingScreen.dart";
  static const String savedScreen = "/savedScreen.dart";
  static const String children = "/children.dart";
  static const String nunnySeeAllScreen = "/nunnySeeAllScreen.dart";
  static const String nunnyDetailsScreen = "/nunnyDetailsScreen.dart";
  static const String requestBookingScreen = "/requestBookingScreen.dart";

  static List<GetPage> routes = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: onboarding, page: () => const OnboardingScreen()),
    GetPage(name: signUp, page: () => SignUpScreen()),
    GetPage(name: verifyUser, page: () => const VerifyUser()),
    GetPage(name: signIn, page: () => SignInScreen()),
    GetPage(name: forgotPassword, page: () => ForgotPasswordScreen()),
    GetPage(name: verifyEmail, page: () => const VerifyScreen()),
    GetPage(name: createPassword, page: () => CreatePassword()),
    GetPage(name: changePassword, page: () => ChangePasswordScreen()),
    GetPage(name: notifications, page: () => const NotificationScreen()),
    GetPage(name: chat, page: () => const ChatListScreen()),
    GetPage(name: message, page: () => const MessageScreen()),
    GetPage(name: profile, page: () => const ProfileScreen()),
    GetPage(name: editProfile, page: () => EditProfile()),
    GetPage(name: privacyPolicy, page: () => const PrivacyPolicyScreen()),
    GetPage(name: termsOfServices, page: () => const TermsOfServicesScreen()),
    GetPage(name: setting, page: () => const SettingScreen()),
    GetPage(name: onboardingTwoScreen, page: () => const OnboardingScreenTwo()),
    GetPage(name: onboardingThreeScreen, page: () => const OnboardingScreenThree()),
    GetPage(name: mamaCareScreen, page: () => JoinMamacareScreen()),
    GetPage(name: accountVerifiedScreen, page: () => AccountVerifiedScreen()),
    GetPage(name: addPhotoScreen, page: () => AddPhotoScreen()),
    GetPage(name: parentHomeScreen, page: () => ParentsHomeScreen()),
    GetPage(name: parentBookingScreen, page: () => ParentBookingScreen()),
    GetPage(name: savedScreen, page: () => SavedScreens()),
    GetPage(name: nunnySeeAllScreen, page: () => NunnySeeAllScreen()),
    GetPage(name: nunnyDetailsScreen, page: () => NunnyDetailsScreen()),
    GetPage(name: requestBookingScreen, page: () => RequestBookingScreen()),
    GetPage(name: children, page: () => ChildrenDetailsScreen()),
  ];
}
