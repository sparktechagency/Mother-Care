
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mother_care/features/another_screens/parent_booking/presentation/controllers/parent_booking_controller.dart';
import 'package:mother_care/utils/extensions/extension.dart';

import '../../../../../component/text/common_text.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_string.dart';

class BookingTapSection extends StatelessWidget {
  const BookingTapSection({super.key});

  @override
  Widget build(BuildContext context) {
    return   GetBuilder(
      init: ParentBookingController(),
      builder: (controller) {
        return Row(
          children: [
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: (){
                  controller.updateBookingType("Upcoming");
                },
                child: Column(
                  children: [
                    CommonText(
                      fontSize: 16,
                      color: AppColors.titleColor,
                      fontWeight:
                      controller.selectedBookingType == "Upcoming"
                          ? FontWeight.w700
                          : FontWeight.w400,
                      text: AppString.upcoming,
                    ),

                    7.height,

                    controller.selectedBookingType == "Upcoming"?  Container(
                      height: 5.h,
                      width: 102.w,
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(6.r), topLeft: Radius.circular(6.r))
                      ),
                    ):SizedBox()
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: (){
                  controller.updateBookingType("Ongoing");
                },
                child: Column(
                  children: [
                    CommonText(
                      fontSize: 16,
                      color: AppColors.titleColor,
                      fontWeight:
                      controller.selectedBookingType == "Ongoing"
                          ? FontWeight.w700
                          : FontWeight.w400,
                      text: AppString.ongoing,
                    ),

                    7.height,

                    controller.selectedBookingType == "Ongoing"?  Container(
                      height: 5.h,
                      width: 102.w,
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(6.r), topLeft: Radius.circular(6.r))
                      ),
                    ):SizedBox()
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: (){
                  controller.updateBookingType("History");
                },
                child: Column(
                  children: [
                    CommonText(
                      fontSize: 16,
                      color: AppColors.titleColor,
                      fontWeight:
                      controller.selectedBookingType == "History"
                          ? FontWeight.w700
                          : FontWeight.w400,
                      text: AppString.history,
                    ),

                    7.height,

                    controller.selectedBookingType == "History"?  Container(
                      height: 5.h,
                      width: 102.w,
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(6.r), topLeft: Radius.circular(6.r))
                      ),
                    ):SizedBox()
                  ],
                ),
              ),
            ),
          ],
        );
      }
    );
  }
}
