import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mother_care/component/button/common_button.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/features/another_screens/booking_details_screen/presentation/controller/reschedule_controller.dart';
import 'package:mother_care/features/another_screens/nunny_booking/presentation/controller/nunny_booking_controller.dart';
import 'package:mother_care/features/another_screens/request_booking/presentation/widgets/popUP/cancle_booking_popUp.dart';
import 'package:mother_care/features/another_screens/request_booking/presentation/widgets/popUP/give_feedback_pop_up.dart';
import 'package:mother_care/features/another_screens/request_booking/presentation/widgets/popUP/report_popUP.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import 'package:mother_care/utils/constants/app_string.dart';
import 'package:mother_care/utils/extensions/extension.dart';

class NunnyButtonSection extends StatelessWidget {
  final RescheduleController singleBookingController;
  final String bookingID;
  const NunnyButtonSection({
    super.key,
    required this.singleBookingController,
    required this.bookingID,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: NunnyBookingController(),
      builder: (controller) {
        return controller.bookingType == "newRequest"
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => controller.acceptBooking(bookingID: bookingID),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 50.w),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(60.r),
                      ),

                      child: CommonText(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                        text: AppString.accept,
                      ),
                    ),
                  ),

                  InkWell(
                    onTap: () => controller.declineBooking(bookingID: bookingID),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 50.w),
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        border: Border.all(color: AppColors.red),
                        borderRadius: BorderRadius.circular(60.r),
                      ),

                      child: CommonText(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.red,
                        text: AppString.decline,
                      ),
                    ),
                  ),
                ],
              )
            : controller.bookingType == "upComing"
            ? CommonButton(
                onTap: () => cancleBopokingPopUp(
                  context: context,
                  singleBookingController: singleBookingController,
                  bookingID: bookingID,
                  nannyBookingController: controller,
                ), //controller.declineBooking(bookingID: bookingID),
                buttonRadius: 60,
                borderColor: AppColors.red,
                buttonColor: AppColors.background,
                titleColor: AppColors.red,
                titleText: AppString.cancelBooking,
              )
            : controller.bookingType == "onGoing"
            ? CommonButton(
                onTap: () => controller.session(
                  bookingID: bookingID,
                  session: StartEndSession.startSession,
                ),
                buttonRadius: 60,
                buttonColor: Colors.green,
                borderColor: Colors.green,
                titleText: AppString.startSession,
              )
            : controller.bookingType == "history"
            ? Column(
                children: [
                  CommonButton(
                    onTap: () => giveFeedbackPopUp(
                      context: context,
                      singleBookingController: singleBookingController,
                    ),
                    buttonRadius: 60,
                    titleColor: AppColors.white,
                    buttonColor: Colors.green,
                    borderColor: Colors.green,
                    titleText: AppString.giveFeedback,
                  ),
                  18.height,

                  CommonButton(
                    onTap: () => showReportPopup(context),
                    titleColor: AppColors.white,
                    buttonColor: Colors.red,
                    borderColor: Colors.red,
                    buttonRadius: 60,
                    titleText: AppString.reportUser,
                  ),
                ],
              )
            : SizedBox();
      },
    );
  }
}
