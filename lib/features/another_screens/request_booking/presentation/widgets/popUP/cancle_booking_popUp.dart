import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mother_care/component/button/common_button.dart';
import 'package:mother_care/component/image/common_image.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/features/another_screens/booking_details_screen/presentation/controller/reschedule_controller.dart';
import 'package:mother_care/features/another_screens/nunny_booking/presentation/controller/nunny_booking_controller.dart';
import 'package:mother_care/utils/constants/app_string.dart';

Future<void> cancleBopokingPopUp({
  required BuildContext context,
  required RescheduleController singleBookingController,
  required String bookingID,
  required NunnyBookingController nannyBookingController,
}) {
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CommonImage(imageSrc: 'assets/images/cautionIcon.png'),
                SizedBox(
                  width: 246,
                  child: CommonText(
                    text: 'Are you sure you want to cancel this booking?',
                    color: Colors.red,
                    fontSize: 16.h,
                    fontWeight: FontWeight.w700,
                    maxLines: 3,
                  ),
                ),
                CommonText(
                  top: 8,
                  text:
                      'You’re about to cancel your booking for ${singleBookingController.singleBookingById?.parentId.name}. Please confirm and provide a reason for cancellation.',
                  maxLines: 10,
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: CommonButton(
                        buttonColor: Colors.red,
                        buttonRadius: 100,
                        titleText: AppString.yesCancel,
                        onTap: () =>
                            nannyBookingController.declineBooking(bookingID: bookingID),
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Expanded(
                      child: CommonButton(
                        buttonColor: Colors.white,
                        borderColor: Colors.black,
                        titleColor: Colors.black,
                        buttonRadius: 100,
                        titleText: AppString.no,
                        onTap: () => Navigator.pop(context),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
