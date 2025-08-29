import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mother_care/features/another_screens/nani_repository/nani_repository.dart';
import 'package:mother_care/features/another_screens/nunny_booking/presentation/data/model/nani_booking_all_model.dart';
import 'package:mother_care/services/storage/storage_services.dart';

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
        nunnyallBookingList = await naniGetAllBookingRequestRepository();
      case "upComing":
        nunnyallBookingList = await naniGetAllUpcomingBookingRepository(page);
      case "onGoing":
        nunnyallBookingList = await naniGetAllOngoingBookingRepository(page);
      default:
        nunnyallBookingList = [];
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
