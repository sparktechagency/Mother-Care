
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mother_care/component/button/common_button.dart';
import 'package:mother_care/component/image/common_image.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/config/route/app_routes.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import 'package:mother_care/utils/constants/app_images.dart';
import 'package:mother_care/utils/constants/app_string.dart';
import 'package:mother_care/utils/extensions/extension.dart';

class ResetPassSuccessPopUp{
  static successPopUp(){
    showDialog(
        context: Get.context!,
        builder: (context){
          return AlertDialog(
            content:Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CommonImage(
                    height: 80,
                    width: 80,
                    imageSrc: AppImages.passwordChangeLogo),
                
                12.height,

                CommonText(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryColor,
                    text: AppString.changedPassword),

                CommonText(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    maxLines: 2,
                    color: AppColors.bodyClr,
                    text: AppString.changedPasswordDes),
                
                24.height,
                
                CommonButton(
                    onTap: (){
                      Get.toNamed(AppRoutes.signIn);
                    },
                    titleText: AppString.backToLogin)
              ],
            ),
          );
        });
  }
}