import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mother_care/component/other_widgets/no_data.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/component/text_field/common_text_field.dart';
import 'package:mother_care/features/another_screens/nunny_profile_screens/presentation/controller/certificate_and_experience_controller.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import 'package:mother_care/utils/constants/app_string.dart';
import 'package:mother_care/utils/extensions/extension.dart';
import 'package:mother_care/utils/helpers/other_helper.dart';

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
              text: AppString.yearsOfExperience,
            ),
            6.height,

            CommonTextField(
              keyboardType: TextInputType.none,
              readOnly: true,
              controller: controller.experienceController,
              suffixIcon: Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        controller.addExperience();
                      },
                      child: Icon(size: 20.sp, Icons.keyboard_arrow_up),
                    ),
                    InkWell(
                      onTap: () {
                        controller.minusExperience();
                      },
                      child: Icon(size: 20.sp, Icons.keyboard_arrow_down),
                    ),
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
                  text: AppString.workExperience,
                ),
                Spacer(),

                InkWell(
                  onTap: () {
                    _showAddExperiencePopup();
                  },
                  child: Row(
                    children: [
                      Icon(size: 20, Icons.add, color: AppColors.primaryColor),

                      CommonText(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                        text: AppString.add,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            10.height,

            controller.workExperienceList.isEmpty
                ? NoData()
                : ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.workExperienceList.length,
                    itemBuilder: (context, index) {
                      var item = controller.workExperienceList[index];
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 5.h),
                        width: double.infinity,
                        padding: EdgeInsets.all(12.r),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          border: Border.all(color: AppColors.textFiledColor),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: CommonText(
                                    fontSize: 16,
                                    textAlign: TextAlign.start,
                                    fontWeight: FontWeight.w600,
                                    text: item.position ?? "",
                                  ),
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () {
                                    _showEditExperiencePopup(controller, index, item);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(8.r),
                                    child: SvgPicture.asset(
                                      'assets/icons/editIcon.svg',
                                      height: 16.h,
                                      width: 16.w,
                                    ),
                                  ),
                                ),

                                InkWell(
                                  onTap: () {
                                    _showDeleteExperienceConfirmation(controller, index);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(8.r),
                                    child: SvgPicture.asset(
                                      'assets/icons/trashIcon.svg',
                                      height: 16.h,
                                      width: 16.w,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            6.height,
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.bodyClr,
                                  ),
                                  width: 5.h,
                                  height: 5.h,
                                ),

                                CommonText(
                                  fontSize: 12,
                                  color: AppColors.bodyClr,
                                  left: 4,
                                  fontWeight: FontWeight.w400,
                                  text: "${item.company ?? ""}, ${item.location ?? ""}",
                                ),
                              ],
                            ),
                            6.height,
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.bodyClr,
                                  ),
                                  width: 5.h,
                                  height: 5.h,
                                ),

                                CommonText(
                                  fontSize: 12,
                                  color: AppColors.bodyClr,
                                  left: 4,
                                  fontWeight: FontWeight.w400,
                                  text: "${item.startDate ?? ""} - ${item.endDate ?? ""}",
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
            30.height,
          ],
        );
      },
    );
  }

  // Show add experience popup
  void _showAddExperiencePopup() {
    // final controller = Get.find<CertificateAndExperienceController>();

    showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: AppColors.white,
          content: GetBuilder<CertificateAndExperienceController>(
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
                          text: AppString.experience,
                        ),
                        InkWell(
                          onTap: () {
                            controller.clearWorkExperienceControllers();
                            Get.back();
                          },
                          child: Container(
                            padding: EdgeInsets.all(3.r),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: AppColors.titleColor),
                            ),
                            child: Icon(
                              size: 12,
                              color: AppColors.titleColor,
                              Icons.clear,
                            ),
                          ),
                        ),
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
                        Expanded(
                          child: CommonTextField(
                            suffixIcon: InkWell(
                              onTap: () {
                                OtherHelper.openDatePickerDialog(
                                  controller.startDateController,
                                );
                              },
                              child: Icon(Icons.calendar_month, color: AppColors.bodyClr),
                            ),
                            hintText: AppString.startDate,
                            controller: controller.startDateController,
                            borderColor: AppColors.normalGray2,
                          ),
                        ),
                        7.width,
                        Expanded(
                          child: CommonTextField(
                            suffixIcon: InkWell(
                              onTap: () {
                                OtherHelper.openDatePickerDialog(
                                  controller.endDateController,
                                );
                              },
                              child: Icon(Icons.calendar_month, color: AppColors.bodyClr),
                            ),
                            hintText: AppString.endDate,
                            controller: controller.endDateController,
                            borderColor: AppColors.normalGray2,
                          ),
                        ),
                      ],
                    ),

                    20.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            controller.clearWorkExperienceControllers();
                            Get.back();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 12.h,
                              horizontal: 30.w,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60.r),
                              border: Border.all(color: AppColors.red),
                            ),
                            child: CommonText(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.red,
                              text: AppString.cancel,
                            ),
                          ),
                        ),

                        InkWell(
                          onTap: () {
                            controller.addWorkExperienceLocally();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 12.h,
                              horizontal: 30.w,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(60.r),
                              border: Border.all(color: Colors.green),
                            ),
                            child: CommonText(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.white,
                              text: AppString.submit,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  // Show edit experience popup
  void _showEditExperiencePopup(
    CertificateAndExperienceController controller,
    int index,
    dynamic item,
  ) {
    controller.prepareWorkExperienceForEdit(item);

    showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: AppColors.white,
          content: GetBuilder<CertificateAndExperienceController>(
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
                          text: "Edit Experience",
                        ),
                        InkWell(
                          onTap: () {
                            controller.clearEditWorkExperienceControllers();
                            Get.back();
                          },
                          child: Container(
                            padding: EdgeInsets.all(3.r),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: AppColors.titleColor),
                            ),
                            child: Icon(
                              size: 12,
                              color: AppColors.titleColor,
                              Icons.clear,
                            ),
                          ),
                        ),
                      ],
                    ),
                    12.height,

                    CommonTextField(
                      hintText: AppString.position,
                      controller: controller.editPositionController,
                      borderColor: AppColors.normalGray2,
                    ),
                    8.height,

                    CommonTextField(
                      hintText: AppString.company,
                      controller: controller.editCompanyController,
                      borderColor: AppColors.normalGray2,
                    ),
                    8.height,

                    CommonTextField(
                      hintText: AppString.location,
                      controller: controller.editLocationController,
                      borderColor: AppColors.normalGray2,
                    ),
                    8.height,

                    Row(
                      children: [
                        Expanded(
                          child: CommonTextField(
                            suffixIcon: InkWell(
                              onTap: () {
                                OtherHelper.openDatePickerDialog(
                                  controller.editStartDateController,
                                );
                              },
                              child: Icon(Icons.calendar_month, color: AppColors.bodyClr),
                            ),
                            hintText: AppString.startDate,
                            controller: controller.editStartDateController,
                            borderColor: AppColors.normalGray2,
                          ),
                        ),
                        7.width,
                        Expanded(
                          child: CommonTextField(
                            suffixIcon: InkWell(
                              onTap: () {
                                OtherHelper.openDatePickerDialog(
                                  controller.editEndDateController,
                                );
                              },
                              child: Icon(Icons.calendar_month, color: AppColors.bodyClr),
                            ),
                            hintText: AppString.endDate,
                            controller: controller.editEndDateController,
                            borderColor: AppColors.normalGray2,
                          ),
                        ),
                      ],
                    ),

                    20.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            controller.clearEditWorkExperienceControllers();
                            Get.back();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 12.h,
                              horizontal: 30.w,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60.r),
                              border: Border.all(color: AppColors.red),
                            ),
                            child: CommonText(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.red,
                              text: AppString.cancel,
                            ),
                          ),
                        ),

                        InkWell(
                          onTap: () {
                            controller.editWorkExperienceLocally(index);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 12.h,
                              horizontal: 30.w,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(60.r),
                              border: Border.all(color: Colors.green),
                            ),
                            child: CommonText(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.white,
                              text: "Update",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  // Show delete experience confirmation
  void _showDeleteExperienceConfirmation(
    CertificateAndExperienceController controller,
    int index,
  ) {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: AppColors.white,
          title: CommonText(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.titleColor,
            text: "Delete Work Experience",
          ),
          content: CommonText(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.bodyClr,
            text: "Are you sure you want to delete this work experience?",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: CommonText(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.bodyClr,
                text: "Cancel",
              ),
            ),
            TextButton(
              onPressed: () {
                controller.removeWorkExperienceLocally(index);
                Get.back();
              },
              child: CommonText(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.red,
                text: "Delete",
              ),
            ),
          ],
        );
      },
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:mother_care/component/other_widgets/no_data.dart';
// import 'package:mother_care/component/text/common_text.dart';
// import 'package:mother_care/component/text_field/common_text_field.dart';
// import 'package:mother_care/features/another_screens/nunny_profile_screens/presentation/controller/certificate_and_experience_controller.dart';
// import 'package:mother_care/features/another_screens/nunny_profile_screens/presentation/widgets/add_experience_popup.dart';
// import 'package:mother_care/utils/constants/app_colors.dart';
// import 'package:mother_care/utils/constants/app_string.dart';
// import 'package:mother_care/utils/extensions/extension.dart';

