import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/features/another_screens/parent_booking/presentation/controllers/parent_booking_controller.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import 'package:mother_care/utils/constants/app_string.dart';
import 'package:mother_care/utils/extensions/extension.dart';

import '../../../../../component/bottom_nav_bar/common_bottom_bar.dart';
import '../widgets/booking_tap_Section.dart';
import '../widgets/my_booking_list_section.dart';

class ParentBookingScreen extends StatelessWidget {
  const ParentBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(size: 20.sp, Icons.arrow_back_ios),
        ),
        title: CommonText(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          text: AppString.myBookings,
        ),
      ),

      body: GetBuilder(
        init: ParentBookingController(),
        builder: (controller) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  15.height,
                  BookingTapSection(),
                  20.height,
                  MyBookingListSection()
              
              
                ],
              ),
            ),
          );
        },
      ),

      bottomNavigationBar: const CommonBottomNavBar(currentIndex: 1),
    );
  }
}
