import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mother_care/component/button/common_button.dart';
import 'package:mother_care/component/image/common_image.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/config/route/app_routes.dart';
import 'package:mother_care/utils/constants/app_string.dart';
import 'package:mother_care/utils/extensions/extension.dart';

import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_images.dart';
import '../controller/add_photo_controller.dart';

class AddPhotoScreen extends StatelessWidget {
  const AddPhotoScreen({super.key});

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

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: GetBuilder(
              init: AddPhotoController(),
              builder: (controller) {
                return Column(
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

                    142.height,

                    CommonText(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      text: AppString.addPhoto,
                    ),

                    12.height,

                    Stack(
                      children: [
                        controller.image != null
                            ? CircleAvatar(
                                radius: 60,
                                child: ClipOval(
                                  child: Image.file(
                                    File(controller.image!),
                                    height: 120,
                                    width: 120,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              )
                            : CommonImage(
                                height: 120,
                                width: 120,
                                imageSrc: AppImages.addPhoto,
                              ),

                        Positioned(
                          right: 10,
                          bottom: 0,
                          child: InkWell(
                            onTap: controller.getProfileImage,
                            child: Icon(
                              size: 30.sp,
                              color: AppColors.primaryColor,
                              Icons.camera_alt,
                            ),
                          ),
                        ),
                      ],
                    ),

                    100.height,

                    CommonButton(
                        onTap: (){
                          Get.toNamed(AppRoutes.signIn);
                        },
                        titleText: AppString.continues),

                    16.height,
                    CommonButton(
                      onTap: (){
                        Get.toNamed(AppRoutes.signIn);
                      },
                      titleColor: AppColors.titleColor,
                      borderColor: AppColors.primaryColor,
                      buttonColor: AppColors.white,
                      titleText: AppString.skip,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
