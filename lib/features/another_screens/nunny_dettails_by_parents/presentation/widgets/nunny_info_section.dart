import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mother_care/features/another_screens/nunny_dettails_by_parents/presentation/controller/nunny_details_controller.dart';
import 'package:mother_care/utils/extensions/extension.dart';
import '../../../../../component/image/common_image.dart';
import '../../../../../component/text/common_text.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_images.dart';
import '../../../../../utils/constants/app_string.dart';

class NunnyInfoSection extends StatelessWidget {
  const NunnyInfoSection({super.key, required this.controller});
  final NunnyDetailsController controller;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
          child: Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.grey.shade400,
            ),
            child: CommonImage(
              height: 80,
              width: 80,
              fill: BoxFit.fill,
              imageSrc: controller.nannyDetailsData.profileImage ?? "",
            ),
          ),
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
                  text:controller. nannyDetailsData.name ?? "N/A",
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
                  text: controller. nannyDetailsData.address ?? "N/A",
                ),

                // Container(height: 12.h, width: 1, color: AppColors.bodyClr),
                // CommonText(
                //   fontSize: 12,
                //   right: 7,
                //   left: 7,
                //   fontWeight: FontWeight.w400,
                //   text: nannyDetailsData.address ?? "",
                // ),
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
