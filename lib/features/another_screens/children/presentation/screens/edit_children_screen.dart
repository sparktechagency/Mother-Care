import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mother_care/features/another_screens/children/presentation/controller/add_or_edit_screen_controller.dart';
import 'package:mother_care/utils/extensions/extension.dart';

import '../../../../../component/button/common_button.dart';
import '../../../../../component/text/common_text.dart';
import '../../../../../component/text_field/common_text_field.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_string.dart';
import '../../../../../utils/helpers/other_helper.dart';

class EditChildrenScreen extends StatelessWidget {
  const EditChildrenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: AddOrEditScreenController(),
        builder: (controller) {
          return  Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.white,
              surfaceTintColor: AppColors.transparent,
              shadowColor: AppColors.transparent,
              title: CommonText(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                text: AppString.editChildrenInfo,
              ),
              leading: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 23.sp,
                  color: AppColors.textFiledColor,
                ),
              ),
            ),

            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  15.height,

                  CommonText(
                    fontSize: 16,
                    bottom: 6,
                    fontWeight: FontWeight.w600,
                    text: AppString.fullName,
                  ),

                  CommonTextField(
                    borderColor: AppColors.normalGray2,
                    controller: controller.childNameController,
                    hintText: AppString.enterChildFullName,
                  ),
                  15.height,

                  CommonText(
                    fontSize: 16,
                    bottom: 6,
                    fontWeight: FontWeight.w600,
                    text: AppString.dateOfBirth,
                  ),

                  CommonTextField(
                    suffixIcon: InkWell(
                      onTap: () {
                        OtherHelper.openDatePickerDialog(
                          controller.dateControllerController,
                        );
                      },
                      child: Icon(Icons.date_range, color: AppColors.bodyClr),
                    ),
                    borderColor: AppColors.normalGray2,
                    controller: controller.dateControllerController,
                    hintText: AppString.dateOfBirthFormat,
                  ),

                  16.height,

                  CommonText(
                    fontSize: 16,
                    bottom: 6,

                    fontWeight: FontWeight.w600,
                    text: AppString.gender,
                  ),

                  Row(
                    children: [
                      SizedBox(
                        height: 24,
                        width: 24,
                        child: Checkbox(
                          activeColor: AppColors.primaryColor,

                          side: BorderSide(
                            color: AppColors.primaryColor,
                            width: 2,
                          ),
                          value: controller.genderType == "boy",

                          onChanged: (v) {
                            if (v == true) {
                              controller.updateGenderType("boy");
                            } else {
                              controller.clearOption();
                            }
                          },
                        ),
                      ),
                      CommonText(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.bodyClr,
                        text: AppString.boy,
                      ),

                      35.width,
                      SizedBox(
                        height: 24,
                        width: 24,
                        child: Checkbox(
                          side: BorderSide(
                            color: AppColors.primaryColor,
                            width: 2,
                          ),
                          activeColor: AppColors.primaryColor,

                          value: controller.genderType == "girl",

                          onChanged: (v) {
                            if (v == true) {
                              controller.updateGenderType("girl");
                            } else {
                              controller.clearOption();
                            }
                          },
                        ),
                      ),

                      CommonText(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.bodyClr,
                        text: AppString.girl,
                      ),
                    ],
                  ),

                  CommonText(
                    top: 16,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    text: AppString.uploadChildImage,
                  ),

                  12.height,
                  SizedBox(
                    height: 140,
                    width: double.infinity,
                    child: DottedBorder(
                      // options: RectDottedBorderOptions(
                      //   dashPattern: [4, 5],
                      //   strokeWidth: 1,

                      //   color: AppColors.primaryColor,
                      // ),
                      child: InkWell(
                        onTap: (){
                          controller.getChildImage();
                        },
                        child: Center(
                          child: controller.image != null
                              ? Image.file(File(controller.image!))
                              : Icon(
                            size: 35,
                            color: AppColors.textFiledColor,
                            Icons.photo,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),


            ),

            bottomNavigationBar: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 35.h),
              child: CommonButton(


                  onTap: (){
                    Get.back();
                  },
                  titleText: AppString.updateInfo),
            ),
          );
        }
    );
  }
}
