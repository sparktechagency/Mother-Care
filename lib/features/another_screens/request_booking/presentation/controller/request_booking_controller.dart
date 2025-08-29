import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mother_care/utils/helpers/other_helper.dart';

import '../../data/model/time_slote_model.dart';

class RequestBookingController extends GetxController{

  bool isBabySelect=false;
  bool isTermsSelect=false;



  TextEditingController chooseDateController=TextEditingController();
  TextEditingController durationController=TextEditingController();
  String selectedBookingType="hourly";

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

  void toggleTerms(){
    isTermsSelect=!isTermsSelect;
    update();
  }

  void getDuration(String hour){
    durationController.text=hour;
    update();
  }

  var items = List.generate(
    2,
        (index) => {
      'isSelected': false,
    },
  );

  void toggleCheckBox(int index) {
    items[index]['isSelected'] = !items[index]['isSelected']!;
    update();
  }



  getDateFromCalendar()
  async{
    await OtherHelper.openDatePickerDialog(chooseDateController);
  }

  updateBookingType(String bookingType){
    selectedBookingType=bookingType;
    update();
  }
}