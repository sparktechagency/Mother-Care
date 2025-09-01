import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/features/another_screens/nunny_home/presentation/controller/nunny_home_controller.dart';
import 'package:mother_care/features/another_screens/nunny_home/presentation/widgets/today_booking_item.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import 'package:mother_care/utils/constants/app_string.dart';
import 'package:mother_care/utils/extensions/extension.dart';

import '../../../../../config/route/app_routes.dart';
import '../../../nunny_booking/presentation/controller/nunny_booking_controller.dart';

class TodayBookingList extends StatelessWidget {
  final NunnyHomeController nunnyHomeController;
  const TodayBookingList({super.key, required this.nunnyHomeController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        17.height,

        CommonText(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          text: AppString.todaysBooking,
        ).start,
        5.height,

        ListView.builder(
          padding: EdgeInsets.all(0),
          primary: false,
          itemCount: nunnyHomeController.todayBooking?.length ?? 0,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,

          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                NunnyBookingController.instance.updateBookingType(type: "upComing");
                Get.toNamed(
                  AppRoutes.nunnyBookingDetailsScreen,
                  arguments: nunnyHomeController.todayBooking?[index].id ?? '',
                );
              },
              child: TodayBookingItem(booking: nunnyHomeController.todayBooking?[index]),
            );
          },
        ),

        nunnyHomeController.todayBooking == null ||
                nunnyHomeController.todayBooking!.isEmpty
            ? SizedBox(
                height: 100,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.book_outlined, color: AppColors.primaryColor),
                    SizedBox(width: 10),
                    CommonText(text: 'No Booking for today.'),
                  ],
                ),
              )
            : SizedBox.shrink(),
      ],
    );
  }
}
