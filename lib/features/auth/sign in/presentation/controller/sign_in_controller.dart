import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../../../config/route/app_routes.dart';
import '../../../../../services/api/api_service.dart';
import '../../../../../config/api/api_end_point.dart';
import '../../../../../services/storage/storage_keys.dart';
import '../../../../../services/storage/storage_services.dart';

class SignInController extends GetxController {
  /// Sign in Button Loading variable
  bool isLoading = false;

  bool isRemember = false;

  /// Sign in form key , help for Validation
  final formKey = GlobalKey<FormState>();

  /// email and password Controller here
  TextEditingController emailController = TextEditingController(
    text: kDebugMode ? 'parent@gmail.com' : '',
  );
  TextEditingController passwordController = TextEditingController(
    text: kDebugMode ? 'user@1234' : "",
  );

  //================isRemember Toggle============

  isRememberToggle() {
    isRemember = !isRemember;
    update();
  }

  /// Sign in Api call here

  Future<void> signInUser() async {
    isLoading = true;
    update();

    Map<String, String> body = {
      "email": emailController.text,
      "password": passwordController.text,
    };

    var response = await ApiService.post(
      ApiEndPoint.signIn,
      body: body,
    ).timeout(const Duration(seconds: 30));

    if (response.statusCode == 200) {
      var data = response.data;

      LocalStorage.token = data['data']["token"];
      if (data['data']["user"]["role"] == "PARENT") {
        LocalStorage.myRoll = "parents";
      } else {
        LocalStorage.myRoll = "nunny";
      }

      LocalStorage.isLogIn = true;
      LocalStorage.setBool(LocalStorageKeys.isLogIn, LocalStorage.isLogIn);

      LocalStorage.setString(LocalStorageKeys.token, LocalStorage.token);
      LocalStorage.setString(LocalStorageKeys.myRoll, LocalStorage.myRoll);
      // LocalStorage.myRoll == "nunny"
      //     ? Get.toNamed(AppRoutes.nunnHomeScreen)
      //     : Get.toNamed(AppRoutes.parentHomeScreen);
      if (LocalStorage.myRoll == 'parents') {
        Get.offAllNamed(AppRoutes.parentHomeScreen);
      } else {
        Get.offAllNamed(AppRoutes.nunnHomeScreen);
      }

      emailController.clear();
      passwordController.clear();
    } else {
      Get.snackbar(response.statusCode.toString(), response.message);
    }

    isLoading = false;
    update();
  }
}
