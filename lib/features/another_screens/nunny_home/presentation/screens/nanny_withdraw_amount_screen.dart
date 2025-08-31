import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mother_care/component/button/common_button.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/component/text_field/common_text_field.dart';
import 'package:mother_care/features/another_screens/nunny_home/presentation/controller/nanny_withdraw_controller.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import 'package:mother_care/utils/constants/app_string.dart';

class WithdrawAmount extends StatelessWidget {
  const WithdrawAmount({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: NannyWithdrawController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: AppColors.white,
            surfaceTintColor: AppColors.transparent,
            shadowColor: AppColors.transparent,
            title: CommonText(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.titleColor,
              text: AppString.withdrawAmount,
            ),
            leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: const Color.fromRGBO(51, 51, 51, 1),
                size: 23.sp,
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                Column(
                  children: [
                    CommonText(
                      top: 10.h,
                      fontSize: 12.w,
                      color: AppColors.titleColorSecondary,
                      fontWeight: FontWeight.w400,
                      text: AppString.yourCurrentBalance,
                    ),
                    CommonText(
                      top: 10.h,
                      bottom: 58,
                      fontSize: 22.w,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w700,
                      text: '\$ ${controller.totalBalance}',
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      bottom: 15.h,
                      fontSize: 14.w,
                      color: AppColors.withdrawaboutTextColor,
                      fontWeight: FontWeight.w700,
                      text: AppString.withdrawAmount,
                    ),

                    CommonTextField(
                      controller: controller.withDrawController,
                      hintText: ' Enter the amount',
                      borderColor: AppColors.textFiledColor,
                      textColor: Colors.black87,
                    ),
                    SizedBox(height: 15.h),
                    CommonButton(
                      onTap: () {
                        controller.withdrawal();
                      },
                      titleText: AppString.confirmWithdrawal,
                      titleSize: 16.h,
                      titleWeight: FontWeight.w600,
                      buttonRadius: 13,
                      buttonHeight: 48.h,
                      buttonWidth: double.infinity,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
