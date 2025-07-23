import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/features/another_screens/booking_details_screen/presentation/widgets/children_list_and_instruction_section.dart';
import 'package:mother_care/features/another_screens/request_booking/presentation/widgets/accept_cancel_button_section.dart';
import 'package:mother_care/services/storage/storage_services.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import 'package:mother_care/utils/constants/app_string.dart';
import 'package:mother_care/utils/extensions/extension.dart';

import '../widgets/booking_and_date_time_section.dart';
import '../widgets/parents_button_section.dart';

class NunnyBookingDetailsScreen extends StatelessWidget {
  const NunnyBookingDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.transparent,
        shadowColor: AppColors.transparent,
        title: CommonText(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.titleColor,
            text: AppString.bookingDetailsPage),
        leading: InkWell(
          onTap: (){
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios, color: AppColors.titleColor,
          size: 23.sp,),
        ),

      ),

      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              18.height,
              BookingAndDateTimeSection(),
              20.height,
              ChildrenListAndInstructionSection(),

              20.height,
              LocalStorage.myRoll=="nunny"?
              NunnyButtonSection():ParentsButtonSection (),
              60.height

            ],
          ),
        ),
      ),
    );
  }
}
