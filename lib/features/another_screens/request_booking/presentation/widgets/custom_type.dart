import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mother_care/utils/extensions/extension.dart';

import '../../../../../component/text/common_text.dart';
import '../../../../../component/text_field/common_text_field.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_string.dart';
import '../controller/request_booking_controller.dart';

class CustomType extends StatelessWidget {
   CustomType({super.key});


  final RequestBookingController dateControllerState = Get.put(RequestBookingController());

   void _showDatePicker(BuildContext context) {
     showDialog(
       context: context,
       builder: (BuildContext context) {
         return Dialog(
           child: CustomCalendar(),
         );
       },
     );
   }


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
                 _showDatePicker(context);
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

class CustomCalendar extends StatelessWidget {
  final RequestBookingController dateControllerState = Get.find<RequestBookingController>();

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final firstDayOfMonth = DateTime(now.year, now.month, 1);
    final lastDayOfMonth = DateTime(now.year, now.month + 1, 0);

    final daysInMonth = List.generate(
      lastDayOfMonth.day,
          (index) => DateTime(now.year, now.month, index + 1),
    );

    return Column(
      children: [
        // Header
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_left),
              onPressed: () {
                // Handle month change to previous
              },
            ),
            Text(
              "${now.month}/${now.year}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            IconButton(
              icon: Icon(Icons.arrow_right),
              onPressed: () {
                // Handle month change to next
              },
            ),
          ],
        ),
        GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            childAspectRatio: 1.0,
          ),
          itemCount: daysInMonth.length,
          itemBuilder: (context, index) {
            final date = daysInMonth[index];
            bool isSelected = dateControllerState.isDateSelected(date);

            return GestureDetector(
              onTap: () {
                // Add or remove the date from selected list
                if (isSelected) {
                  dateControllerState.removeDate(date);
                } else {
                  dateControllerState.addDate(date);
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: isSelected ? Colors.blue : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black),
                ),
                margin: EdgeInsets.all(2),
                child: Center(
                  child: Text(
                    "${date.day}",
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
