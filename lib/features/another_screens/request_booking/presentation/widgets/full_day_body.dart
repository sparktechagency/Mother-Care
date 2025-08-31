import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mother_care/utils/extensions/extension.dart';

import '../../../../../component/text/common_text.dart';
import '../../../../../component/text_field/common_text_field.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_string.dart';
import '../../../../../utils/helpers/other_helper.dart';
import '../controller/request_booking_controller.dart';

class FullDayBody extends StatelessWidget {
  const FullDayBody({super.key});

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
              text: AppString.startDate,
            ),

            CommonTextField(
              keyboardType: TextInputType.none,
              controller: controller.startDateController,
              suffixIcon: InkWell(
                onTap: () async{
                  await OtherHelper.openDatePickerDialog(controller.startDateController);
                },
                child: Icon(Icons.calendar_month),
              ),
              hintText: "DD/MM/YYYY",
            ),

            20.height,

            CommonText(
              fontSize: 16,
              bottom: 12,
              fontWeight: FontWeight.w600,
              text: AppString.endDate,
            ),

            CommonTextField(
              keyboardType: TextInputType.none,
              controller: controller.endDateController,
              suffixIcon: InkWell(
                onTap: () async{
                  await OtherHelper.openDatePickerDialog(controller.endDateController);
                  controller.dayCountForFullDay();
                },
                child: Icon(Icons.calendar_month),
              ),
              hintText: "DD/MM/YYYY",
            ),





            // 20.height,
            //
            // CommonText(
            //   fontSize: 16,
            //   fontWeight: FontWeight.w600,
            //   text: AppString.duration,
            // ),
            //
            // 16.height,
            //
            // CommonTextField(
            //   controller: controller.durationController,
            //
            //   suffixIcon: PopupMenuButton<String>(
            //     color: AppColors.white,
            //
            //     icon: Icon(Icons.keyboard_arrow_down_outlined),
            //     onSelected: (value) {
            //       controller.getDuration(value);
            //     },
            //     itemBuilder: (BuildContext context) {
            //       return [
            //         PopupMenuItem<String>(
            //           value: '1',
            //           child: Text('1 hour'),
            //         ),
            //         PopupMenuItem<String>(
            //           value: '2',
            //           child: Text('2 hours'),
            //         ),
            //         PopupMenuItem<String>(
            //           value: '3',
            //           child: Text("3 hours"),
            //         ),
            //
            //         PopupMenuItem<String>(
            //           value: '4',
            //           child: Text("4 hours"),
            //         ),
            //
            //         PopupMenuItem<String>(
            //           value: '5',
            //           child: Text("5 hours"),
            //         ),
            //         PopupMenuItem<String>(
            //           value: '6',
            //           child: Text("6 hours"),
            //         ),
            //
            //         PopupMenuItem<String>(
            //           value: '7',
            //           child: Text("7 hours"),
            //         ),
            //
            //         PopupMenuItem<String>(
            //           value: '8',
            //           child: Text("8 hours"),
            //         ),    PopupMenuItem<String>(
            //           value: '9',
            //           child: Text("9 hours"),
            //         ),    PopupMenuItem<String>(
            //           value: '10',
            //           child: Text("10 hours"),
            //         ),
            //       ];
            //     },
            //   ),
            //   hintText: AppString.selectDuration,
            // ),
          ],
        );
      },
    );
  }
}
