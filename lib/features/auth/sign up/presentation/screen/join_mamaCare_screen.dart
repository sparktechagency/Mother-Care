import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mother_care/component/button/common_button.dart';
import 'package:mother_care/config/route/app_routes.dart';
import 'package:mother_care/features/auth/sign%20up/presentation/controller/join_mama_controller.dart';
import 'package:mother_care/utils/extensions/extension.dart';

import '../../../../../component/image/common_image.dart';
import '../../../../../component/text/common_text.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_images.dart';
import '../../../../../utils/constants/app_string.dart';

class JoinMamacareScreen extends StatelessWidget {
  const JoinMamacareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Opacity(
            opacity: 0.03,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.splashBg),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          SingleChildScrollView(
            child: GetBuilder(
              init: JoinMamaController(),
              builder: (controller) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      50.height,
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.textFiledColor,
                        ),
                      ).start,

                      55.height,

                      Center(
                        child: ClipOval(
                          child: SizedBox(
                            height: 130,
                            width: 130,
                            child: CommonImage(
                              fill: BoxFit.cover,
                              imageSrc: AppImages.logo,
                            ).center,
                          ),
                        ),
                      ),

                      Center(
                        child: CommonText(
                          top: 32,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: AppColors.black,
                          text: AppString.signUp,
                        ),
                      ),
                      Center(
                        child: CommonText(
                          top: 10,
                          left: 30,
                          right: 30,
                          maxLines: 3,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.titleColorSecondary,
                          text: AppString.mamaCareDes,
                        ),
                      ),

                      32.height,

                      signUpTypeButton(
                        image: AppImages.signUpParent,
                        title: AppString.signUpAsParent,
                        subTitle: AppString.signUpAsParentDes,

                        onTap: () {
                          controller.updateSignUpSelectedButton(0);
                        },
                        isSelected: controller.selectedSignUpButtonIndex == 0
                            ? true
                            : false,
                      ),

                      24.height,

                      signUpTypeButton(
                        image: AppImages.signUpNunny,
                        title: AppString.signUpNanny,
                        subTitle: AppString.signUpNannyDes,
                        onTap: () {
                          controller.updateSignUpSelectedButton(1);
                        },
                        isSelected: controller.selectedSignUpButtonIndex == 1
                            ? true
                            : false,
                      ),
                      
                      32.height,
                      
                      CommonButton(

                          onTap: (){
                            Get.toNamed(AppRoutes.signUp);
                          },
                          titleText: AppString.continues)
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget signUpTypeButton({
    image,
    title,
    subTitle,
    onTap,
    bool isSelected = false,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      height: 76.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.bodyClr),
      ),
      child: Row(
        children: [
          CommonImage(height: 44, width: 44, imageSrc: image),

          12.width,

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                text: title,
              ),

              CommonText(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                text: subTitle,
              ),
            ],
          ),
          Spacer(),

          InkWell(
            onTap: onTap,
            child: Container(
              height: 25.h,
              width: 25.h,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: isSelected
                      ? AppColors.primaryColor
                      : AppColors.bodyClr,
                ),
                color: isSelected ? AppColors.primaryColor : AppColors.white,
                shape: BoxShape.circle,
              ),

              child: Center(child: Icon(color: AppColors.white, Icons.done)),
            ),
          ),
        ],
      ),
    );
  }
}
