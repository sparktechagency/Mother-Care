import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mother_care/features/another_screens/nani_repository/nani_repository.dart';
import 'package:mother_care/features/another_screens/nunny_booking/presentation/data/model/nani_booking_all_model.dart';

import '../../../request_booking/data/model/time_slote_model.dart';

class RescheduleController extends GetxController {
  TextEditingController chooseDateController = TextEditingController();

  List<TimeSlot> timeSlots = <TimeSlot>[
    TimeSlot(time: '9:00 AM', isAvailable: true, isSelected: false),
    TimeSlot(time: '10:00 AM', isAvailable: false, isSelected: false),
    TimeSlot(time: '11:00 AM', isAvailable: true, isSelected: false),
    TimeSlot(time: '12:00 PM', isAvailable: false, isSelected: false),
    TimeSlot(time: '1:00 PM', isAvailable: true, isSelected: false),
    TimeSlot(time: '2:00 PM', isAvailable: false, isSelected: false),
  ];

  void toggleSelection(int index) {
    if (timeSlots[index].isAvailable) {
      timeSlots[index].isSelected = !timeSlots[index].isSelected;
      update();
    }
  }

  /// Notification Loading Bar
  RxBool isLoading = false.obs;

  /// Notification more Data Loading Bar
  bool isLoadingMore = false;

  /// No more notification data
  bool hasNoData = false;

  // late  Booking naniSingleBooking;

  //// Booking Details Page by ID integrating here
  Booking? singleBookingById;

  void getSinglebookingById({required String bookingId}) async {
    try {
      isLoading.value = true;
      singleBookingById = await getSinglebookingByIdRepository(bookingID: bookingId);
      //'68abea605596400613bf3f88', //Full day
      // '68abeb285596400613bf3fae', //CUSTOM
      // '68a01c337203b1ac549769f2', //Hourly
      if (singleBookingById == null) {
        Get.snackbar(
          'Error from RescheduleController',
          'Bacause of fetched data not coming on controller...!!!',
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error from RescheduleController',
        'Bacause of fetched data not coming on controller...!!!',
      );
    } finally {
      isLoading.value = false;
    }
  }

  String bookingId = Get.arguments;

  @override
  void onInit() {
    getSinglebookingById(bookingId: bookingId);
    super.onInit();
  }
}
