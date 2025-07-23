import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mother_care/component/button/common_button.dart';
import 'package:mother_care/component/image/common_image.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import 'package:mother_care/utils/constants/app_images.dart';
import 'package:mother_care/utils/constants/app_string.dart';
import 'package:mother_care/utils/extensions/extension.dart';

class CancelBookingPopUp {
  static cancelBookingPoUp() {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.white,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CommonImage(height: 76, width: 88, imageSrc: AppImages.alert),

              10.height,

              CommonText(
                fontSize: 16,
                maxLines: 2,
                fontWeight: FontWeight.w600,
                color: AppColors.red,
                text: AppString.cancelTitle,
              ),
              8.height,

              CommonText(
                fontSize: 12,
                maxLines: 2,
                fontWeight: FontWeight.w400,
                color: AppColors.bodyClr,
                text: AppString.cancelDes,
              ),

              24.height,

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: CommonButton(
                    onTap: (){
                      Get.back();
                    },
                      buttonRadius: 60,
                      buttonColor: AppColors.red,
                      borderColor: AppColors.red,
                      titleText: AppString.yesCancel)),

                  20.width,

                  Expanded(child: CommonButton(
                    onTap: (){

                      Get.back();
                    },
                      borderColor: AppColors.black,
                      titleColor: AppColors.black,
                      buttonColor: AppColors.white,
                      buttonRadius: 60,
                      titleText: AppString.yes)),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
