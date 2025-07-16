import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controller/parents_home_controller.dart';
import 'carousel_dot_indecator.dart';

class CarouselSliderSection extends StatelessWidget {
  const CarouselSliderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ParentsHomeController(),
        builder: (controller){
      return Stack(
        children: [
          CarouselSlider(
            items: controller.sliderImageList.map((imgPath) {
              return Container(
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage(imgPath),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }).toList(),
            carouselController:controller.carouselController ,
            options: CarouselOptions(
              height: 170.h,
              autoPlay: true,
              viewportFraction: 1.0,
              onPageChanged: (index, reason) {
                controller.updateSliderIndex(index);
              },
            ),

          ),

          Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: CarouselDotIndicator(selectIndex: controller.sliderIndex))
        ],
      );
    });
  }
}
