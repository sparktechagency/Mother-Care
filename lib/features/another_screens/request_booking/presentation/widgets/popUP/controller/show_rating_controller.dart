import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mother_care/features/another_screens/booking_details_screen/presentation/controller/reschedule_controller.dart';
import 'package:mother_care/features/another_screens/nani_repository/nani_repository.dart';
import 'package:mother_care/services/storage/storage_services.dart';

class FeedbackController extends GetxController {
  var rating = 3.0.obs;
  final feedbackController = TextEditingController();
  late String ratingToUserID;
  late String bookingID;

  void setRating(double value) {
    rating.value = value;
  }

  void submitFeedback(RescheduleController singleBookingController) {
    if (feedbackController.text.isNotEmpty) {
      final feedback = feedbackController.text;
      LocalStorage.myRoll != 'nunny'
          ? ratingToUserID = singleBookingController.singleBookingById?.parentId.id ?? ''
          : ratingToUserID = singleBookingController.singleBookingById?.nannyId.id ?? '';
      bookingID = singleBookingController.singleBookingById?.id ?? '';

      // TODO: send data to API
      sendFeedBackRepository(
        bookingId: bookingID,
        toUserId: ratingToUserID,
        ratingValue: rating.value.toInt(),
        feedback: feedback,
      );

      Get.back(); // close popup
    } else {
      Get.snackbar('Message', 'Please Leave a review for us');
    }
  }

  void cancleButton() {
    feedbackController.clear();
    rating.value = 3;
    Get.back();
  }

  @override
  void onClose() {
    feedbackController.dispose();
    super.onClose();
  }
}
