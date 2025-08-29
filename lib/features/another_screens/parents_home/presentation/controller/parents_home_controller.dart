import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mother_care/config/api/api_end_point.dart';
import 'package:mother_care/features/another_screens/parents_home/presentation/model/banner_model.dart';
import 'package:mother_care/features/another_screens/parents_home/presentation/model/nanny_model.dart';
import 'package:mother_care/features/another_screens/saved/presentation/controller/saved_screen_controller.dart';
import 'package:mother_care/features/profile/presentation/model/profile_data_model.dart';
import 'package:mother_care/services/api/api_service.dart';
import 'package:mother_care/utils/app_utils.dart';

class ParentsHomeController extends GetxController {
  TextEditingController searchController = TextEditingController();

  // For Bookmark
  // Create Bookmark Function
  Future<bool> createBookmarkFunction(
    String id,
    RxBool isLoadingBookmark,
  ) async {
    try {
      log("Id Value $id");
      isLoadingBookmark.value = true;
      Map<String, String> body = {"nannyId": id};
      log("Body Value $body");

      var response = await ApiService.post(
        ApiEndPoint.bookmarkUrl,
        body: body,
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        if (response.message == "Bookmark is created successfully") {
          var controller = Get.put(SavedScreenController());
          controller.initDataLoadFunction();
          return true;
        }
      }
      return false;
    } catch (e) {
      Utils.errorSnackBar("Error", "Error From Create Bookmark Function $e");
    } finally {
      isLoadingBookmark.value = false;
    }
    return false;
  }

  // Remove Bookmark Function
  Future<bool> removeBookmarkFunction(
    String id,
    RxBool isLoadingBookmark,
  ) async {
    try {
      log("Id Value $id");
      isLoadingBookmark.value = true;

      var response = await ApiService.delete(
        "${ApiEndPoint.bookmarkUrl}/$id",
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        if (response.message == "Bookmark is deleted successfully") {
          var controller = Get.put(SavedScreenController());
          controller.initDataLoadFunction();
          return false;
        }
      }
      return true;
    } catch (e) {
      Utils.errorSnackBar("Error", "Error From Remove Bookmark Function $e");
    } finally {
      isLoadingBookmark.value = false;
    }
    return true;
  }

  // For Banner
  RxBool isLoadingBanner = false.obs;
  RxInt selectedListOfBannerIndex = RxInt(1);
  late PageController listOfBannerPageViewController;
  List<BannerModel> listOfBanner = <BannerModel>[];
  onChangeListOfBanner(int index) {
    try {
      selectedListOfBannerIndex.value = index;
      if (listOfBannerPageViewController.hasClients) {
        listOfBannerPageViewController.animateToPage(
          selectedListOfBannerIndex.value,
          duration: const Duration(seconds: 1),
          curve: Curves.ease,
        );
      }
    } catch (e) {
      log("Error in onChangeListOfBanner: $e");
    }
  }

  void getBannerList() async {
    try {
      isLoadingBanner.value = true;

      var response = await ApiService.get(
        ApiEndPoint.getBannerUrl,
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        for (var element in response.data["data"]) {
          listOfBanner.add(BannerModel.fromJson(element));
        }
      }
    } catch (e) {
      Utils.errorSnackBar("Error", "Error From Get Nanny List $e");
    } finally {
      isLoadingBanner.value = false;
    }
  }

  /////////// Banner End

  List<NannyModel> nannyList = <NannyModel>[];
  bool isLoading = false;

  void getNannyList({String? searchData}) async {
    try {
      isLoading = true;
      update();
      var response;
      if (searchData != null) {
        response = await ApiService.get(
          "${ApiEndPoint.parentsHomepageGetNannies}?searchTerm=${searchData.trim()}",
        ).timeout(const Duration(seconds: 30));
      } else {
        response = await ApiService.get(
          ApiEndPoint.parentsHomepageGetNannies,
        ).timeout(const Duration(seconds: 30));
      }
      if (response.statusCode == 200) {
        nannyList.clear();
        for (var element in response.data["data"]["data"]) {
          nannyList.add(NannyModel.fromJson(element));
        }
      }
    } catch (e) {
      Utils.errorSnackBar("Error", "Error From Get Nanny List $e");
    } finally {
      isLoading = false;
      update();
    }
  }

  // Profile Get Function
  ProfileDataModel profileData = ProfileDataModel();
  RxBool isLoadingProfile = false.obs;

  /// Get profile Data function here
  Future<void> getProfileData() async {
    try {
      isLoadingProfile.value = true;

      var response = await ApiService.get(ApiEndPoint.getProfileUrl);

      if (response.statusCode == 200) {
        profileData = ProfileDataModel.fromJson(response.data["data"]);
        // oldIage = "${ApiEndPoint.imageUrl}${profileData.profileImage}";
        // nameController.text = profileData.name ?? "";
        // emailController.text = profileData.email ?? "";
        // numberController.text = profileData.phone ?? "";
        // addressController.text = profileData.location!.type ?? "";
        // // For Global Save
        // LocalStorage.myEmail = profileData.email ?? "";
        // LocalStorage.setString("myEmail", LocalStorage.myEmail);

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
      isLoadingProfile.value = false;
      // update();
    }
  }

  void initDataLoadFunction() {
    try {
      getProfileData();
      getNannyList();
      getBannerList();
      // initial Bannar Pagecontroller
      listOfBannerPageViewController = PageController(
        initialPage: selectedListOfBannerIndex.value,
        viewportFraction: 0.9,
      );
    } catch (e) {
      Utils.errorSnackBar("Error", "Error From Init Data Load Function $e");
    }
  }

  @override
  void onInit() {
    initDataLoadFunction();
    super.onInit();
  }
}
