import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mother_care/features/another_screens/parent_booking/presentation/controllers/parent_booking_controller.dart';

import 'booking_item.dart';

class MyBookingListSection extends StatelessWidget {
  const MyBookingListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ParentBookingController(),
      builder: (controller) {
        return ListView.builder(
            itemCount: 10,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,

            itemBuilder: (context, index){
              return BookingItem(status: controller.selectedBookingType,);

        });
      }
    );
  }
}
