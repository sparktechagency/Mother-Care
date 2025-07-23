import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mother_care/component/image/common_image.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/component/text_field/common_text_field.dart';
import 'package:mother_care/config/route/app_routes.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import 'package:mother_care/utils/constants/app_images.dart';
import 'package:mother_care/utils/constants/app_string.dart';
import 'package:mother_care/utils/extensions/extension.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 220.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.bgHome),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.white,
                        ),
                        child: CircleAvatar(
                          radius: 24,
                          backgroundImage: AssetImage(AppImages.female),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonText(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.white,
                            text: "Welcome Home, Mama",
                          ),

                          Row(
                            children: [
                              CommonText(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: AppColors.white,
                                text: "Dugbe, Ibadan",
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.white70,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: (){
                      Get.toNamed(AppRoutes.notifications);
                    },                    child: CommonImage(
                      height: 24,
                      width: 24,
                      imageSrc: AppImages.notificationIcon,
                    ),
                  ),
                ],
              ),

              22.height,

              /// Search Box
              CommonTextField(
                suffixIcon: Container(
                  margin: EdgeInsets.only(right: 10.w, top: 6.h, bottom: 6.h),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.title2
                  ),
                  child: Icon(Icons.search, color: AppColors.white,),
                ),
                  hintText: AppString.searchForNanniesNearYou,
                  borderRadius: 45),
            ],
          ),
        ),
      ),
    );
  }
}
