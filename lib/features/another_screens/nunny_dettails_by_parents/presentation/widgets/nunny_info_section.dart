import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mother_care/utils/extensions/extension.dart';

import '../../../../../component/image/common_image.dart';
import '../../../../../component/text/common_text.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_images.dart';
import '../../../../../utils/constants/app_string.dart';

class NunnyInfoSection extends StatelessWidget {
  const NunnyInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
          child: CommonImage(height: 80, width: 80, imageSrc: AppImages.female),
        ),

        16.width,

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CommonText(
                  fontSize: 18,
                  right: 5,
                  fontWeight: FontWeight.w700,
                  text: "Tandiwe Amina",
                ),

                CommonImage(imageSrc: AppImages.verifiedBatch),
              ],
            ),
            6.height,

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(size: 16.sp, Icons.location_on_outlined),

                CommonText(
                  fontSize: 12,
                  right: 7,
                  fontWeight: FontWeight.w400,
                  text: "0.31 mi away",
                ),

                Container(height: 12.h, width: 1, color: AppColors.bodyClr),
                CommonText(
                  fontSize: 12,
                  right: 7,
                  left: 7,
                  fontWeight: FontWeight.w400,
                  text: "San Francisco",
                ),
              ],
            ),

            5.height,

            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.r),
                color: AppColors.primaryColor,
              ),
              child: Row(
                children: [
                  CommonText(
                    fontSize: 14,
                    color: AppColors.white,
                    fontWeight: FontWeight.w400,
                    text: AppString.message,
                  ),
                  5.width,
                  Icon(size: 16, color: AppColors.white, Icons.message),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
