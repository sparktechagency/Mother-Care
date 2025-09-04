import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mother_care/component/image/common_image.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import 'package:mother_care/utils/constants/app_images.dart';
import 'package:mother_care/utils/constants/app_string.dart';
import 'package:mother_care/utils/extensions/extension.dart';

class RemoveChildrenPopUp{
  static removeChildrenPopUp(){
    showDialog(
        context: Get.context!,
        builder: (context){
          
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
               CommonImage(
                   height: 80,
                   width: 80,
                   imageSrc: AppImages.alert),
                
                CommonText(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: AppColors.red,
                    maxLines: 2,
                    text: AppString.removeChildrenTitle),

                CommonText(
                    fontSize: 12,
                    top: 6,
                    fontWeight: FontWeight.w400,
                    color: AppColors.bodyClr,
                    maxLines: 2,
                    text: AppString.removeChildrenDes),

                24.height,

                Row(
                  children: [
                    InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child: Container(
                        width: 128.w,
                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color:
                            AppColors.red
                        ),
                        child: CommonText(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.white,
                            text: AppString.yesRemove),
                      ),
                    ),

                    12.width,

                    InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child: Container(
                        width: 100.w,
                        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color:
                            AppColors.white,
                          border: Border.all(color: AppColors.title2)
                        ),
                        child: CommonText(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black,
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