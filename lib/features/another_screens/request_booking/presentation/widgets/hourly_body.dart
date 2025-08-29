import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/component/text_field/common_text_field.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import 'package:mother_care/utils/constants/app_string.dart';
import 'package:mother_care/utils/extensions/extension.dart';

import '../../data/model/time_slote_model.dart';
import '../controller/request_booking_controller.dart';

class HourlyBody extends StatelessWidget {
  const HourlyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: RequestBookingController(),
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                  controller.getDateFromCalendar();
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

            20.height,

            CommonText(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              text: AppString.duration,
            ),

            16.height,

            CommonTextField(
              controller: controller.durationController,
              
              suffixIcon: PopupMenuButton<String>(
                color: AppColors.white,

                icon: Icon(Icons.keyboard_arrow_down_outlined),
                onSelected: (value) {
                  controller.getDuration(value);
                },
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem<String>(
                      value: '1',
                      child: Text('1 hour'),
                    ),
                    PopupMenuItem<String>(
                      value: '2',
                      child: Text('2 hours'),
                    ),
                    PopupMenuItem<String>(
                      value: '3',
                      child: Text("3 hours"),
                    ),

                    PopupMenuItem<String>(
                      value: '4',
                      child: Text("4 hours"),
                    ),

                    PopupMenuItem<String>(
                      value: '5',
                      child: Text("5 hours"),
                    ),
                    PopupMenuItem<String>(
                      value: '6',
                      child: Text("6 hours"),
                    ),

                    PopupMenuItem<String>(
                      value: '7',
                      child: Text("7 hours"),
                    ),

                    PopupMenuItem<String>(
                      value: '8',
                      child: Text("8 hours"),
                    ),    PopupMenuItem<String>(
                      value: '9',
                      child: Text("9 hours"),
                    ),    PopupMenuItem<String>(
                      value: '10',
                      child: Text("10 hours"),
                    ),
                  ];
                },
              ),
              hintText: AppString.selectDuration,
            ),
          ],
        );
      },
    );
  }
}