// class ExperienceSection extends StatelessWidget {
//   const ExperienceSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder(
//       init: CertificateAndExperienceController(),
//       builder: (controller) {
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             20.height,
//             CommonText(
//               fontSize: 16,
//               fontWeight: FontWeight.w600,
//               text: AppString.yearsOfExperience,
//             ),
//             6.height,

//             CommonTextField(
//               keyboardType: TextInputType.none,

//               controller: controller.experienceController,
//               suffixIcon: Padding(
//                 padding: EdgeInsets.symmetric(vertical: 5.h),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     InkWell(
//                       onTap: () {
//                         controller.addExperience();
//                       },
//                       child: Icon(size: 20.sp, Icons.keyboard_arrow_up),
//                     ),
//                     InkWell(
//                       onTap: () {
//                         controller.minasExperience();
//                       },
//                       child: Icon(size: 20.sp, Icons.keyboard_arrow_down),
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             20.height,

//             Row(
//               children: [
//                 CommonText(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w600,
//                   text: AppString.workExperience,
//                 ),
//                 Spacer(),

//                 InkWell(
//                   onTap: () {
//                     AddExperiencePopUp.addExperiencePopUp();
//                   },
//                   child: Row(
//                     children: [
//                       Icon(size: 20, Icons.add, color: AppColors.primaryColor),

