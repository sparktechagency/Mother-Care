import 'package:get/get.dart';
import 'package:mother_care/config/api/api_end_point.dart';
import 'package:mother_care/features/another_screens/parents_home/presentation/controller/parents_home_controller.dart';
import 'package:mother_care/features/another_screens/saved/presentation/model/bookmark_model.dart';
import 'package:mother_care/services/api/api_service.dart';
import 'package:mother_care/utils/app_utils.dart';
import 'package:mother_care/utils/log/app_log.dart';

class SavedScreenController extends GetxController {
     // For Bookmark
 

  // Remove Bookmark Function
   Future<void> removeBookmarkFunction(BookmarkModel item, RxBool isLoadingBookmark ) async {
    try {
   
      isLoadingBookmark.value = true;
    
   

      var response = await ApiService.delete(
        "${ApiEndPoint.bookmarkUrl}/${item.nanny?.id}",

      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        if (response.message == "Bookmark is deleted successfully") {
          bookmarkList.remove(item);
          update();
          // Homepage Update
            var controller = Get.put(ParentsHomeController());
          controller.getNannyList();
          
      
        }
      }

    } catch (e) {
      Utils.errorSnackBar("Error", "Error From Remove Bookmark Function $e");
    } finally {
      isLoadingBookmark.value = false;
    }
  
  }


/////////////////////////////
  bool isLoading = false;
  List<BookmarkModel> bookmarkList = <BookmarkModel>[];

  void getBookmarkList() async {
    try {
      isLoading = true;
      update();
      var response = await ApiService.get(
        ApiEndPoint.getBookmarkListUrl,
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        bookmarkList.clear();
        for (var element in response.data["data"]) {
          bookmarkList.add(BookmarkModel.fromJson(element));
        }
        appLog("✅ ✅ ✅ Value Of Response ${bookmarkList.length}");
      }
    } catch (e) {
      Utils.errorSnackBar("Error", "Error From Get Bookmark List $e");
    } finally {
      isLoading = false;
      update();
    }
  }

  void initDataLoadFunction() {
    try {
      getBookmarkList();
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
