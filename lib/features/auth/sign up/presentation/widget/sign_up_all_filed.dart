import 'package:flutter/material.dart';
import '../../../../../utils/helpers/other_helper.dart';
import '../../../../../utils/constants/app_string.dart';
import '../../../../../component/text/common_text.dart';
import '../../../../../component/text_field/common_text_field.dart';
import '../controller/sign_up_controller.dart';
import '../../../../../utils/constants/app_colors.dart';


class SignUpAllField extends StatelessWidget {
  const SignUpAllField({super.key, required this.controller});

  final SignUpController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// User Name here
        const CommonText(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            text: AppString.fullName, bottom: 8, top: 12),
        CommonTextField(

          hintText: AppString.enterYourFullName,
          controller: controller.nameController,
          validator: OtherHelper.validator,
        ),

        /// User Email here
        const CommonText(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            text: AppString.email, bottom: 8, top: 12),
        CommonTextField(
          controller: controller.emailController,

          hintText: AppString.enterValidEmail,
          validator: OtherHelper.emailValidator,
        ),

        /// User Password here
        const CommonText(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            text: AppString.password, bottom: 8, top: 12),
        CommonTextField(
          controller: controller.passwordController,

          isPassword: true,
          hintText: AppString.enterYouPassword,
          validator: OtherHelper.passwordValidator,
        ),

        /// User Confirm Password here
         CommonText(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            text: AppString.confirmPassword, bottom: 8, top: 12),
        CommonTextField(
          controller: controller.confirmPasswordController,

          isPassword: true,
          hintText: AppString.confirmYourPassword,
          validator:
              (value) => OtherHelper.confirmPasswordValidator(
                value,
                controller.passwordController,
              ),
        ),
      ],
    );
  }
}
