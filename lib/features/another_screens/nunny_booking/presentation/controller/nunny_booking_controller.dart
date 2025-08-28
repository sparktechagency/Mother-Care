import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mother_care/features/another_screens/nani_repository/nani_repository.dart';
import 'package:mother_care/features/another_screens/nunny_booking/presentation/data/model/nani_booking_all_model.dart';

class NunnyBookingController extends GetxController {
  String bookingType = "";
  static NunnyBookingController get instance => Get.put(NunnyBookingController());

  updateBookingType({String type = ""}) {
    bookingType = type;
    getAllBooking();
    update();
  }

  /// Notification Loading Bar
  RxBool isLoading = false.obs;

  /// Notification more Data Loading Bar
  bool isLoadingMore = false;

  /// No more notification data
  bool hasNoData = false;

  ScrollController naniAllBookingscrollController = ScrollController();

  int page = 1;

  List<Booking> nunnyallBookingList = [];

  //// Getting already Fetched Data here
  void getAllBooking() async {
    isLoading.value = true;
    switch (bookingType) {
      case "history":
        nunnyallBookingList = await naniGetAllHistoryBookingRepository(page);
      case "newRequest":
        nunnyallBookingList = [];
      case "upComing":
        nunnyallBookingList = await naniGetAllUpcomingBookingRepository(page);
      case "onGoing":
        nunnyallBookingList = await naniGetAllOngoingBookingRepository(page);
      default:
        nunnyallBookingList = [];
    }
    update();
  }
}
