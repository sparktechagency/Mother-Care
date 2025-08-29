import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mother_care/component/other_widgets/common_loader.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/features/another_screens/nunny_profile_screens/presentation/controller/certificate_and_experience_controller.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import 'package:mother_care/utils/constants/app_string.dart';
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
            final controller = Get.find<CertificateAndExperienceController>();
            if (controller.hasUnsavedChanges()) {
              _showUnsavedChangesDialog();
            } else {
              Get.back();
            }
          },
          child: Icon(Icons.arrow_back_ios, size: 23.sp, color: AppColors.bodyClr),
        ),
      ),

      body: GetBuilder<CertificateAndExperienceController>(
        init: CertificateAndExperienceController(),
        builder: (controller) {
          return Column(
            children: [
              // Main content
              Expanded(
                child: controller.isLoading
                    ? Center(
                        child: CommonLoader(),
                      )
                    : Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AddCertificateSection(),
                              ExperienceSection(),
                              // Extra space at bottom for better scrolling
                              SizedBox(height: 100.h),
                            ],
                          ),
                        ),
                      ),
              ),

              // Bottom save button
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.bodyClr.withOpacity(0.1),
                      blurRadius: 10,
                      offset: Offset(0, -2),
                    ),
                  ],
                ),
                child: controller.isSaveLoading
                    ? Container(
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: AppColors.white,
                            strokeWidth: 2,
                          ),
                        ),
                      )
                    : InkWell(
                        onTap: () {
                          if (controller.hasUnsavedChanges()) {
                            _showSaveConfirmationDialog(controller);
                          } else {
                            Get.snackbar(
                              "No Changes",
                              "No changes to save",
                              backgroundColor: AppColors.primaryColor.withOpacity(0.1),
                              colorText: AppColors.primaryColor,
                            );
                          }
                        },
                        child: Container(
                          height: 50.h,
                          decoration: BoxDecoration(
                            color: controller.hasUnsavedChanges()
                                ? AppColors.primaryColor
                                : AppColors.primaryColor.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (controller.hasUnsavedChanges())
                                  Container(
                                    width: 8.w,
                                    height: 8.h,
                                    margin: EdgeInsets.only(right: 8.w),
                                    decoration: BoxDecoration(
                                      color: Colors.orange,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                CommonText(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.white,
                                  text: controller.hasUnsavedChanges()
                                      ? "Save Changes"
                                      : "All Saved",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
              ),
            ],
          );
        },
      ),
    );
  }

  // Show unsaved changes dialog when trying to go back
  void _showUnsavedChangesDialog() {
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
            text: "Unsaved Changes",
          ),
          content: CommonText(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.bodyClr,
            text: "You have unsaved changes. Do you want to save them before leaving?",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back(); // Close dialog
                Get.back(); // Go back to previous screen
              },
              child: CommonText(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.red,
                text: "Discard",
              ),
            ),
            TextButton(
              onPressed: () {
                Get.back(); // Close dialog
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
                Get.back(); // Close dialog
                final controller = Get.find<CertificateAndExperienceController>();
                controller.saveAllChangesToAPI().then((_) {
                  Get.back(); // Go back after saving
                });
              },
              child: CommonText(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryColor,
                text: "Save & Exit",
              ),
            ),
          ],
        );
      },
    );
  }

  // Show save confirmation dialog
  void _showSaveConfirmationDialog(CertificateAndExperienceController controller) {
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
            text: "Save Changes",
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.bodyClr,
                text: "Are you sure you want to save all changes?",
              ),
              SizedBox(height: 12.h),
              _buildChangeSummary(controller),
            ],
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
                Get.back(); // Close dialog
                controller.saveAllChangesToAPI();
              },
              child: CommonText(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryColor,
                text: "Save",
              ),
            ),
          ],
        );
      },
    );
  }

  // Build change summary for save confirmation
  Widget _buildChangeSummary(CertificateAndExperienceController controller) {
    List<String> changes = [];

    if (controller.certificatesToAdd.isNotEmpty) {
      changes.add("• ${controller.certificatesToAdd.length} certificate(s) to add");
    }
    if (controller.certificatesToEdit.isNotEmpty) {
      changes.add("• ${controller.certificatesToEdit.length} certificate(s) to edit");
    }
    if (controller.certificatesToRemove.isNotEmpty) {
      changes.add("• ${controller.certificatesToRemove.length} certificate(s) to remove");
    }
    if (controller.workExperiencesToAdd.isNotEmpty) {
      changes.add(
        "• ${controller.workExperiencesToAdd.length} work experience(s) to add",
      );
    }
    if (controller.workExperienceToEdit.isNotEmpty) {
      changes.add(
        "• ${controller.workExperienceToEdit.length} work experience(s) to edit",
      );
    }
    if (controller.workExperienceToRemove.isNotEmpty) {
      changes.add(
        "• ${controller.workExperienceToRemove.length} work experience(s) to remove",
      );
    }

    if (changes.isEmpty) {
      return SizedBox.shrink();
    }

    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.primaryColor.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryColor,
            text: "Changes to be saved:",
          ),
          SizedBox(height: 8.h),
          ...changes.map(
            (change) => Padding(
              padding: EdgeInsets.only(bottom: 2.h),
              child: CommonText(
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: AppColors.bodyClr,
                text: change,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:mother_care/component/text/common_text.dart';
// import 'package:mother_care/features/another_screens/nunny_profile_screens/presentation/controller/certificate_and_experience_controller.dart';
// import 'package:mother_care/utils/constants/app_colors.dart';
// import 'package:mother_care/utils/constants/app_string.dart';
// import '../widgets/add_certificate_section.dart';
// import '../widgets/experience_section.dart';

// class CertificationsExperienceScreen extends StatelessWidget {
//   const CertificationsExperienceScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColors.white,
//         shadowColor: AppColors.transparent,
//         surfaceTintColor: AppColors.transparent,
//         title: CommonText(
//           fontSize: 16,
//           fontWeight: FontWeight.w600,
//           text: AppString.certificationAndExperience,
//         ),
//         leading: InkWell(
//           onTap: () {
//             Get.back();
//           },
//           child: Icon(Icons.arrow_back_ios, size: 23.sp, color: AppColors.bodyClr),
//         ),
//       ),

//       body: GetBuilder(
//         init: CertificateAndExperienceController(),
//         builder: (controller) {
//           return Padding(
//             padding: EdgeInsets.symmetric(horizontal: 20.w),
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [AddCertificateSection(), ExperienceSection()],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
