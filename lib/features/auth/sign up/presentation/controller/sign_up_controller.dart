import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:mother_care/utils/constants/app_string.dart';

import '../../../../../config/route/app_routes.dart';
import '../../../../../services/api/api_service.dart';
import '../../../../../services/storage/storage_keys.dart';
import '../../../../../config/api/api_end_point.dart';
import '../../../../../services/storage/storage_services.dart';
import '../../../../../utils/app_utils.dart';
import '../../../../../utils/helpers/other_helper.dart';

class SignUpController extends GetxController {
  /// Sign Up Form Key
  final signUpFormKey = GlobalKey<FormState>();

  bool isPopUpOpen = false;
  bool isLoading = false;
  bool isLoadingVerify = false;

  Timer? _timer;
  int start = 0;

  String time = "";

  List selectedOption = ["User", "Consultant"];

  String selectRole = "User";
  String countryCode = "+880";
  String? image;

  String signUpToken = '';

  static SignUpController get instance => Get.put(SignUpController());

  TextEditingController nameController = TextEditingController(
    text: kDebugMode ? "Namimul Hassan" : "",
  );
  TextEditingController emailController = TextEditingController(
    text: kDebugMode ? "developernaimul00@gmail.com" : '',
  );
  TextEditingController passwordController = TextEditingController(
    text: kDebugMode ? 'hello123' : '',
  );
  TextEditingController confirmPasswordController = TextEditingController(
    text: kDebugMode ? 'hello123' : '',
  );
  TextEditingController numberController = TextEditingController(
    text: kDebugMode ? '1865965581' : '',
  );
  TextEditingController otpController = TextEditingController(
    text: kDebugMode ? '123456' : '',
  );

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  onCountryChange(Country value) {
    countryCode = value.dialCode.toString();
  }

  setSelectedRole(value) {
    selectRole = value;
    update();
  }

  openGallery() async {
    image = await OtherHelper.openGallery();
    update();
  }

  signUpUser({role}) async {
    isLoading = true;
    String userRole="";

    if(role=="parent"){
      userRole="PARENT";
    }else{
      userRole="NANNY";
    }


    update();
    Map<String, String> body = {
      "name": nameController.text,
      "email": emailController.text,
      "role": userRole,
      "password": passwordController.text,

    };

    var response = await ApiService.post(ApiEndPoint.signUp, body: body);

    if (response.statusCode == 200) {
      Get.toNamed(AppRoutes.verifyUser);
    } else {
      Utils.errorSnackBar(response.statusCode.toString(), response.message);
    }
    isLoading = false;
    update();
  }

  void startTimer() {
    _timer?.cancel();
    start = 180;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (start > 0) {
        start--;
        final minutes = (start ~/ 60).toString().padLeft(2, '0');
        final seconds = (start % 60).toString().padLeft(2, '0');

        time = "$minutes:$seconds";

        update();
      } else {
        _timer?.cancel();
      }
    });
  }

  Future<void> verifyOtpRepo() async {

    isLoadingVerify = true;
    update();
    Map<String, dynamic> body = {
      "oneTimeCode": int.parse(otpController.text),
      "email": emailController.text,

    };

    var response = await ApiService.post(
      ApiEndPoint.verifyOtp,
      body: body,
    );

    if (response.statusCode == 200) {
     Get.toNamed(AppRoutes.accountVerifiedScreen);
    } else {
      Get.snackbar(response.statusCode.toString(), response.message);
    }

    isLoadingVerify = false;
    update();
  }
}
