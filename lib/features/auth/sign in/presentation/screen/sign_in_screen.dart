import 'package:flutter/material.dart';
import 'package:mother_care/services/storage/storage_services.dart';
import '../../../../../component/image/common_image.dart';
import '../../../../../config/route/app_routes.dart';
import '../../../../../utils/constants/app_images.dart';
import '../../../../../utils/extensions/extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../component/button/common_button.dart';
import '../../../../../component/text/common_text.dart';
import '../../../../../component/text_field/common_text_field.dart';
import '../controller/sign_in_controller.dart';

import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_string.dart';
import '../../../../../utils/helpers/other_helper.dart';
import '../widgets/continue_with_google.dart';
import '../widgets/do_not_account.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      /// Body Sections Starts here
      body: GetBuilder<SignInController>(
        builder: (controller) {
          return Stack(
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
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                          /// Log In Instruction here
                          Center(
                            child: CommonText(
                              text: AppString.signIn,
                              fontSize: 24,

                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w700,
                              top: 25,
                            ),
                          ),

                          Center(
                            child: CommonText(
                              text: AppString.signInDes,
                              fontSize: 14,
                              maxLines: 2,
                              bottom: 32,
                              left: 44,
                              right: 44,
                              top: 10,
                              color: AppColors.titleColorSecondary,
                              fontWeight: FontWeight.w700,

                            ),
                          ),

                          /// Account Email Input here
                          CommonText(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              text: AppString.email, bottom: 8),
                          CommonTextField(
                            controller: controller.emailController,

                            hintText: AppString.enterYourEmail,
                            validator: OtherHelper.emailValidator,
                          ),

                          /// Account Password Input here
                          const CommonText(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            text: AppString.password,
                            bottom: 8,
                            top: 18,
                          ),
                          CommonTextField(
                            controller: controller.passwordController,

                            isPassword: true,
                            hintText: AppString.enterYouPassword,
                            validator: OtherHelper.passwordValidator,
                          ),

                          12.height,

                          /// Forget Password Button here
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // Checkbox toggle করার জন্য controller কে call করা
                                  controller.isRememberToggle();
                                },
                                child: Container(
                                  width: 16.h,
                                  height: 16.w,
                                  decoration: BoxDecoration(
                                    color: controller.isRemember ? AppColors.primaryColor : Colors.white,
                                    border: Border.all(
                                        width:controller.isRemember? 0: 2,
                                        color: controller.isRemember?AppColors.white: Colors.grey),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: controller.isRemember
                                      ? Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 16,
                                  )
                                      : null,
                                ),
                              ),

                              8.width,



                              CommonText(
                                  fontSize: 14,
                                  color: AppColors.titleColorSecondary,
                                  fontWeight: FontWeight.w500,
                                  text: AppString.rememberMe),
                              Spacer(),
                              GestureDetector(
                                onTap: () => Get.toNamed(AppRoutes.forgotPassword),
                                child: const CommonText(
                                  text: AppString.forgotThePassword,

                                  color: AppColors.primaryColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),

                          25.height,

                          /// Submit Button here
                          CommonButton(
                            titleText: AppString.signIn+" as Parents",
                            isLoading: controller.isLoading,
                            onTap: (){
                              LocalStorage.myRoll="parents";
                              controller.signInUser();
                            },
                          ),
                          10.height,

                          /// Submit Button here
                          CommonButton(
                            titleText: AppString.signIn+" as Nunny",
                            isLoading: controller.isLoading,
                            onTap: (){
                              LocalStorage.myRoll="nunny";
                              controller.signInUser();
                            },
                          ),

                          12.height,

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 1,
                                width: 96.w,
                                color: AppColors.textFiledColor,
                              ),

                              CommonText(
                                  left: 8,
                                  right: 8,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  text: AppString.orLoginWith),



                              Container(
                                height: 1,
                                width: 96.w,
                                color: AppColors.textFiledColor,
                              ),
                            ],
                          ),

                          12.height,

                          ContinueWithGoogle(),
                          20.height,



                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              CommonText(

                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.textFiledColor,
                                  text: AppString.newHere),

                              5.width,

                              InkWell(
                                onTap: (){
                                  Get.toNamed(AppRoutes.mamaCareScreen);
                                },
                                child: CommonText(

                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.primaryColor,
                                    text: AppString.joinMamaCareFamily),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
