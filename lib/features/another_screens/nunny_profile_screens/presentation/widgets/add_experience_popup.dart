
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/component/text_field/common_text_field.dart';
import 'package:mother_care/features/another_screens/nunny_profile_screens/presentation/controller/certificate_and_experience_controller.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import 'package:mother_care/utils/constants/app_string.dart';
import 'package:mother_care/utils/extensions/extension.dart';
import 'package:mother_care/utils/helpers/other_helper.dart';

class AddExperiencePopUp{
  static addExperiencePopUp(){
    showDialog(
        context: Get.context!,
        builder: (context){

          return AlertDialog(

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // Optional: to make the dialog rounded
            ),
            backgroundColor: AppColors.white,
            content: GetBuilder(
              init: CertificateAndExperienceController(),
              builder: (controller) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonText(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.titleColor,
                              text: AppString.experience),


                          InkWell(
                            onTap: (){
                              Get.back();
                            },
                            child: Container(
                              padding: EdgeInsets.all(3.r),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: AppColors.titleColor)
                              ),
                              child: Icon(
                                size: 12,
                                  color: AppColors.titleColor,
                                  Icons.clear),
                            ),
                          )
                        ],
                      ),
                      12.height,


                      CommonTextField(

                        hintText: AppString.position,
                        controller: controller.positionController,
                        borderColor: AppColors.normalGray2,

                      ),

                      8.height,


                      CommonTextField(
                        hintText: AppString.company,
                        controller: controller.companyController,
                        borderColor: AppColors.normalGray2,

                      ),


                      8.height,


                      CommonTextField(
                        hintText: AppString.location,
                        controller: controller.locationController,
                        borderColor: AppColors.normalGray2,

                      ),

                      8.height,

                      Row(
                        children: [
                          Expanded(child:  CommonTextField(
                            suffixIcon: InkWell(
                                onTap: (){
                                  OtherHelper.openDatePickerDialog(controller.startDateController);
                                },
                                child: Icon(Icons.calendar_month, color: AppColors.bodyClr,)),
                            hintText: AppString.startDate,
                            controller: controller.startDateController,
                            borderColor: AppColors.normalGray2,

                          )),

                          7.width,Expanded(child:  CommonTextField(
                            suffixIcon: InkWell(
                                onTap: (){
                                  OtherHelper.openDatePickerDialog(controller.endDateController);
                                },
                                child: Icon(Icons.calendar_month,  color: AppColors.bodyClr)),
                            hintText: AppString.endDate,
                            controller: controller.endDateController,
                            borderColor: AppColors.normalGray2,

                          )),
                        ],
                      ),
                      
                      20.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: (){
                              Get.back();
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 30.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60.r),
                                border: Border.all(
                                  color: AppColors.red,

                                ),

                              ),
                              child: CommonText(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.red,
                                  text: AppString.cancel),
                            ),
                          ),

                          InkWell(
                            onTap: (){
                              controller.addWorkExperience(

                                  controller.workExperienceList,
                                  controller.positionController.text,

                                  controller.companyController.text,
                                  controller.locationController.text,
                                  controller.startDateController.text,
                                  controller.endDateController.text);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 30.w),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(60.r),
                                border: Border.all(
                                  color: Colors.green,

                                ),

                              ),
                              child: CommonText(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.white,
                                  text: AppString.submit),
                            ),
                          ),
                        ],
                      )


                    ],
                  ),
                );
              }
            ),
          );
        });
  }
}