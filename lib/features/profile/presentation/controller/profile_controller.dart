import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mother_care/features/profile/presentation/model/profile_data_model.dart';
import 'package:mother_care/services/storage/storage_services.dart';
import '../../../../config/api/api_end_point.dart';
import '../../../../services/api/api_service.dart';
import '../../../../utils/app_utils.dart';
import '../../../../utils/helpers/other_helper.dart';

class ProfileController extends GetxController {
  /// Language List here
  List languages = ["English", "French", "Arabic"];

  /// form key here
  final formKey = GlobalKey<FormState>();

  /// select Language here
  String selectedLanguage = "English";

  /// profile loading here
  RxBool isLoadingProfileLoad = false.obs;

  /// edit button loading here
  bool isLoading = false;

  /// all controller here
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  /// select image function here
  String? image;
  String? oldIage;

  /// select image function here
  getProfileImage() async {
    image = await OtherHelper.openGallery();
    update();
  }

  /// select language  function here
  selectLanguage(int index) {
    selectedLanguage = languages[index];
    update();
    Get.back();
  }

  /// update profile function here
  Future<void> editProfileRepo() async {
    if (formKey.currentState!.validate()) {
      try {
        isLoading = true;
        update();
        Map<String, String> amni = {
          "name": nameController.text,
          "email": emailController.text,
          "phone": numberController.text,
          "address": addressController.text,
        };
        Map<String, String> body = {"data": jsonEncode(amni)};

        var response = await ApiService.multipart(
          ApiEndPoint.editProfileUrl,
          body: body,
          imagePath: image,
          imageName: "profileImage",
          method: "PATCH",
        );

        if (response.statusCode == 200) {
          Get.back();
          getProfileData();
          update();
          Utils.successSnackBar(
            "Successfully Profile Updated",
            response.message,
          );
        } else {
          Utils.errorSnackBar(response.statusCode, response.message);
        }

        update();
      } catch (e) {
        Utils.errorSnackBar(
          "Error",
          "error From edit profile repo Function $e",
        );
      } finally {
        isLoading = false;
        update();
      }
    }
  }

  ProfileDataModel profileData = ProfileDataModel();

  /// Get profile Data function here
  Future<void> getProfileData() async {
    try {
      isLoadingProfileLoad.value = true;

      var response = await ApiService.get(ApiEndPoint.getProfileUrl);

      if (response.statusCode == 200) {
        profileData = ProfileDataModel.fromJson(response.data["data"]);
        oldIage = "${ApiEndPoint.imageUrl}${profileData.profileImage}";
        nameController.text = profileData.name ?? "";
        emailController.text = profileData.email ?? "";
        numberController.text = profileData.phone ?? "";
        addressController.text = profileData.address ?? "";
        // For Global Save
        LocalStorage.myEmail = profileData.email ?? "";
        LocalStorage.setString("myEmail", LocalStorage.myEmail);

        update();

        // Utils.successSnackBar(
        //   "Successfully Profile Updated",
        //   response.message,
        // );
        // Get.back();
        // Get.toNamed(AppRoutes.profile);
      } else {
        Utils.errorSnackBar(response.statusCode, response.message);
      }

      update();
    } catch (e) {
      Utils.errorSnackBar("Error", "error From edit profile repo Function $e");
    } finally {
      isLoadingProfileLoad.value = false;
      // update();
    }
  }

  @override
  void onInit() {
    getProfileData();
    super.onInit();
  }
}
