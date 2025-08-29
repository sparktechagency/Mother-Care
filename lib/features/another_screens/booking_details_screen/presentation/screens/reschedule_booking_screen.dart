import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mother_care/component/button/common_button.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import 'package:mother_care/utils/constants/app_string.dart';
import 'package:mother_care/utils/extensions/extension.dart';
import 'package:mother_care/utils/helpers/other_helper.dart';

import '../../../../../component/text_field/common_text_field.dart';
import '../../../request_booking/data/model/time_slote_model.dart';
import '../controller/reschedule_controller.dart';

class RescheduleBookingScreen extends StatelessWidget {
  const RescheduleBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        shadowColor: AppColors.transparent,
        surfaceTintColor: AppColors.transparent,
        leading: InkWell(
            onTap: (){
              Get.back();
            },
            child: Icon(Icons.arrow_back_ios, size: 23.sp, color: AppColors.titleColor,)),
        title: CommonText(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            text: AppString.reschedule),
      ),

      body: GetBuilder(
        init: RescheduleController(),
        builder: (controller) {
          return Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.height,

                CommonText(
                  fontSize: 16,
                  bottom: 12,
                  fontWeight: FontWeight.w600,
                  text: AppString.chooseDate,
                ),

                CommonTextField(
                  keyboardType: TextInputType.none,
                  controller: controller.chooseDateController,
                  suffixIcon: InkWell(
                    onTap: () {
                      OtherHelper.openDatePickerDialog(controller.chooseDateController);
                    },
                    child: Icon(Icons.calendar_month),
                  ),
                  hintText: "DD/MM/YYYY",
                ),

                20.height,

                Row(
                  children: [
                    CommonText(
                      fontSize: 16,
                      color: AppColors.titleColor,
                      fontWeight: FontWeight.w600,
                      text: AppString.chooseTimeSlot,
                    ),

                    CommonText(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      text: AppString.westAfricaTimeGMT,
                    ),
                  ],
                ),

                13.height,

                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    mainAxisExtent: 48.h,
                  ),
                  itemCount: controller.timeSlots.length,

                  itemBuilder: (context, index) {
                    TimeSlot data = controller.timeSlots[index];

                    return InkWell(
                      onTap: () {
                        if (data.isAvailable) {
                          controller.toggleSelection(index);
                        }
                      },
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: data.isSelected
                                ? AppColors.primaryColor
                                : AppColors.normalGray2,
                          ),
                          color: data.isSelected
                              ? AppColors.primaryColor
                              : AppColors.white,
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CommonText(
                              fontSize: 14,
                              bottom: 1,
                              color: data.isAvailable
                                  ? (data.isSelected
                                  ? AppColors.white
                                  : AppColors.black)
                                  : AppColors.textFiledColor,
                              fontWeight: FontWeight.w400,
                              text: data.time,
                            ),

                            CommonText(
                              fontSize: 12,
                              color: data.isAvailable
                                  ? (data.isSelected
                                  ? AppColors.white
                                  : AppColors.black)
                                  : AppColors.textFiledColor,

                              fontWeight: FontWeight.w400,
                              text: data.isAvailable ? "Available" : "Booked",
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                
                7.height,
                
                CommonText(
                    fontSize: 16,
                    bottom: 11,
                    fontWeight: FontWeight.w600,
                    text: AppString.addSpecialNoteForNanny),
                CommonTextField(
                  maxline: 5,
                  borderColor: AppColors.normalGray2,
                  hintText: AppString.anySpecialInstructionsOrRequirements,
                ),
                Spacer(),

                CommonButton(titleText: "Request to reschedule Booking"),

                30.height

              ],
            ),
          );
        }
      ),
    );
  }
}
