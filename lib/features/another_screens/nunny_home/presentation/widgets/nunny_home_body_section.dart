
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mother_care/component/image/common_image.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/features/another_screens/nunny_home/presentation/controller/nunny_home_controller.dart';
import 'package:mother_care/features/another_screens/nunny_home/presentation/widgets/today_booking_list.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import 'package:mother_care/utils/constants/app_images.dart';
import 'package:mother_care/utils/constants/app_string.dart';
import 'package:mother_care/utils/extensions/extension.dart';

import 'button_section.dart';
import 'nunny_slider.dart';

class NunnyHomeBodySection extends StatelessWidget {
  const NunnyHomeBodySection ({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: NunnyHomeController(),
      builder: (controller) {
        return Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              10.height,
              Container(
                height: 48.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(12.r)
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  CommonText(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                      text: AppString.availableForBookings),

                    20.width,

                    SizedBox(
                      height: 30,
                      width: 30,
                      child: Switch(

                        activeTrackColor: AppColors.title2,
                        inactiveTrackColor: AppColors.red,

                        activeColor: AppColors.white,
                        value: controller.isAvailableSwitched,
                        onChanged: (value){
                          controller.toggleAvailableSwitch(value);

                        },
                      ),
                    ),


                ],),
              ),

              10.height,
              NunnySlider(),

              10.height,

              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: AppColors.normalGray2)
                ),

                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        CommonText(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            text: AppString.thisWeekEarnings),
                        5.height,

                        CommonText(
                            fontSize: 22,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w700,
                            text: "\$380"),

                        7.height,

                        CommonText(
                            fontSize: 12,
                            color: Colors.green,
                            fontWeight: FontWeight.w400,
                            text: "+15% from last week"),
                      ],
                    ),
                    Spacer(),
                    CommonImage(
                        height: 68,
                        width: 68,
                        imageSrc: AppImages.coin),
                    10.width
                  ],
                ),
              ),

              ButtonSection(),
              TodayBookingList()



            ],
          ),
        );
      }
    );
  }
}
