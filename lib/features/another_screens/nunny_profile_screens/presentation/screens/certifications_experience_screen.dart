import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mother_care/component/other_widgets/no_data.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/component/text_field/common_text_field.dart';
import 'package:mother_care/features/another_screens/nunny_profile_screens/presentation/controller/certificate_and_experience_controller.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import 'package:mother_care/utils/constants/app_string.dart';
import 'package:mother_care/utils/extensions/extension.dart';

import '../widgets/add_certificate_section.dart';
import '../widgets/experience_section.dart';

class CertificationsExperienceScreen extends StatelessWidget {
  const CertificationsExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        shadowColor: AppColors.transparent,
        surfaceTintColor: AppColors.transparent,
        title: CommonText(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          text: AppString.certificationAndExperience,
        ),
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios,
            size: 23.sp,
            color: AppColors.bodyClr,
          ),
        ),
      ),

      body:GetBuilder(
        init: CertificateAndExperienceController(),
        builder: (controller) {
          return Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AddCertificateSection(),
                  ExperienceSection()
                ],
              ),
            ),
          );
        }
      ) ,

    );
  }
}
