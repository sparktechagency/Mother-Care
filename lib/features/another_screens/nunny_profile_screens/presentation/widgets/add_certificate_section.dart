import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mother_care/features/another_screens/nunny_profile_screens/presentation/controller/certificate_and_experience_controller.dart';
import 'package:mother_care/utils/extensions/extension.dart';

import '../../../../../component/other_widgets/no_data.dart';
import '../../../../../component/text/common_text.dart';
import '../../../../../component/text_field/common_text_field.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_string.dart';

class AddCertificateSection extends StatelessWidget {
  const AddCertificateSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CertificateAndExperienceController>(
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonText(
              top: 16,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              bottom: 12,
              text: AppString.addCertificate,
            ),
            Row(
              children: [
                Expanded(
                  child: CommonTextField(
                    mexLength: 80,
                    controller: controller.addCertificateAndExperienceController,
                    hintText: AppString.enterCertifications,
                    borderColor: AppColors.normalGray,
                  ),
                ),
                12.width,
                InkWell(
                  onTap: () {
                    controller.addCertificateLocally();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 12.h),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: CommonText(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                      text: AppString.add,
                    ),
                  ),
                ),
              ],
            ),
            16.height,
            controller.isLoading
                ? Center(
                    child: Padding(
                      padding: EdgeInsets.all(20.h),
                      child: CircularProgressIndicator(color: AppColors.primaryColor),
                    ),
                  )
                : controller.certificateList.isEmpty
                ? Padding(padding: const EdgeInsets.only(top: 30), child: NoData())
                : ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.certificateList.length,
                    itemBuilder: (context, index) {
                      String certificate = controller.certificateList[index];

                      bool isNewItem = controller.certificatesToAdd.contains(certificate);
                      bool isEditedItem = controller.certificatesToEdit.containsValue(
                        certificate,
                      );

                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 6.h),
                        padding: EdgeInsets.all(15.r),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          border: Border.all(
                            color: isNewItem || isEditedItem
                                ? AppColors.primaryColor.withOpacity(0.3)
                                : AppColors.normalGray2,
                            width: isNewItem || isEditedItem ? 1.5 : 1,
                          ),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Row(
                          children: [
                            if (isNewItem || isEditedItem)
                              Container(
                                width: 4.w,
                                height: 20.h,
                                margin: EdgeInsets.only(right: 12.w),
                                decoration: BoxDecoration(
                                  color: isNewItem ? Colors.green : Colors.orange,
                                  borderRadius: BorderRadius.circular(2.r),
                                ),
                              ),
                            Expanded(
                              child: CommonText(
                                maxLines: 2,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                textAlign: TextAlign.start,
                                color: AppColors.bodyClr,
                                text: certificate,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                _showEditCertificateDialog(controller, index);
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
                            5.width,
                            InkWell(
                              onTap: () {
                                _showDeleteConfirmation(controller, index);
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
                      );
                    },
                  ),
          ],
        );
      },
    );
  }

  void _showEditCertificateDialog(
    CertificateAndExperienceController controller,
    int index,
  ) {
    String currentCertificate = controller.certificateList[index];
    controller.editCertificateController.text = currentCertificate;

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
            text: "Edit Certificate",
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CommonTextField(
                controller: controller.editCertificateController,
                hintText: "Enter certificate name",
                borderColor: AppColors.normalGray2,
                mexLength: 80,
              ),
              20.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      controller.editCertificateController.clear();
                      Get.back();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60.r),
                        border: Border.all(color: AppColors.red),
                      ),
                      child: CommonText(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.red,
                        text: "Cancel",
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      controller.editCertificateLocally(index, currentCertificate);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(60.r),
                        border: Border.all(color: Colors.green),
                      ),
                      child: CommonText(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                        text: "Save",
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _showDeleteConfirmation(CertificateAndExperienceController controller, int index) {
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
            text: "Delete Certificate",
          ),
          content: CommonText(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.bodyClr,
            text: "Are you sure you want to delete this certificate?",
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
                controller.removeCertificateLocally(index);
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

// Show edit certificate dialog
void _showEditCertificateDialog(
  CertificateAndExperienceController controller,
  int index,
) {
  String currentCertificate = controller.certificateList[index];
  controller.editCertificateController.text = currentCertificate;

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
          text: "Edit Certificate",
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CommonTextField(
              controller: controller.editCertificateController,
              hintText: "Enter certificate name",
              borderColor: AppColors.normalGray2,
              mexLength: 80,
            ),
            20.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    controller.editCertificateController.clear();
                    Get.back();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60.r),
                      border: Border.all(color: AppColors.red),
                    ),
                    child: CommonText(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.red,
                      text: "Cancel",
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    controller.editCertificateLocally(index, currentCertificate);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(60.r),
                      border: Border.all(color: Colors.green),
                    ),
                    child: CommonText(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                      text: "Save",
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}

// Show delete confirmation dialog
void _showDeleteConfirmation(CertificateAndExperienceController controller, int index) {
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
          text: "Delete Certificate",
        ),
        content: CommonText(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.bodyClr,
          text: "Are you sure you want to delete this certificate?",
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
              controller.removeCertificateLocally(index);
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

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:mother_care/features/another_screens/nunny_profile_screens/presentation/controller/certificate_and_experience_controller.dart';
// import 'package:mother_care/utils/extensions/extension.dart';

// import '../../../../../component/other_widgets/no_data.dart';
// import '../../../../../component/text/common_text.dart';
// import '../../../../../component/text_field/common_text_field.dart';
// import '../../../../../utils/constants/app_colors.dart';
// import '../../../../../utils/constants/app_string.dart';

// class AddCertificateSection extends StatelessWidget {
//   const AddCertificateSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder(
//       init: CertificateAndExperienceController(),
//       builder: (controller) {
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CommonText(
//               top: 16,
//               fontSize: 16,
//               fontWeight: FontWeight.w600,
//               bottom: 12,
//               text: AppString.addCertificate,
//             ),

//             Row(
//               children: [
//                 Expanded(
//                   child: CommonTextField(
//                     mexLength: 80,
//                     controller: controller.addCertificateAndExperienceController,
//                     hintText: AppString.enterCertifications,
//                     borderColor: AppColors.normalGray,
//                   ),
//                 ),

//                 12.width,

//                 InkWell(
//                   onTap: () {
//                     controller.getCertificate();
//                   },
//                   child: Container(
//                     padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 12.h),
//                     decoration: BoxDecoration(
//                       color: AppColors.primaryColor,
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: CommonText(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w700,
//                       color: AppColors.white,
//                       text: AppString.add,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             16.height,

//             controller.certificateList.isEmpty
//                 ? Padding(padding: const EdgeInsets.only(top: 30), child: NoData())
//                 : ListView.builder(
//                     padding: EdgeInsets.zero,
//                     physics: NeverScrollableScrollPhysics(),
//                     shrinkWrap: true,
//                     itemCount: controller.certificateList.length,
//                     itemBuilder: (context, index) {
//                       return Container(
//                         margin: EdgeInsets.symmetric(vertical: 6.h),
//                         padding: EdgeInsets.all(15.r),
//                         decoration: BoxDecoration(
//                           color: AppColors.white,
//                           border: Border.all(color: AppColors.normalGray2),
//                           borderRadius: BorderRadius.circular(12.r),
//                         ),

//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Expanded(
//                               child: CommonText(
//                                 maxLines: 2,
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w400,
//                                 textAlign: TextAlign.start,
//                                 color: AppColors.bodyClr,
//                                 text: controller.certificateList[index],
//                               ),
//                             ),
//                             InkWell(
//                               onTap: () {},
//                               child: SvgPicture.asset(
//                                 'assets/icons/editIcon.svg',
//                                 height: 16.h,
//                                 width: 16.w,
//                               ),

//                               // Icon(Icons.delete, color: AppColors.red),
//                             ),
//                             SizedBox(width: 10.h),
//                             InkWell(
//                               onTap: () {
//                                 controller.removeCertificate(index);
//                               },
//                               child: SvgPicture.asset(
//                                 'assets/icons/trashIcon.svg',
//                                 height: 16.h,
//                                 width: 16.w,
//                               ),
//                               // Icon(Icons.delete, color: AppColors.red),
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//           ],
//         );
//       },
//     );
//   }
// }
