import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mother_care/utils/extensions/extension.dart';

import '../../../../../component/text/common_text.dart';
import '../../../../../component/text_field/common_text_field.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_string.dart';
import '../controller/request_booking_controller.dart';

class CustomType extends StatelessWidget {
  const CustomType({super.key});

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
              controller: controller.chooseDateController,
              suffixIcon: InkWell(
                onTap: () {
                  controller.getDateFromCalendar();
                },
                child: Icon(Icons.calendar_month),
              ),
              hintText: "DD/MM/YYYY",
            ),





          ],
        );
      },
    );
  }
}
