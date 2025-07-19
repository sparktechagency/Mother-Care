import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/config/route/app_routes.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import 'package:mother_care/utils/constants/app_string.dart';

class AddChildrenButton extends StatelessWidget {
  const AddChildrenButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.toNamed(AppRoutes.addChildrenScreen);
      },
      child: Container(
        margin: const EdgeInsets.only(left: 21, right: 21, bottom: 20),
        width:double.infinity,
        height: 56.h,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(60.r)
        ),

        child: Row(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Icon(Icons.child_care_outlined, color: AppColors.white,),
            CommonText(
              left: 6,              color: AppColors.white,
                fontSize:16,
                fontWeight: FontWeight.w700,
                text: AppString.addChildren)
          ],
        ),
      ),
    );
  }
}
