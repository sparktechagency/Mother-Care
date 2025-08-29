import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mother_care/component/button/common_button.dart';
import 'package:mother_care/component/other_widgets/common_loader.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/features/another_screens/nunny_profile_screens/presentation/controller/presence_controller.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import 'package:mother_care/utils/constants/app_string.dart';
import 'package:mother_care/utils/extensions/extension.dart';

class PreferenceScreen extends StatelessWidget {
  const PreferenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CommonText(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          text: AppString.preference,
        ),
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(color: AppColors.titleColor, Icons.arrow_back_ios, size: 23.sp),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 29.w),
        child: GetBuilder(
          init: PresenceController(),
          builder: (controller) {
            return controller.isLoading?CommonLoader(): Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  top: 16,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  text: AppString.ageGroupsYouWorkWith,
                ),
                10.height,

                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.preferenceList.length,
                  itemBuilder: (context, index) {
                    var item = controller.preferenceList[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 24.h,
                            width: 24.h,
                            child: Checkbox(
                              activeColor: AppColors.primaryColor,
                              value: item.isSelected,
                              onChanged: (value) {
                                controller.togglePreference(index);
                              },
                            ),
                          ),
                          CommonText(left: 5, color: AppColors.bodyClr, text: item.title),
                        ],
                      ),
                    );
                  },
                ),

                CommonText(
                  top: 16,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  text: AppString.servicesYouOffer,
                ),
                10.height,

                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.serviceOfferList.length,
                  itemBuilder: (context, index) {
                    var item = controller.serviceOfferList[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 24.h,
                            width: 24.h,
                            child: Checkbox(
                              activeColor: AppColors.primaryColor,
                              value: item.isSelected,
                              onChanged: (value) {
                                controller.toggleOffer(index);
                              },
                            ),
                          ),
                          CommonText(left: 5, color: AppColors.bodyClr, text: item.title),
                        ],
                      ),
                    );
                  },
                ),

                30.height,

                CommonButton(
                  titleText: AppString.save,
                  onTap: () => controller.uploadPefrence(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
