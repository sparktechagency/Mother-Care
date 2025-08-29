import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import '../../../../utils/extensions/extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../component/button/common_button.dart';
import '../../../../component/image/common_image.dart';
import '../../../../component/text/common_text.dart';
import '../controller/profile_controller.dart';
import '../../../../utils/constants/app_images.dart';
import '../../../../utils/constants/app_string.dart';
import '../widgets/edit_profile_all_filed.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (controller) {
        return Scaffold(
          /// App Bar Sections Starts here
          appBar: AppBar(
            surfaceTintColor: AppColors.transparent,
            shadowColor: AppColors.transparent,
            backgroundColor: AppColors.white,
            leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(
                color: AppColors.textFiledColor,
                Icons.arrow_back_ios,
                size: 23.sp,
              ),
            ),
            centerTitle: true,
            title: const CommonText(
              text: AppString.editInformation,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),

          /// Body Sections Starts here
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  /// User Profile image here
                  Stack(
                    children: [
                      Center(
                        child: GestureDetector(
                          onTap: controller.getProfileImage,
                          child: Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.grey.shade400,
                            ),
                            child: CircleAvatar(
                              radius: 47.sp,
                              backgroundColor: Colors.transparent,
                              child: ClipOval(
                                child:
                                controller.image != null
                                    ? Image.file(
                                  File(controller.image!),
                                  width: 93.h,
                                  height: 93.h,
                                  fit: BoxFit.fill,
                                )
                                    : controller.oldIage != null ?
                                Image.network(
                                  controller.oldIage ?? "",
                                  width: 93.h,
                                  height: 93.h,
                                  fit: BoxFit.fill,
                                )
                                    :

                                const CommonImage(
                                  imageSrc: AppImages.profile,
                                  height: 93,
                                  width: 93,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      /// image change icon here
                      Positioned(
                        bottom: 0,
                        left: Get.width * 0.48,
                        child: InkWell(
                          onTap: controller.getProfileImage,
                          child: Container(
                            padding: EdgeInsets.all(5.r),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: AppColors.white,
                              ),
                              color: AppColors.primaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              size: 15.sp,
                              Icons.edit,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  /// user all information filed here
                  EditProfileAllFiled(controller: controller),
                  30.height,

                  /// Submit Button here
                  CommonButton(
                    titleText: AppString.updateInfo,
                    isLoading: controller.isLoading,
                    onTap: () {

                      controller.editProfileRepo();

                      // Get.back();
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
