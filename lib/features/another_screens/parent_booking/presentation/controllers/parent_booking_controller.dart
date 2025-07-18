import 'package:get/get.dart';

class ParentBookingController extends GetxController{
  String selectedBookingType="Upcoming";

  updateBookingType(String type){
    selectedBookingType=type;
    update();

  }
}