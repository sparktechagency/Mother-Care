import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mother_care/component/bottom_nav_bar/common_bottom_bar.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/features/another_screens/nunny_booking/presentation/controller/nunny_booking_controller.dart';
import 'package:mother_care/features/another_screens/nunny_booking/presentation/widgets/history_item.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import 'package:mother_care/utils/constants/app_string.dart';

class NunnyBookingScreen extends StatelessWidget {
  const NunnyBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: AppColors.transparent,
        shadowColor: AppColors.transparent,
        backgroundColor: AppColors.white,
        leading: SizedBox.shrink(),
        // leading: InkWell(
        //   onTap: () {
        //     Get.back();
        //   },
        //   child: Icon(Icons.arrow_back_ios, size: 23.sp, color: AppColors.titleColor),
        // ),
        title: GetBuilder(
          init: NunnyBookingController(),
          builder: (controller) {
            return CommonText(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              text: controller.bookingType == "history"
                  ? AppString.bookingHistory
                  : controller.bookingType == "upComing"
                  ? AppString.upcomingBooking
                  : controller.bookingType == "onGoing"
                  ? AppString.onGoingBooking
                  : AppString.newBookingRequest,
            );
          },
        ),
      ),
      body: GetBuilder(
        init: NunnyBookingController(),
        builder: (controller) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: ListView.builder(
              controller: controller.naniAllBookingscrollController,
              itemCount: controller.nunnyallBookingList.length, //5,
              itemBuilder: (context, index) {
                switch (controller.nunnyallBookingList[index].bookingType) {
                  case 'HOURLY':
                    return HistoryItem(
                      status: controller.bookingType,
                      amount: controller.nunnyallBookingList[index].totalPayable
                          .toString(),
                      parentsName: controller.nunnyallBookingList[index].parentId.name,
                      date: controller.nunnyallBookingList[index].hourlyBooking!.date,
                      startTime:
                          controller.nunnyallBookingList[index].hourlyBooking!.startTime,
                      endTime:
                          controller.nunnyallBookingList[index].hourlyBooking!.endTime,
                      location: controller.nunnyallBookingList[index].parentId.address,
                      bookingId: controller.nunnyallBookingList[index].id,
                    );

                  case 'FULL_DAY':
                    return HistoryItem(
                      bookingType: 'FULL_DAY',
                      status: controller.bookingType,
                      amount: controller.nunnyallBookingList[index].totalPayable
                          .toString(),
                      parentsName: controller.nunnyallBookingList[index].parentId.name,
                      date: controller
                          .nunnyallBookingList[index]
                          .fullDayBooking!
                          .fullDays[0],
                      startTime:
                          controller
                              .nunnyallBookingList[index]
                              .fullDayBooking!
                              .startDate ??
                          '',
                      endTime:
                          controller.nunnyallBookingList[index].fullDayBooking!.endDate ??
                          '',
                      location: controller.nunnyallBookingList[index].parentId.address,
                      bookingId: controller.nunnyallBookingList[index].id,
                    );

                  case 'CUSTOM':
                    return HistoryItem(
                      status: controller.nunnyallBookingList[index].bookingStatus,
                      amount: controller.nunnyallBookingList[index].totalPayable
                          .toString(),
                      parentsName: controller.nunnyallBookingList[index].parentId.name,
                      date: controller.nunnyallBookingList[index].customBooking[0].date,
                      startTime: controller
                          .nunnyallBookingList[index]
                          .customBooking[0]
                          .startTime,
                      endTime:
                          controller.nunnyallBookingList[index].customBooking[0].endTime,
                      location: controller.nunnyallBookingList[index].parentId.address,
                      bookingId: controller.nunnyallBookingList[index].id,
                    );
                  default:
                    return null;
                }
              },
            ),
          );
        },
      ),

      bottomNavigationBar: GetBuilder(
        init: NunnyBookingController(),

        builder: (controller) {
          return controller.bookingType == "history"
              ? CommonBottomNavBar(currentIndex: 1)
              : SizedBox();
        },
      ),
    );
  }
}
