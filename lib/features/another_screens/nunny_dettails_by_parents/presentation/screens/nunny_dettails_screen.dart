import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mother_care/component/button/common_button.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/config/route/app_routes.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import 'package:mother_care/utils/constants/app_string.dart';
import 'package:mother_care/utils/extensions/extension.dart';

import '../widgets/nunny_info_section.dart';
import '../widgets/nunny_other_details.dart';

class NunnyDetailsScreen extends StatelessWidget {
  const NunnyDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.transparent,
        shadowColor: AppColors.transparent,
        title: CommonText(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            text: AppString.nannyProfile),
        
        leading: InkWell(
            onTap: (){
              Get.back();
            },
            child: Icon(Icons.arrow_back_ios, size: 20,)),
      ),
      
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          
              13.height,
              NunnyInfoSection(),
              NunnyOtherDetails()
           
            ],
          ),
        ),
      ),
      
      bottomNavigationBar: Container(
        color: AppColors.white,
        padding: EdgeInsets.symmetric(vertical: 28.h, horizontal: 27.w),
        child: CommonButton(

            onTap:(){
              Get.toNamed(AppRoutes.requestBookingScreen);
            },
            titleText: AppString.bookNow),
      ),
    );
  }
}
