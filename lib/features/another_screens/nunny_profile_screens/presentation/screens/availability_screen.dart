import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mother_care/component/button/common_button.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/component/text_field/common_text_field.dart';
import 'package:mother_care/features/another_screens/nunny_profile_screens/presentation/controller/availability_controller.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import 'package:mother_care/utils/constants/app_string.dart';
import 'package:mother_care/utils/extensions/extension.dart';

class ServiceAvailabilityScreen extends StatelessWidget {
  const ServiceAvailabilityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CommonText(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          text: AppString.setYourAvailability,
        ),
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios, size: 23.sp),
        ),
      ),
      body: GetBuilder(
        init: AvailabilityController(),
        builder: (controller) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,

                    itemCount: controller.daysOfWeek.length,
                    itemBuilder: (context, index) {
                      var item = controller.daysOfWeek[index];
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 8.h),
                        width: double.infinity,
                        padding: EdgeInsets.all(12.r),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.normalGray2),
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CommonText(
                                  fontSize: 14,
                                  right: 10,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.titleColor,
                                  text: AppString.monday,
                                ),

                                SizedBox(
                                  height: 20.h,
                                  width: 48.w,
                                  child: Switch(
                                    activeColor: Colors.green,
                                    value: item["isOn"] as bool,
                                    onChanged: (val) {
                                      controller.toggleSwitch(index);
                                    },
                                  ),
                                ),

                                Spacer(),

                                CommonText(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: item["isOn"] as bool
                                      ? Colors.green
                                      : AppColors.red,
                                  text: item["isOn"] as bool
                                      ? "Available"
                                      : "Closed",
                                ),
                              ],
                            ),
                            if (item["isOn"] as bool) 10.height,
                            if (item["isOn"] as bool)
                              Row(
                                children: [
                                  Icon(size: 20.sp, Icons.watch_later_outlined),

                                  8.width,

                                  Expanded(
                                    child: CommonTextField(
                                      hintText: AppString.startTime,
                                      paddingVertical: 0,
                                      suffixIcon: PopupMenuButton(
                                        icon: Icon(Icons.keyboard_arrow_down),
                                        color: AppColors.white,
                                        itemBuilder: (context) {
                                          return controller.timesList.map((
                                            time,
                                          ) {
                                            return PopupMenuItem(
                                              value: time,
                                              child: CommonText(text: time),
                                            );
                                          }).toList();
                                        },
                                      ),

                                      borderColor: AppColors.normalGray2,
                                    ),
                                  ),
                                  
                                  CommonText(
                                      left: 7,
                                      right: 7,
                                      text: "to"),

                                  Expanded(
                                    child: CommonTextField(
                                      hintText: AppString.startTime,
                                      paddingVertical: 0,
                                      suffixIcon: PopupMenuButton(
                                        icon: Icon(Icons.keyboard_arrow_down),
                                        color: AppColors.white,
                                        itemBuilder: (context) {
                                          return controller.timesList.map((
                                              time,
                                              ) {
                                            return PopupMenuItem(
                                              value: time,
                                              child: CommonText(text: time),
                                            );
                                          }).toList();
                                        },
                                      ),

                                      borderColor: AppColors.normalGray2,
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      );
                    },
                  ),

                  32.height,
                  
                  CommonButton(
                      buttonRadius: 60,
                      titleText: AppString.saveAvailability)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
