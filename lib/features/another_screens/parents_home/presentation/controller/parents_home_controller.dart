import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mother_care/utils/constants/app_images.dart';

class ParentsHomeController extends GetxController{

  final CarouselSliderController carouselController = CarouselSliderController();

  int sliderIndex=0;

  updateSliderIndex(int index){
    sliderIndex=index;
    update();
  }
  List sliderImageList=[
    AppImages.sliderOne,
    AppImages.sliderTwo,
    AppImages.sliderThree,
  ];
}