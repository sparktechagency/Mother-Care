import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mother_care/component/button/common_button.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/config/route/app_routes.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import 'package:mother_care/utils/constants/app_string.dart';
import 'package:mother_care/utils/extensions/extension.dart';

class PaymentSuccessPopUp{
  static paymentSuccessDialog(){
    showDialog(

        context: Get.context!,
        builder: (context){
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: (){
                    Get.back();},
                  child: Container(
                    padding: EdgeInsets.all(3.r),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.textFiledColor
                      )                  ),
                    child: Icon(
                      color: AppColors.textFiledColor,
                        size: 12,
                        Icons.clear),
                  ),
                ).end,

                23.height,


                Container(
                  padding: EdgeInsets.all(10.r),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryColor
                  ),
                  child: Icon(
                    size: 32.sp,
                      color: AppColors.white,
                      Icons.done),
                ),
                
                35.height,
                
                CommonText(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.titleColor,
                    text: AppString.paymentSuccessful),

                12.height,

                CommonText(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.titleColor,
                    maxLines: 5,
                    text: AppString.paymentSuccessfulDes),
                
                20.height,
                
                CommonButton(
                    onTap: (){
                      Get.toNamed(AppRoutes.parentHomeScreen);
                    },
                    titleText: AppString.goHome)

              ],
            ),
          );
        });
  }
}