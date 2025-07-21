

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mother_care/component/image/common_image.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/config/route/app_routes.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import 'package:mother_care/utils/constants/app_images.dart';
import 'package:mother_care/utils/extensions/extension.dart';

class TodayBookingItem extends StatelessWidget {
  const TodayBookingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
        Get.toNamed(AppRoutes.nunnyDetailsScreen);
      },
      child: Container(

        margin: EdgeInsets.symmetric(vertical: 6),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),

            color: AppColors.white
        ),
        child: Row(
          children: [

            Expanded(
              flex: 1,
              child: CircleAvatar(
                radius: 30,
                child: ClipOval(
                  child: CommonImage(
                      height: 60,
                      width: 60,
                      imageSrc: AppImages.female),
                ),
              ),
            ),

            6.width,

            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonText(
                          right: 4,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          text: "Tandiwe Amina"),
                      CommonText(
                          top: 8,
                          fontSize: 16,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w700,
                          text: "\$50")
                    ],
                  ),

                  6.height,
                  Row(
                    children: [

                      Icon(
                          size: 16.sp,
                          Icons.calendar_month),

                      CommonText(
                          top: 2,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          text: "25 March 25 | 09:30am-3:00pm ")
                    ],
                  ),

                  2.height,

                  Row(
                    children: [

                      Icon(
                          size: 16.sp,
                          color: AppColors.titleColor,
                          Icons.location_on_outlined),

                      CommonText(
                          top: 2,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          text: "123 Ngong Road, Nairobi, Kenya")
                    ],
                  ),





                ],
              ),
            ),


          ],
        ),

      ),
    );
  }
}
