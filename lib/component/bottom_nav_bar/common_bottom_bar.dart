import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mother_care/component/image/common_image.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/services/storage/storage_services.dart';
import 'package:mother_care/utils/constants/app_images.dart';
import '../../config/route/app_routes.dart';
import '../../features/another_screens/nunny_booking/presentation/controller/nunny_booking_controller.dart';
import '../../utils/constants/app_colors.dart';
import '../../utils/log/app_log.dart';

class CommonBottomNavBar extends StatefulWidget {
  final int currentIndex;

  const CommonBottomNavBar({required this.currentIndex, super.key});

  @override
  State<CommonBottomNavBar> createState() => _CommonBottomNavBarState();
}

class _CommonBottomNavBarState extends State<CommonBottomNavBar> {
  var bottomNavIndex = 0;
  List<Widget> unselectedIcons = [
    CommonImage(size: 24, imageSrc: AppImages.homeInactive),
    CommonImage(size: 24, imageSrc: AppImages.bookingInactive),
    CommonImage(size: 24, imageSrc: AppImages.messageInactive),

    if (LocalStorage.myRoll == "parents")
      CommonImage(size: 24, imageSrc: AppImages.saveInactive),
    CommonImage(size: 24, imageSrc: AppImages.settingsInactive),
  ];

  List<Widget> selectedIcons = [
    CommonImage(size: 25, imageSrc: AppImages.homeActive),
    CommonImage(size: 24, imageSrc: AppImages.bookingActive),
    CommonImage(size: 24, imageSrc: AppImages.messageActive),
    if (LocalStorage.myRoll == "parents")
      CommonImage(size: 24, imageSrc: AppImages.savedActive),
    CommonImage(size: 24, imageSrc: AppImages.settingsActive),
  ];

  List<String> titleList = [
    "Home",
    "Bookings",
    "Messages",
    if (LocalStorage.myRoll == "parents") "Saved",
    "Settings",
  ];

  @override
  void initState() {
    bottomNavIndex = widget.currentIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        padding: EdgeInsets.all(12.sp),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(unselectedIcons.length, (index) {
            return GestureDetector(
              onTap: () => onTap(index),
              child: Container(
                margin: EdgeInsetsDirectional.symmetric(vertical: 12.w),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 6.h,
                        horizontal: 16.w,
                      ),

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.r),
                        color: index == bottomNavIndex
                            ? AppColors.primaryColor
                            : AppColors.transparent,
                      ),
                      child: index == bottomNavIndex
                          ? selectedIcons[index]
                          : unselectedIcons[index],
                    ),

                    CommonText(
                      fontSize: 12,
                      color: index == bottomNavIndex
                          ? AppColors.primaryColor
                          : AppColors.titleColor,
                      fontWeight: index == bottomNavIndex
                          ? FontWeight.w700
                          : FontWeight.w400,
                      top: 8,
                      text: titleList[index],
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  void onTap(int index) async {
    appLog(widget.currentIndex, source: "common bottombar");

    if (index == 0) {
      if (!(widget.currentIndex == 0)) {
        if(LocalStorage.myRoll=="parents"){
          Get.toNamed(AppRoutes.parentHomeScreen);
        }else{
          Get.toNamed(AppRoutes.nunnHomeScreen);
        }

      }
    } else if (index == 1) {
      if (!(widget.currentIndex == 1)) {
        if(LocalStorage.myRoll=="parents"){
          Get.toNamed(AppRoutes.parentBookingScreen);
        }else{

          NunnyBookingController.instance.updateBookingType(type: "history");

          Get.toNamed(AppRoutes.nunnyBookingScreen);
        }

      }
    } else if (index == 2) {
      if (!(widget.currentIndex == 2)) {
        Get.toNamed(AppRoutes.chat);
      }
    } else if (index == 3) {
      if (!(widget.currentIndex == 3)) {

        if(LocalStorage.myRoll=="parents"){
          Get.toNamed(AppRoutes.savedScreen);
        }else{
          Get.toNamed(AppRoutes.profile);
        }

      }
    } else if (index == 4) {
      if (!(widget.currentIndex == 4)) {
        Get.toNamed(AppRoutes.profile);
      }
    }
  }
}