//                       CommonText(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w600,
//                         color: AppColors.primaryColor,
//                         text: AppString.add,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             10.height,

//             controller.workExperienceList.isEmpty
//                 ? NoData()
//                 : ListView.builder(
//                     padding: EdgeInsets.zero,
//                     physics: NeverScrollableScrollPhysics(),
//                     shrinkWrap: true,

//                     itemCount: controller.workExperienceList.length,
//                     itemBuilder: (context, index) {
//                       var item = controller.workExperienceList[index];
//                       return Container(
//                         margin: EdgeInsets.symmetric(vertical: 5.h),
//                         width: double.infinity,
//                         padding: EdgeInsets.all(12.r),
//                         decoration: BoxDecoration(
//                           color: AppColors.white,
//                           border: Border.all(color: AppColors.textFiledColor),
//                           borderRadius: BorderRadius.circular(12.r),
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               children: [
//                                 Expanded(
//                                   child: CommonText(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w600,
//                                     text: item["position"],
//                                   ),
//                                 ),

//                                 Spacer(),
//                                 Icon(size: 18.sp, Icons.edit, color: AppColors.bodyClr),
//                                 5.width,
//                                 InkWell(
//                                   onTap: () {
//                                     controller.removeWorkExperience(index);
//                                   },
//                                   child: Icon(
//                                     size: 18.sp,
//                                     Icons.delete,
//                                     color: AppColors.red,
//                                   ),
//                                 ),
//                               ],
//                             ),

//                             6.height,

//                             Row(
//                               children: [
//                                 Container(
//                                   decoration: BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     color: AppColors.bodyClr,
//                                   ),
//                                   width: 5.h,
//                                   height: 5.h,
//                                 ),

//                                 CommonText(
//                                   fontSize: 12,
//                                   color: AppColors.bodyClr,
//                                   left: 4,
//                                   fontWeight: FontWeight.w400,
//                                   text: "${item["company"]}, ${item["location"]}",
//                                 ),
//                               ],
//                             ),

//                             6.height,

//                             Row(
//                               children: [
//                                 Container(
//                                   decoration: BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     color: AppColors.bodyClr,
//                                   ),
//                                   width: 5.h,
//                                   height: 5.h,
//                                 ),

//                                 CommonText(
//                                   fontSize: 12,
//                                   color: AppColors.bodyClr,
//                                   left: 4,
//                                   fontWeight: FontWeight.w400,
//                                   text: "${item["startDate"]} - ${item["endDate"]}",
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   ),

//             30.height,
//           ],
//         );
//       },
//     );
//   }
// }
