import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mother_care/component/button/common_button.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import 'package:mother_care/utils/constants/app_string.dart';
import 'package:mother_care/utils/extensions/extension.dart';
import '../../utils/constants/app_images.dart';



class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Opacity(
        opacity: 0.98,
        child: Container(


          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.black,
            image: DecorationImage(
              image: AssetImage(AppImages.onboardingOne),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              CommonText(

                  left: 50,
                  color: AppColors.white,
                  maxLines: 3,
                  right: 50,
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  text: AppString.welcomeToMamaCare),


              CommonText(
                top: 16,

                  left: 31,
                  color: AppColors.white,
                  maxLines: 3,
                  right: 31,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  text: AppString.onboardingOneDes),
              24.height,


              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 27.w),
                child: CommonButton(

                    titleText: AppString.getStarted),
              ),


              32.height,

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  CommonText(

                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                      text: AppString.newHere),

                  5.width,

                  CommonText(

                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryColor,
                      text: AppString.joinMamaCareFamily),
                ],
              ),

              35.height

            ],


          ),
        ),
      ),
    );
  }
}
