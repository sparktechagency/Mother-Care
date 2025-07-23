import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../request_booking/data/model/time_slote_model.dart';

class RescheduleController extends GetxController{
  TextEditingController chooseDateController=TextEditingController();

  List<TimeSlot> timeSlots = <TimeSlot>[
    TimeSlot(time: '9:00 AM', isAvailable: true, isSelected: false),
    TimeSlot(time: '10:00 AM', isAvailable: false, isSelected: false),
    TimeSlot(time: '11:00 AM', isAvailable: true, isSelected: false),
    TimeSlot(time: '12:00 PM', isAvailable: false, isSelected: false),
    TimeSlot(time: '1:00 PM', isAvailable: true, isSelected: false),
    TimeSlot(time: '2:00 PM', isAvailable: false, isSelected: false),
  ];

  void toggleSelection(int index) {
    if (timeSlots[index].isAvailable) {
      timeSlots[index].isSelected = !timeSlots[index].isSelected;
      update();
    }
  }

}