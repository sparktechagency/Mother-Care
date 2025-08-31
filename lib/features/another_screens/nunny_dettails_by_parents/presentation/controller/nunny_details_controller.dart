import 'package:get/get.dart';
import 'package:mother_care/config/api/api_end_point.dart';
import 'package:mother_care/features/another_screens/nunny_dettails_by_parents/presentation/model/nanny_details_model.dart';
import 'package:mother_care/services/api/api_service.dart';
import 'package:mother_care/utils/app_utils.dart';

class NunnyDetailsController extends GetxController {
  int selectedIndex = 0;

  List availability = [
    // {"day": "Monday ", "time": "09:00 AM - 6:00 PM", "availability": true},

    // {"day": "Thursday ", "time": "09:00 AM - 6:00 PM", "availability": true},

    // {"day": "Wednesday ", "time": "09:00 AM - 6:00 PM", "availability": true},

    // {"day": "Tuesday", "time": "09:00 AM - 6:00 PM", "availability": true},

    // {"day": "Thursday ", "time": "09:00 AM - 6:00 PM", "availability": true},

    // {"day": "Friday", "time": "09:00 AM - 6:00 PM", "availability": true},

    // {"day": "Sunday ", "time": "Closed", "availability": false},
  ];

  updateIndex(int index) {
    selectedIndex = index;
    update();
  }

  ///////////////////
  bool isLoading = false;
  String id = "";
  NannyDetailsModel nannyDetailsData = NannyDetailsModel();

  /// Get Nanny Details Data function here
  Future<void> getNannyDetailsData() async {
    try {
      isLoading = true;
      update();

      var response = await ApiService.get(
        "${ApiEndPoint.getNannyDetailsUrl}$id",
      );

      if (response.statusCode == 200) {
        nannyDetailsData = NannyDetailsModel.fromJson(response.data["data"]);
     

      } else {
        Utils.errorSnackBar(response.statusCode, response.message);
      }

      update();
    } catch (e) {
      Utils.errorSnackBar("Error", "error From get nanny details repo Function $e");
    } finally {
      isLoading = false;
      update();
    }
  }




  void initialDataLoadFunction() {
    if (Get.arguments.runtimeType != Null) {
      id = Get.arguments;
      getNannyDetailsData();
    }
  }



  @override
  void onInit() {
    initialDataLoadFunction();
    super.onInit();
  }
}
