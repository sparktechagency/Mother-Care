import 'package:get/get.dart';

class NunnyDetailsController extends GetxController{

  int selectedIndex=0;

  List availability=[
    {
      "day":"Monday ",
      "time":"09:00 AM - 6:00 PM",
      "availability":true
    },

    {
      "day":"Thursday ",
      "time":"09:00 AM - 6:00 PM",
      "availability":true
    },

    {
      "day":"Wednesday ",
      "time":"09:00 AM - 6:00 PM",
      "availability":true
    },

    {
      "day":"Tuesday",
      "time":"09:00 AM - 6:00 PM",
      "availability":true
    },

    {
      "day":"Thursday ",
      "time":"09:00 AM - 6:00 PM",
      "availability":true
    },

    {
      "day":"Friday",
      "time":"09:00 AM - 6:00 PM",
      "availability":true
    },

    {
      "day":"Sunday ",
      "time":"Closed",
      "availability":false
    },


  ];


  updateIndex(int index){
    selectedIndex=index;
    update();
  }

}