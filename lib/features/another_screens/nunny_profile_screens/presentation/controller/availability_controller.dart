import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AvailabilityController extends GetxController{
  var daysOfWeek = [
    {"day": "Sunday", "isOn": false},
    {"day": "Monday", "isOn": false},
    {"day": "Tuesday", "isOn": false},
    {"day": "Wednesday", "isOn": false},
    {"day": "Thursday", "isOn": false},
    {"day": "Friday", "isOn": false},
    {"day": "Saturday", "isOn": false},
  ];
  String currentTime = "";
  List<String> get timesList {
    List<String> times = [];
    for (int hour = 1; hour <= 24; hour++) {

      if(hour<12){
        times.add("${hour} AM");
      }else{
       // times.add("${hour} PM");
      }


    }
    return times;
  }

  void update12HourTime() {
    currentTime = DateFormat('h:mm a').format(DateTime.now());
    update();  // Update the UI
  }


  void toggleSwitch(int index) {
    if (daysOfWeek[index]["isOn"] is bool) {
      daysOfWeek[index]["isOn"] = !(daysOfWeek[index]["isOn"] as bool);
      update();
    }
  }
}