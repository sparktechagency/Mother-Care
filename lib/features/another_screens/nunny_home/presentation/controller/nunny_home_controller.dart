
import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/app_images.dart';

class NunnyHomeController extends GetxController{
  var isAvailableSwitched = false;
  final CarouselSliderController carouselController = CarouselSliderController();

  int sliderIndex=0;



  updateSliderIndex(int index){
    sliderIndex=index;
    update();
  }
  void toggleAvailableSwitch(bool value) {
    isAvailableSwitched = value;
    update();
  }



  List sliderImageList=[
    AppImages.sliderOne,
    AppImages.sliderTwo,
    AppImages.sliderThree,
  ];

}