import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mother_care/features/another_screens/nani_repository/nani_repository.dart';
import 'package:mother_care/features/another_screens/nunny_booking/presentation/data/model/nani_booking_all_model.dart';
import 'package:mother_care/services/storage/storage_services.dart';

class NunnyBookingController extends GetxController {
  String bookingType = "";
  int page = 1;
  static NunnyBookingController get instance => Get.put(NunnyBookingController());

  updateBookingType({String type = ""}) async {
    if (naniAllBookingscrollController.hasClients) {
      naniAllBookingscrollController.jumpTo(0.0);
    }
    page = 1;
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

  RxBool isLastPage = false.obs;

  ScrollController naniAllBookingscrollController = ScrollController();

  List<Booking> nunnyallBookingList = [];
  List<Booking> nunnyallBookingRequestList = [];

  //// Getting already Fetched Data here
  void getAllBooking() async {
    isLoading.value = true;
    switch (bookingType) {
      case "history":
        nunnyallBookingList = await naniGetAllHistoryBookingRepository(1);
        break;
      case "newRequest":
        nunnyallBookingRequestList = nunnyallBookingList =
            await naniGetAllBookingRequestRepository();
        break;

      case "upComing":
        nunnyallBookingList = await naniGetAllUpcomingBookingRepository(1);
        break;

      case "onGoing":
        nunnyallBookingList = await naniGetAllOngoingBookingRepository(1);
        break;

      default:
        nunnyallBookingList = [];
        break;
    }
    update();
  }

  void scrollListener() {
    try {
      if (naniAllBookingscrollController.position.pixels ==
          naniAllBookingscrollController.position.maxScrollExtent) {
        if (!isLastPage.value) {
          page++;
          loadMore();
          print(
            '${naniAllBookingscrollController.position.pixels} ************************************************',
          );
        }
      }
    } catch (e) {
      Get.snackbar('Crash', 'App Crashed');
      do {
        naniAllBookingscrollController.jumpTo(0.0);
      } while (false);
    }
  }

  void loadMore() async {
    isLoading.value = true;
    switch (bookingType) {
      case "history":
        List<Booking> temp = await naniGetAllHistoryBookingRepository(page);
        if (temp.isEmpty) isLastPage.value = true;
        nunnyallBookingList.addAll(temp);
        temp = [];
        break;

      case "newRequest":
        nunnyallBookingList = await naniGetAllBookingRequestRepository();
        break;

      case "upComing":
        List<Booking> temp = await naniGetAllUpcomingBookingRepository(page);
        if (temp.isEmpty) isLastPage.value = true;
        nunnyallBookingList.addAll(temp);
        break;

      case "onGoing":
        List<Booking> temp = await naniGetAllOngoingBookingRepository(page);
        if (temp.isEmpty) isLastPage.value = true;
        nunnyallBookingList.addAll(temp);
        break;

      default:
        nunnyallBookingList = [];
        break;
    }
    update();
  }

  void declineBooking({required String bookingID}) {
    try {
      if (LocalStorage.myRoll == 'parents') {
        handleBookingActionrepository(
          bookingID: bookingID,
          bookingStatus: BookingStatusActionSelection.cancelledByParent.value,
        );
        update();
      } else {
        handleBookingActionrepository(
          bookingID: bookingID,
          bookingStatus: BookingStatusActionSelection.cancelledByNanny.value,
        );
        update();
      }
    } catch (e) {
      Get.snackbar('Error', 'Error From Nanny Booking Controller');
    }
  }

  void acceptBooking({required String bookingID}) {
    try {
      if (LocalStorage.myRoll == 'nunny') {
        handleBookingActionrepository(
          bookingID: bookingID,
          bookingStatus: BookingStatusActionSelection.confirmed.value,
        );
        update();
      } else {
        Get.snackbar('Error', 'Accept not working');
      }
    } catch (e) {
      Get.snackbar('Error', 'Error From Nanny Booking Controller');
    }
  }

  void session({required String bookingID, required StartEndSession session}) {
    try {
      if (LocalStorage.myRoll == 'nunny') {
        bookingSessioneRpository(
          bookingID: bookingID,
          // TODO: need to change bookingStatus
          bookingStatus: BookingStatusActionSelection.confirmed.value,
          session: session == StartEndSession.startSession
              ? StartEndSession.startSession.value
              : StartEndSession.endSession.value,
        );
        update();
      } else {
        Get.snackbar('Error', 'Accept not working');
      }
    } catch (e) {
      Get.snackbar('Error', 'Error From Nanny Booking Controller');
    }
  }

  @override
  void onInit() async {
    naniAllBookingscrollController.addListener(scrollListener);
    // just getting list of new booking request
    nunnyallBookingRequestList = await naniGetAllBookingRequestRepository();
    super.onInit();
  }

  // @override
  // void onClose() {
  //   // This is called when the controller is permanently removed
  //   if (naniAllBookingscrollController.hasClients) {
  //     naniAllBookingscrollController.removeListener(scrollListener);
  //     naniAllBookingscrollController.dispose();
  //   }
  //   super.onClose();
  // }

  @override
  void dispose() {
    page = 1;
    nunnyallBookingList = [];
    naniAllBookingscrollController.dispose();
    super.dispose();
  }
}

/// BACKEND WILL KICK YOU HARD IF YOU REMOVE THIS ENUM
/// Wellcome for modifition :)
enum BookingStatusActionSelection {
  confirmed('CONFIRMED'),
  cancelledByParent('CANCELLED_BY_PARENT'),
  cancelledByNanny('CANCELLED_BY_NANNY');

  final String value;
  const BookingStatusActionSelection(this.value);
}

enum StartEndSession {
  startSession('start-session'),
  endSession('end-session');

  final String value;
  const StartEndSession(this.value);
}
