import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mother_care/component/other_widgets/no_data.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/component/text_field/common_text_field.dart';
import 'package:mother_care/features/another_screens/nunny_profile_screens/presentation/controller/certificate_and_experience_controller.dart';
import 'package:mother_care/features/another_screens/nunny_profile_screens/presentation/widgets/add_experience_popup.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import 'package:mother_care/utils/constants/app_string.dart';
import 'package:mother_care/utils/extensions/extension.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CertificateAndExperienceController(),
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.height,
            CommonText(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                text: AppString.yearsOfExperience),
            6.height,

            CommonTextField(
              keyboardType: TextInputType.none,

              controller: controller.experienceController,
              suffixIcon: Padding(
                padding:  EdgeInsets.symmetric(vertical: 5.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(

                      onTap: (){
                        controller.addExperience();
                      },
                      child: Icon(
                          size: 20.sp,
                          Icons.keyboard_arrow_up),
                    ),  InkWell(

                      onTap: (){
                        controller.minasExperience();
                      },
                      child: Icon(
                          size: 20.sp,
                          Icons.keyboard_arrow_down),
                    )
                  ],
                ),
              ),
            ),

            20.height,

            Row(
              children: [
                CommonText(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    text: AppString.workExperience),
                Spacer(),

                InkWell(

                  onTap: (){
                    AddExperiencePopUp.addExperiencePopUp();
                  },
                  child: Row(children: [
                    Icon(
                      size: 20,
                      Icons.add, color: AppColors.primaryColor,),

                    CommonText(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                        text: AppString.add)
                  ],),
                )


              ],
            ),
            10.height,



            controller.workExperienceList.isEmpty?NoData():
                ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,

                    itemCount: controller.workExperienceList.length,
                    itemBuilder: (context, index){
                    var item=controller.workExperienceList[index];
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 5.h),
                      width: double.infinity,
                      padding: EdgeInsets.all(12.r),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        border: Border.all(color: AppColors.textFiledColor),
                        borderRadius: BorderRadius.circular(12.r),

                      ),
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: CommonText(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    text: item["position"]),
                              ),

                              Spacer(),
                              Icon(
                                size: 18.sp,
                                Icons.edit, color: AppColors.bodyClr,),
                              5.width,
                              InkWell(
                                onTap: (){
                                  controller.removeWorkExperience(index);
                                },
                                child: Icon(
                                  size: 18.sp,
                                  Icons.delete, color: AppColors.red,),
                              ),


                            ],
                          ),

                          6.height,

                          Row(children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.bodyClr
                              ),
                              width: 5.h,
                              height: 5.h,),
                            
                            CommonText(
                                fontSize: 12,
                                color: AppColors.bodyClr,
                                left: 4,
                                fontWeight: FontWeight.w400,
                                text: "${item["company"]}, ${item["location"]}")
                          ],)  ,

                          6.height,

                          Row(children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.bodyClr
                              ),
                              width: 5.h,
                              height: 5.h,),

                            CommonText(
                                fontSize: 12,
                                color: AppColors.bodyClr,
                                left: 4,
                                fontWeight: FontWeight.w400,
                                text: "${item["startDate"]} - ${item["endDate"]}")
                          ],)
                        ],
                      ),

                    );


                }),

            30.height
          ],
        );
      }
    );
  }
}
