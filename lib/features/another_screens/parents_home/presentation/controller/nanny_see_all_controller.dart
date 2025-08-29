import 'dart:developer';
import 'package:get/get.dart';
import 'package:mother_care/config/api/api_end_point.dart';
import 'package:mother_care/features/another_screens/parents_home/presentation/controller/parents_home_controller.dart';
import 'package:mother_care/features/another_screens/parents_home/presentation/model/nanny_model.dart';
import 'package:mother_care/features/another_screens/saved/presentation/controller/saved_screen_controller.dart';
import 'package:mother_care/services/api/api_service.dart';
import 'package:mother_care/utils/app_utils.dart';
import 'package:mother_care/utils/log/app_log.dart';

class NannySeeAllController extends GetxController {
  ////////// Sort Dialog Logics Start
  /// Distance
  RxInt selectedDistanceIndex = 0.obs;
  RxString selectedDistanceText = "Nearest First".obs;
  RxList distanceList = ["Nearest First", "Nearest Last"].obs;

  /// Hourly Rate
  RxInt selectedHourRateIndex = 0.obs;
  RxString selectedHourRateText = "Lowest to Highest".obs;
  RxList hourRateList = ["Lowest to Highest", "Highest to Lowest"].obs;

  /// Experience
  RxInt selectedExperienceSortIndex = 0.obs;
  RxString selectedExperienceSortText = "Least Experienced".obs;
  RxList experienceSortList = ["Least Experienced", "Most Experienced"].obs;
  // Functions
  applyToSort() {
    searchCallWithSortFunction();
    Get.back();
    // Navigator.pop(Get.context!);
  }

  Future<void> searchCallWithSortFunction() async {
    try {
      isLoading = true;
      update();

      var response = await ApiService.get(
        "${ApiEndPoint.parentsHomepageGetNannies}?distanceSort=${selectedDistanceText.value == "Nearest First" ? "nearestFirst" : "nearestLast"}&hourlyRateSort=${selectedHourRateText.value == "Lowest to Highest" ? "asc" : "desc"}&experienceSort=${selectedExperienceSortText.value == "Least Experienced" ? "least" : "most"}",
      ).timeout(const Duration(seconds: 30));
      if (response.statusCode == 200) {
        nannySeeAllList.clear();
        for (var element in response.data["data"]["data"]) {
          nannySeeAllList.add(NannyModel.fromJson(element));
        }
      }
    } catch (e) {
      appLog("Search Call Function $e");
    } finally {
      isLoading = false;
      update();
    }
  }
  ////////// Sort Dialog Logics End

  // For Gender Select
  RxString genderType = "MALE".obs;

  updateGenderType(String gender) {
    genderType.value = gender;
    update();
  }

  clearOption() {
    genderType.value = "";
    update();
  }

  /////////////////////////// Filter Start
  RxDouble minHoursRate = 0.0.obs;
  RxDouble maxHoursRate = 500.0.obs;
  RxDouble selectedRateMax = 500.0.obs;
  RxDouble selectedRateMain = 0.0.obs;
  ////////
  RxInt selectedExperienceIndex = 0.obs;
  RxString selectedExperienceText = "ANY".obs;
  RxList experienceList =
      ["ANY", "1 Year", "2 Year", "3 Year", "3 Year", "4+ Year"].obs;
  RxInt selectedMaxKidManageIndex = 0.obs;
  RxString selectedMaxKidManageText = "ANY".obs;
  RxList maxKidManageList =
      ["ANY", "1", "2", "3", "3", "4", "5", "6", "7", "8", "9", "10+"].obs;
  /////////
  RxInt selectedRateIndex = 4.obs;
  RxString selectedRateText = "5".obs;
  RxList rateList = ["1", "2", "3", "4", "5"].obs;

  ////////////// Functions
  applyToFillter() {
    searchCallWithFilterFunction();
    Get.back();
    // Navigator.pop(Get.context!);
  }

  Future<void> searchCallWithFilterFunction() async {
    try {
      isLoading = true;
      update();

      var response = await ApiService.get(
        "${ApiEndPoint.parentsHomepageGetNannies}?minHourlyRate=${selectedRateMain.value}&maxHourlyRate=${selectedRateMax.value}&experience=${selectedExperienceText.value}&gender=${genderType.value}&kidsManage=${selectedMaxKidManageText.value}&exactRating=${selectedRateText.value}",
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        nannySeeAllList.clear();
        for (var element in response.data["data"]["data"]) {
          nannySeeAllList.add(NannyModel.fromJson(element));
        }
      }
    } catch (e) {
      appLog("Search Call Function $e");
    } finally {
      isLoading = false;
      update();
    }
  }
  /////////////////////////// Filter End

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
          var bookmarkController = Get.put(SavedScreenController());
          var homeController = Get.put(ParentsHomeController());
          bookmarkController.initDataLoadFunction();
          homeController.initDataLoadFunction();
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
          var bookmarkController = Get.put(SavedScreenController());
          var homeController = Get.put(ParentsHomeController());
          bookmarkController.initDataLoadFunction();
          homeController.initDataLoadFunction();
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

  /////////////////////////////
  List<NannyModel> nannySeeAllList = <NannyModel>[];
  bool isLoading = false;

  void getNannyList() async {
    try {
      isLoading = true;
      update();
      var response = await ApiService.get(
        ApiEndPoint.parentsHomepageGetNannies,
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        for (var element in response.data["data"]["data"]) {
          nannySeeAllList.add(NannyModel.fromJson(element));
        }
        appLog(" ✅ ✅ ✅ ✅ ✅ Value Of Response ${nannySeeAllList.length}");
      }
    } catch (e) {
      Utils.errorSnackBar("Error", "Error From Get Nanny List $e");
    } finally {
      isLoading = false;
      update();
    }
  }

  void initDataLoadFunction() {
    try {
      getNannyList();
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
