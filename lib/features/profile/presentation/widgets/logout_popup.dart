import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mother_care/component/image/common_image.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import 'package:mother_care/utils/constants/app_images.dart';
import 'package:mother_care/utils/constants/app_string.dart';
import 'package:mother_care/utils/extensions/extension.dart';

import '../../../../services/storage/storage_services.dart';

class LogOutPopUp{
  static logoutDialog(){
    showDialog(
        context: Get.context!,

        builder: (context){
         return AlertDialog(
           content: Column(
             mainAxisSize: MainAxisSize.min,
             children: [
               CommonImage(
                   height: 88,
                   width: 78,
                   imageSrc: AppImages.alert),

               CommonText(
                   fontSize: 15,
                   fontWeight: FontWeight.w700,
                   color: AppColors.red,
                   maxLines: 2,
                   text: AppString.logOutTitle),

               CommonText(
                   fontSize: 12,
                   fontWeight: FontWeight.w400,
                   color: AppColors.bodyClr,
                   maxLines: 2,
                   text: AppString.logOutDes),

               24.height,

               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   InkWell(
                     onTap: (){
                       LocalStorage.removeAllPrefData();
                     },
                     child: Container(
                       padding: EdgeInsets.symmetric(horizontal: 31.w, vertical: 10.h),
                       decoration:
                       BoxDecoration(
                         color: AppColors.red,
                         borderRadius: BorderRadius.circular(60.r)
                       ),
                       child: CommonText(

                           fontSize: 16,
                           color: AppColors.white,
                           fontWeight: FontWeight.w700,
                           text: AppString.yes),
                     ),
                   ),

                   25.width,

                   InkWell(
                     onTap: (){
                       Get.back();
                     },
                     child: Container(
                       padding: EdgeInsets.symmetric(horizontal: 31.w, vertical: 10.h),
                       decoration:
                       BoxDecoration(
                         border: Border.all(color: AppColors.titleColor),
                           color: AppColors.white,
                           borderRadius: BorderRadius.circular(60.r)
                       ),
                       child: CommonText(

                           fontSize: 16,
                           color: AppColors.titleColor,
                           fontWeight: FontWeight.w700,
                           text: AppString.no),
                     ),
                   ),
                 ],
               )

             ],
           ),
         );
        });
  }
}