import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../utils/extensions/extension.dart';
import '../../../../../component/button/common_button.dart';
import '../../../../../component/text/common_text.dart';
import '../../../../../component/text_field/common_text_field.dart';
import '../controller/change_password_controller.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_string.dart';
import '../../../../../utils/helpers/other_helper.dart';


class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: (){
              Get.back();
            },
            child: Icon(Icons.arrow_back_ios, size: 23.sp,)),
        centerTitle: true,
        title: const CommonText(
          text: AppString.changePassword,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: GetBuilder<ChangePasswordController>(
        builder: (controller) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.height,

                  /// current Password section
                   CommonText(

                    fontSize: 16,
                      fontWeight: FontWeight.w600,
                      text: AppString.currentPassword, bottom: 8),
                  CommonTextField(
                    borderColor: AppColors.normalGray2,

                    controller: controller.currentPasswordController,
                    hintText: AppString.currentPassword,
                    validator: OtherHelper.passwordValidator,
                    isPassword: true,

                  ),

                  /// New Password section
                  const CommonText(

                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    text: AppString.newPassword,
                    bottom: 8,
                    top: 16,
                  ),
                  CommonTextField(
                    borderColor: AppColors.normalGray2,

                    controller: controller.newPasswordController,
                    hintText: AppString.newPassword,
                    validator: OtherHelper.passwordValidator,
                    isPassword: true,

                  ),

                  /// confirm Password section
                  const CommonText(

                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    text: AppString.confirmPassword,
                    bottom: 8,
                    top: 16,
                  ),
                  CommonTextField(
                    borderColor: AppColors.normalGray2,
                    controller: controller.confirmPasswordController,
                    hintText: AppString.confirmPassword,
                    validator:
                        (value) => OtherHelper.confirmPasswordValidator(
                          value,
                          controller.newPasswordController,
                        ),
                    isPassword: true,

                  ),


                  20.height,

                  /// submit Button
                  CommonButton(
                    titleText: AppString.update,
                    isLoading: controller.isLoading,
                    onTap: controller.changePasswordRepo,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
