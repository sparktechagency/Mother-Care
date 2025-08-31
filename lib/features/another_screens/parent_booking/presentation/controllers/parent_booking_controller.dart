import 'package:get/get.dart';
import 'package:mother_care/config/api/api_end_point.dart';
import 'package:mother_care/features/another_screens/parent_booking/presentation/model/parent_booking_list_model.dart';
import 'package:mother_care/services/api/api_service.dart';
import 'package:mother_care/utils/app_utils.dart';
import 'package:mother_care/utils/log/app_log.dart';

class ParentBookingController extends GetxController {
  String selectedBookingType = "UPCOMING";

  updateBookingType(String type) {
    selectedBookingType = type;

    update();
    // Api Call
    getParentBookingList();
  }

  ///////////////////////////// Ajay
  bool isLoading = false;
  List<ParentBookingListModel> parentBookingList = <ParentBookingListModel>[];

  void getParentBookingList() async {
    isLoading = true;
    update();
    var response = await ApiService.get(
      "${ApiEndPoint.parentBookingUrl}?limit=1&category=$selectedBookingType",
    );

    if (response.statusCode == 200) {


      var data=response.data["data"]["data"];
      parentBookingList.clear();
      for (var element in data) {
        parentBookingList.add(ParentBookingListModel.fromJson(element));
      }
      isLoading=false;
      update();
    }else{
      Utils.successSnackBar(response.statusCode.toString(), response.message);
    }
  }

  void initDataLoadFunction() {
    try {
      getParentBookingList();
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
