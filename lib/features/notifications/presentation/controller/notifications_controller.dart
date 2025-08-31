import 'package:get/get.dart';
import 'package:mother_care/config/api/api_end_point.dart';
import 'package:mother_care/services/api/api_service.dart';
import 'package:mother_care/services/storage/storage_services.dart';
import 'package:mother_care/utils/app_utils.dart';
import 'package:mother_care/utils/log/app_log.dart';
import '../../data/model/notification_model.dart';

class NotificationsController extends GetxController {
/////////////////////////////
  String getRole = "";
  void getUserRole(){
    if (LocalStorage.myRoll == "parents" ) {
      getRole = "parent";
      
    }else{
      getRole = "nanny";
    }
  }
  bool isLoading = false;
  List<NotificationModel> notificationList = <NotificationModel>[];

  void getNotificationList() async {
    try {
      isLoading = true;
      update();
      var response = await ApiService.get(
        "${ApiEndPoint.notificationUrl}$getRole",
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        notificationList.clear();
        for (var element in response.data["data"]) {
          notificationList.add(NotificationModel.fromJson(element));
        }
        appLog("✅ ✅ ✅ Value Of Response ${notificationList.length}");
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
      getUserRole();
      getNotificationList();
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

