import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mother_care/config/api/api_end_point.dart';
import 'package:mother_care/services/api/api_service.dart';
import 'package:mother_care/services/storage/storage_services.dart';
import 'package:mother_care/utils/app_utils.dart';

class HelpAndSupportScreenController extends GetxController {
  bool isLoading = false;
  GlobalKey<FormState> fromKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  Future<void> sendReportData() async {
    try {
      if (fromKey.currentState!.validate()) {
        isLoading = true;
        update();

        Map<String, String> body = {
          "name": nameController.text,
          "email": emailController.text,
          "subject": subjectController.text,
          "message": messageController.text,
        };

        var response = await ApiService.post(
          ApiEndPoint.supports,
          body: body,
        ).timeout(const Duration(seconds: 30));

        if (response.statusCode == 200) {
          Utils.successSnackBar("Sucess", response.message);
          // Go Back
          Navigator.pop(Get.context!);
        }
      }
    } catch (e) {
      Utils.errorSnackBar("Error", "Error From Get Bookmark List $e");
    } finally {
      isLoading = false;
      update();
    }
  }

  @override
  void onInit() {
    emailController.text = LocalStorage.myEmail;
    super.onInit();
  }
}
