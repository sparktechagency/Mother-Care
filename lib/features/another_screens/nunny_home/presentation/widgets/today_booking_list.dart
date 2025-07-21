
import 'package:flutter/material.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/features/another_screens/nunny_home/presentation/widgets/today_booking_item.dart';
import 'package:mother_care/utils/constants/app_string.dart';
import 'package:mother_care/utils/extensions/extension.dart';

class TodayBookingList extends StatelessWidget {
  const TodayBookingList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        17.height,
        
        CommonText(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            text: AppString.todaysBooking).start,
        5.height,


        ListView.builder(
          padding: EdgeInsets.zero,
            itemCount: 2,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,

            itemBuilder: (context, index){
          return TodayBookingItem();
        })
      ],
    );
  }
}
