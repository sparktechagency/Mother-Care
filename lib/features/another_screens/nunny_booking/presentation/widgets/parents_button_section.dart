import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mother_care/component/button/common_button.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import 'package:mother_care/utils/constants/app_string.dart';
import 'package:mother_care/utils/extensions/extension.dart';

import '../controller/nunny_booking_controller.dart';

class ParentsButtonSection extends StatelessWidget {
  const ParentsButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: NunnyBookingController(),
      builder: (controller) {
        return controller.bookingType == "newRequest"
            ? Column(children: [
          CommonButton(
              buttonRadius: 60,
              borderColor: AppColors.primaryColor,
              titleText: AppString.reschedule),

          17.height,

          CommonButton(
              buttonRadius: 60,
              buttonColor: AppColors.white,

              borderColor: AppColors.red,
              titleColor: AppColors.red,
              titleText: AppString.cancelBooking),
        ])
            : controller.bookingType == "onGoing"
            ? CommonButton(
            buttonRadius: 60,
            titleText: AppString.extendSession)
            : controller.bookingType == "history"
            ? Column(
          children: [
            CommonButton(
              buttonRadius: 60,
                borderColor: AppColors.primaryColor,
                titleText: AppString.giveReview),

            17.height,

            CommonButton(
              buttonRadius: 60,
                buttonColor: AppColors.white,

                borderColor: AppColors.red,
                titleColor: AppColors.red,
                titleText: AppString.submitReport),
          ],
        )
            : SizedBox();
      },
    );
  }
}
