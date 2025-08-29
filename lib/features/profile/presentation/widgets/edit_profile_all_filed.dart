import 'package:flutter/material.dart';
import '../../../../component/text/common_text.dart';
import '../../../../component/text_field/common_phone_number_text_filed.dart';
import '../../../../component/text_field/common_text_field.dart';
import '../controller/profile_controller.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_string.dart';
import '../../../../utils/helpers/other_helper.dart';
import '../../../../utils/log/app_log.dart';


class EditProfileAllFiled extends StatelessWidget {
  const EditProfileAllFiled({super.key, required this.controller});

  final ProfileController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// User Full Name here
        const CommonText(
          text: AppString.fullName,fontSize: 16,
          fontWeight: FontWeight.w600,
          bottom: 12,
        ),
        CommonTextField(
          controller: controller.nameController,
          validator: OtherHelper.validator,
          hintText: AppString.fullName,

          keyboardType: TextInputType.text,
          borderColor: AppColors.textFiledColor,
          fillColor: AppColors.transparent,
        ),

        /// User Full Name here
        const CommonText(
          top: 16,
          text: AppString.email,fontSize: 16,
          fontWeight: FontWeight.w600,
          bottom: 12,
        ),
        CommonTextField(
          controller: controller.emailController,
          validator: OtherHelper.emailValidator,
          hintText: AppString.email,

          keyboardType: TextInputType.emailAddress,
          borderColor: AppColors.textFiledColor,
          fillColor: AppColors.transparent,
        ),


        /// User Full Name here
        const CommonText(
          top: 16,
          text: AppString.phoneNumber,fontSize: 16,
          fontWeight: FontWeight.w600,
          bottom: 12,
        ),
        CommonTextField(
          controller: controller.numberController,
          validator: OtherHelper.validator,
          hintText: AppString.phoneNumber,

          keyboardType: TextInputType.number,
          borderColor: AppColors.textFiledColor,
          fillColor: AppColors.transparent,
        ),


        /// User Full Name here
        const CommonText(
          top: 16,
          text: AppString.address,fontSize: 16,
          fontWeight: FontWeight.w600,
          bottom: 12,
        ),
        CommonTextField(
          controller: controller.addressController,
          validator: OtherHelper.validator,
          hintText: AppString.enterAddress,

          keyboardType: TextInputType.number,
          borderColor: AppColors.textFiledColor,
          fillColor: AppColors.transparent,
        ),


      ],
    );
  }
}
