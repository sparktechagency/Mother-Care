import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mother_care/component/other_widgets/item.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import 'package:mother_care/utils/constants/app_string.dart';

import '../../../../../component/bottom_nav_bar/common_bottom_bar.dart';
import '../widgets/nunny_saved_item.dart';

class SavedScreens extends StatelessWidget {
  const SavedScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: AppColors.transparent,
        shadowColor: AppColors.transparent,
        backgroundColor: AppColors.white,
        leading: InkWell(

            onTap: (){
              Get.back();
            },
            child: Icon(Icons.arrow_back_ios, size: 23.sp,)),
        title: CommonText(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            text: AppString.savedNanny),
      ),

      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
          itemCount: 4,

          itemBuilder: (context, index){
            return NunnySavedItem();

      }),

      bottomNavigationBar: const CommonBottomNavBar(currentIndex: 3),
    );
  }
}
