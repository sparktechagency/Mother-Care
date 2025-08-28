import 'dart:developer';

import 'package:get/get.dart';
import 'package:mother_care/config/api/api_end_point.dart';
import 'package:mother_care/features/another_screens/nani_repository/nani_repository.dart';
import 'package:mother_care/features/another_screens/nunny_profile_screens/data/preference_model.dart';
import 'package:mother_care/services/api/api_service.dart';
import 'package:mother_care/utils/app_utils.dart';
import 'package:mother_care/utils/helpers/other_helper.dart';

import '../../data/gallery_model.dart';

class GalleryController extends GetxController {
  String? image = "";
  NannyGallery? imagefromAPI;
  RxBool isLoading = false.obs;
  RxBool isLoadingUpload = false.obs;
  List<GalleryImage> imageList = <GalleryImage>[];

  getImage() async {
    image = await OtherHelper.openGallery();
    update();
  }

  void fetchImage() async {
    try {
      isLoading.value = true;
      List<GalleryImage>? imagefromAPI = await fetchImageRepository();
      imageList = imagefromAPI ?? [];
      log("List Of Image ${imageList.length}");
    } catch (e) {
      isLoading.value = false;
      return;
    } finally {
      isLoading.value = false;
      log("kaj Hocche.....");
    }
  }

  Future<void> uploadImageFunction() async {
    try {
      if (image != "") {
        isLoadingUpload.value = true;
        var response = await ApiService.multipart(
          ApiEndPoint.naniGalleries,
          imageName: "images",
          imagePath: image,
        );

        if (response.statusCode == 200) {
          image = "";
          Get.back();
          fetchImage();

          Utils.successSnackBar("Sucess", "Image Upload Sucessfully");
        }
      } else {
        Utils.errorSnackBar("Error", "Please Select Image For Upload");
      }
    } catch (e) {
      log("Error From Upload Image Function $e");
    } finally {
      isLoadingUpload.value = false;
    }
  }

  @override
  void onInit() {
    fetchImage();
    super.onInit();
  }
}
