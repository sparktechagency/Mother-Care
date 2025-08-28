import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mother_care/config/api/api_end_point.dart';
import 'package:mother_care/features/another_screens/children/presentation/controller/children_screen_controller.dart';
import 'package:mother_care/features/another_screens/children/presentation/model/children_list_model.dart';
import 'package:mother_care/services/api/api_service.dart';
import 'package:mother_care/utils/app_utils.dart';
import 'package:mother_care/utils/helpers/other_helper.dart';

class AddOrEditScreenController extends GetxController {
  GlobalKey<FormState> fromKey = GlobalKey<FormState>();
  TextEditingController childNameController = TextEditingController();
  TextEditingController dateControllerController = TextEditingController();
  bool isLoading = false;
  String genderType = "";
  String? image;
  String? oldImage;

  /// select image function here
  getChildImage() async {
    image = await OtherHelper.openGallery();
    update();
  }

  updateGenderType(String gender) {
    genderType = gender;
    update();
  }

  clearOption() {
    genderType = "";
    update();
  }

  //////////
  String screenName = "";
  ChildrenListModel childrenData = ChildrenListModel();

  Future<void> addChildrenFunction() async {
    try {
      if (image == null) {
        Utils.errorSnackBar("Error", "Please Upload Child Image");
      }
      if (genderType == "") {
        Utils.errorSnackBar("Error", "Please Select Gender");
      }

      if (fromKey.currentState!.validate() && genderType != "" && image != "") {
        isLoading = true;
        update();
        Map<String, String> dataBody = {
          "name": childNameController.text,
          "dateOfBirth": dateControllerController.text,
          "gender": genderType == "boy" ? "MALE" : "FEMALE",
        };
        Map<String, String> body = {"data": json.encode(dataBody)};

        var response = await ApiService.multipart(
          ApiEndPoint.childrenUrl,
          body: body,
          imagePath: image,
          imageName: "childImage",
        ).timeout(const Duration(seconds: 30));

        if (response.statusCode == 200) {
          Utils.successSnackBar("Success", "Children Added Sucessfully");

          // Call The List Controller For Refresh
          var backController = Get.find<ChildrenScreenController>();
          backController.initDataLoadFunction();

          // Go Back
          Navigator.pop(Get.context!);
        }
      }
    } catch (e) {
      Utils.errorSnackBar("Error", "Error From addChildrenFunction $e");
    } finally {
      isLoading = false;
      update();
    }
  }

  void editChildrenFunction() async {
    try {
      // if (image == null) {
      //     Utils.errorSnackBar("Error", "Please Upload Child Image");
      //   }
      //   if (genderType == "") {
      //     Utils.errorSnackBar("Error", "Please Select Gender");
      //   }

      if (fromKey.currentState!.validate() && genderType != "" && image != "") {
        isLoading = true;
        update();
        Map<String, String> dataBody = {
          "name": childNameController.text,
          "dateOfBirth": dateControllerController.text,
          "gender": genderType == "boy" ? "MALE" : "FEMALE",
        };
        Map<String, String> body = {"data": json.encode(dataBody)};

        var response = await ApiService.multipart(
          "${ApiEndPoint.childrenUrl}/${childrenData.id}",
          body: body,
          imagePath: image,
          imageName: "childImage",
          method: "PATCH",
        ).timeout(const Duration(seconds: 30));

        if (response.statusCode == 200) {
          Utils.successSnackBar("Success", "Children Edit Sucessfully");

          // Call The List Controller For Refresh
          var backController = Get.find<ChildrenScreenController>();
          backController.initDataLoadFunction();

          backController.update();


          // Go Back
          Navigator.pop(Get.context!);
        }
      }
    } catch (e) {
      Utils.errorSnackBar("Error", "Error From editChildrenFunction $e");
    } finally {
      isLoading = false;
      update();
    }
  }

  void initDataLoadFunction() {
    try {
      if (Get.arguments != null) {
        if (Get.arguments is ChildrenListModel) {
          childrenData = Get.arguments;
          screenName = "Edit Children";
          oldImage = "${ApiEndPoint.imageUrl}${childrenData.childImage}";
          childNameController.text = childrenData.name ?? "";
          dateControllerController.text = childrenData.dateOfBirth ?? "";
          // Gender Update
          if (childrenData.gender == "MALE") {
            updateGenderType("boy");
          } else {
            updateGenderType("girl");
          }
        } else {
          screenName = Get.arguments;
        }
      }
    } catch (e) {

      Utils.errorSnackBar("Error", "Error From Init Data Load Function $e");
    }
  }

  @override
  void onInit() {
    initDataLoadFunction();
    super.onInit();
  }

  @override
  void dispose() {
    onCloseFunction();
    super.dispose();
  }

  void onCloseFunction() {
    childNameController.dispose();
    dateControllerController.dispose();
    genderType = "";
  }
}
