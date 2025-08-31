import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mother_care/component/button/common_button.dart';
import 'package:mother_care/component/image/common_image.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/features/another_screens/nunny_home/presentation/controller/nunny_home_controller.dart';
import 'package:mother_care/features/another_screens/nunny_home/presentation/screens/nanny_withdraw_amount_screen.dart';
import 'package:mother_care/features/another_screens/nunny_home/presentation/screens/nanny_withdrawal_history_screen.dart';
import 'package:mother_care/features/another_screens/nunny_home/presentation/widgets/today_booking_list.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import 'package:mother_care/utils/constants/app_images.dart';
import 'package:mother_care/utils/constants/app_string.dart';
import 'package:mother_care/utils/extensions/extension.dart';

import 'button_section.dart';
import 'nunny_slider.dart';

class NunnyHomeBodySection extends StatelessWidget {
  const NunnyHomeBodySection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: NunnyHomeController(),
      builder: (controller) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              10.height,
              Container(
                height: 48.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(12.r),
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CommonText(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                      text: AppString.availableForBookings,
                    ),

                    20.width,

                    SizedBox(
                      height: 30,
                      width: 30,
                      child: Switch(
                        activeTrackColor: AppColors.title2,
                        inactiveTrackColor: AppColors.red,

                        activeColor: AppColors.white,
                        value: controller.isAvailableSwitched,
                        onChanged: (value) {
                          controller.toggleAvailableSwitch(value);
                        },
                      ),
                    ),
                  ],
                ),
              ),

              10.height,
              NunnySlider(),

              10.height,

              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 13.h),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: AppColors.normalGray2),
                ),

                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CommonImage(height: 46.h, width: 46.h, imageSrc: AppImages.coin),
                    SizedBox(width: 5.h),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          fontSize: 12.w,
                          fontWeight: FontWeight.w700,
                          text: AppString.totalBalance,
                        ),
                        CommonText(
                          fontSize: 22.w,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w700,
                          text: "\$ ${controller.totalBalance}",
                        ),

                        7.height,
                      ],
                    ),

                    Spacer(),
                    // 22.width,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CommonButton(
                          onTap: () {
                            Get.to(() => WithdrawAmount());
                          },
                          titleText: 'Withdraw',
                          buttonRadius: 13,
                          buttonHeight: 30.h,
                          buttonWidth: 120.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(NannyWithdrawalHistoryScreen());
                          },
                          child: CommonText(
                            top: 3,
                            fontSize: 14.w,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w600,
                            text: "History",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              ButtonSection(),
              TodayBookingList(nunnyHomeController: controller),
            ],
          ),
        );
      },
    );
  }
}
