import 'package:get/get.dart';

class NunnyBookingController extends GetxController{
  String bookingType="";
  static NunnyBookingController get instance=>Get.put(NunnyBookingController());
  updateBookingType({String type=""}){
    bookingType=type;
    update();

  }
}