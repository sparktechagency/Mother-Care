import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mother_care/component/image/common_image.dart';
import 'package:mother_care/features/another_screens/parents_home/presentation/model/banner_model.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import '../controller/parents_home_controller.dart';

class CarouselSliderSection extends StatelessWidget {
  const CarouselSliderSection({super.key, required this.controller});
  final ParentsHomeController controller;
  @override
  Widget build(BuildContext context) {
    return Obx(
          ()=>Column(
        children: [
          Container(
            // margin: EdgeInsets.symmetric(vertical:  10),
            width: Get.width,
            height: 180,
      
            child:
                controller.isLoadingBanner.value
                    ? const Center(
                      child: CircularProgressIndicator(color: Colors.black),
                    )
                    : PageView.builder(
                      controller: controller.listOfBannerPageViewController,
                      itemCount: controller.listOfBanner.length,
                      onPageChanged: controller.onChangeListOfBanner,
                      itemBuilder: (context, index) {
                        BannerModel data = controller.listOfBanner[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Stack(
                              children: [
                                CommonImage(
                                  fill: BoxFit.fill,
                                  // imageSrc: AppImages.sliderOne,
      
                                  imageSrc: data.image ?? "",
                                  width: Get.width,
                                  height: Get.height,
                                ),
                                Container(
                                  // alignment: Alignment.,
                                  padding: EdgeInsets.only(left: 13, right: 13),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Together, We Raise the Village",
                                        //  data.name ?? "",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
      SizedBox(height: 5),
                                      Text(
                                        "MamaCare unites African families with trusted care.",
                                        //  data.description ?? "",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                          fontSize: 11,
      
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        maxLines: 2,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
          ),
          SizedBox(height: 8),
          controller.isLoadingBanner.value
                    ? const Center(
                      child: CircularProgressIndicator(color: Colors.black),
                    )
                    : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(controller.listOfBanner.length, (
                        index,
                      ) {
                        bool isActive =
                            index == controller.selectedListOfBannerIndex.value;
                        return AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          margin: EdgeInsets.symmetric(horizontal: 4.2),
                          width: isActive ? 30 : 10,
                          height: 8,
                          decoration: BoxDecoration(
                            color:
                                isActive
                                    ? AppColors.primaryColor
                                    : Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        );
                      }),
                    ),
    
          // CarouselSlider(
          //   items: controller.sliderImageList.map((imgPath) {
          //     return Container(
          //       margin: EdgeInsets.all(8),
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(15),
          //         image: DecorationImage(
          //           image: AssetImage(imgPath),
          //           fit: BoxFit.cover,
          //         ),
          //       ),
          //     );
          //   }).toList(),
          //   carouselController:controller.carouselController ,
          //   options: CarouselOptions(
          //     height: 170.h,
          //     autoPlay: true,
          //     viewportFraction: 1.0,
          //     onPageChanged: (index, reason) {
          //       controller.updateSliderIndex(index);
          //     },
          //   ),
      
          // ),
      
          // Positioned(
          //     bottom: 10,
          //     left: 0,
          //     right: 0,
          // child: CarouselDotIndicator(selectIndex: controller.sliderIndex))
        ],
      ),
    );
  }
}
