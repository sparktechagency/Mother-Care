import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mother_care/component/image/common_image.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/component/text_field/common_text_field.dart';
import 'package:mother_care/config/route/app_routes.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import 'package:mother_care/utils/constants/app_images.dart';
import 'package:mother_care/utils/constants/app_string.dart';
import 'package:mother_care/utils/extensions/extension.dart';

class NunnyAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 150.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.nunnyHomeBg),
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

              10.height,
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
                            text: "Welcome Home, Nanny",
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
                    },
                    child: CommonImage(
                      height: 24,
                      width: 24,
                      imageSrc: AppImages.notificationIcon,
                    ),
                  ),
                ],
              ),


            ],
          ),
        ),
      ),
    );
  }
}
