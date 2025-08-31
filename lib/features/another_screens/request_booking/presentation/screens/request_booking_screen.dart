import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mother_care/component/button/common_button.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/features/another_screens/request_booking/presentation/widgets/payment_success_popup.dart';
import 'package:mother_care/features/another_screens/request_booking/presentation/widgets/summary_section.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import 'package:mother_care/utils/constants/app_string.dart';
import '../controller/request_booking_controller.dart';
import '../widgets/body_section.dart';
import '../widgets/booking_type_heading.dart';

class RequestBookingScreen extends StatelessWidget {
  const RequestBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.transparent,
        shadowColor: AppColors.transparent,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios, size: 20.sp),
        ),
        title: CommonText(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          text: AppString.requestToBook,
        ),
      ),

      body: GetBuilder(
        init: RequestBookingController(),
        builder: (controller) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BookingTypeHeading(),
                  BodySection(),
                  SummarySection()
              
              
                ],
              ),
            ),
          );
        },
      ),
      
      bottomNavigationBar: GetBuilder(
        init: RequestBookingController(),
        builder: (controller) {
          return Container(
            color: AppColors.white,
            padding: EdgeInsets.all(28),
            child: CommonButton(
              isLoading: controller.isPaymentLoading,
                onTap: (){
                  controller.fullDayPayment();
                },
                titleText: AppString.requestToBook),
          );
        }
      ),
    );
  }
}
