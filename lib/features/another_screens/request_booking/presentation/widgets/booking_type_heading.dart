import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mother_care/utils/extensions/extension.dart';
import '../../../../../component/text/common_text.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_string.dart';
import '../controller/request_booking_controller.dart';
import 'custom_type.dart';
import 'full_day_body.dart';
import 'hourly_body.dart';

class BookingTypeHeading extends StatelessWidget {
  const BookingTypeHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestBookingController>(
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonText(
              top: 16,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              text: AppString.bookingType,
            ),
            20.height,

            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      controller.updateBookingType("hourly");
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 9.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                          color: controller.selectedBookingType == "hourly"
                              ? AppColors.primaryColor
                              : AppColors.normalGray2,
                        ),
                      ),

                      child: Column(
                        children: [
                          Icon(size: 16.sp, Icons.watch_later_outlined),

                          6.height,

                          CommonText(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            text: AppString.hourly,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                20.width,

                Expanded(
                  child: InkWell(
                    onTap: () {
                      controller.updateBookingType("fullDay");
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 9.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                          color: controller.selectedBookingType == "fullDay"
                              ? AppColors.primaryColor
                              : AppColors.normalGray2,
                        ),
                      ),

                      child: Column(
                        children: [
                          Icon(size: 16.sp, Icons.calendar_month),

                          6.height,

                          CommonText(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            text: AppString.fullDay,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            20.height,

            InkWell(
              onTap: () {
                controller.updateBookingType("custom");
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 12.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                    color: controller.selectedBookingType == "custom"
                        ? AppColors.primaryColor
                        : AppColors.normalGray2,
                  ),
                ),

                child: Column(
                  children: [
                    Icon(size: 16.sp, Icons.calendar_month),

                    6.height,

                    CommonText(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      text: AppString.custom,
                    ),
                  ],
                ),
              ),
            ),

            20.height,

            controller.selectedBookingType == "hourly"
                ? HourlyBody()
                : controller.selectedBookingType == 'fullDay'
                ? FullDayBody()
                : CustomType(),
          ],
        );
      },
    );
  }
}
