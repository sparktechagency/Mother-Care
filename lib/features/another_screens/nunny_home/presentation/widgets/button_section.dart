import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mother_care/component/image/common_image.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/config/route/app_routes.dart';
import 'package:mother_care/features/another_screens/nunny_booking/presentation/controller/nunny_booking_controller.dart';
import 'package:mother_care/features/another_screens/nunny_home/presentation/controller/nunny_home_controller.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import 'package:mother_care/utils/constants/app_images.dart';
import 'package:mother_care/utils/constants/app_string.dart';
import 'package:mother_care/utils/extensions/extension.dart';

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: NunnyHomeController(),
      builder: (controller) {
        return Column(
          children: [
            16.height,
            InkWell(
              onTap: () {
                NunnyBookingController.instance.updateBookingType(type: "newRequest");
                Get.toNamed(AppRoutes.nunnyBookingScreen);
              },
              child: newRequestButton(),
            ),

            20.height,

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    NunnyBookingController.instance.updateBookingType(type: "upComing");
                    Get.toNamed(AppRoutes.nunnyBookingScreen);
                  },

                  child: NunnBUttonItem(
                    title: AppString.upcomingBooking,
                    image: AppImages.upcomming,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.nunnyBookingScreen);
                    NunnyBookingController.instance.updateBookingType(type: "onGoing");
                  },
                  child: NunnBUttonItem(
                    title: AppString.ongoing,
                    image: AppImages.ongoing,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget newRequestButton() {
    return GetBuilder(
      init: NunnyBookingController(),
      builder: (nunnyBookingController) {
        return Container(
          height: 60.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: AppColors.normalGray2),
          ),

          child: Row(
            children: [
              10.width,
              CommonImage(height: 32, width: 32, imageSrc: AppImages.newRequest),
              10.width,

              CommonText(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                text: AppString.newBookingRequest,
              ),
              Spacer(),
              nunnyBookingController.nunnyallBookingList.isNotEmpty
                  ? Container(
                      height: 28.h,
                      width: 28.w,
                      decoration: BoxDecoration(
                        color: AppColors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: CommonText(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                          text: '${nunnyBookingController.nunnyallBookingList.length}',
                        ),
                      ),
                    )
                  : SizedBox(),

              20.width,
            ],
          ),
        );
      },
    );
  }

  Widget NunnBUttonItem({title, image}) {
    return Container(
      width: 160.w,

      padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 18.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.normalGray2),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          CommonImage(height: 32, width: 32, imageSrc: image).start,

          12.height,

          CommonText(fontSize: 14, fontWeight: FontWeight.w600, text: title),
        ],
      ),
    );
  }
}
