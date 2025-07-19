
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mother_care/component/button/common_button.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/component/text_field/common_text_field.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import 'package:mother_care/utils/constants/app_string.dart';
import 'package:mother_care/utils/extensions/extension.dart';
import 'package:mother_care/utils/helpers/other_helper.dart';

class HelpAndSupportScreen extends StatelessWidget {
  const HelpAndSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CommonText(
            fontSize: 16,fontWeight: FontWeight.w600,
            text: AppString.helpSupports),
        leading: InkWell(
            onTap: (){
              Get.back();
            },
            child: Icon(Icons.arrow_back_ios, size: 23.sp,)),
      ),

      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.height,

            CommonText(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                text: AppString.enterYourName),

            6.height,

            CommonTextField(
              borderColor: AppColors.normalGray2,
              validator: OtherHelper.validator,
              hintText: AppString.enterYourName,
            ),

            16.height,

            CommonText(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                text: AppString.enterYourEmail),

            6.height,

            CommonTextField(
              borderColor: AppColors.normalGray2,
              validator: OtherHelper.emailValidator,
              hintText: AppString.enterYourEmail,
            ),
            16.height,

            CommonText(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                text: AppString.subject),

            6.height,

            CommonTextField(
              borderColor: AppColors.normalGray2,
              validator: OtherHelper.emailValidator,
              hintText: AppString.subject,
            ),     16.height,

            CommonText(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                text: AppString.enterYourMessage),

            6.height,

            CommonTextField(
              maxline: 4,
              borderColor: AppColors.normalGray2,
              validator: OtherHelper.validator,

            ),
            24.height,
            
            CommonButton(
                buttonRadius: 60.r,
                titleText: AppString.send)
          ],
        ),
      ),
    );
  }
}
