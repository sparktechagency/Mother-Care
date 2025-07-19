import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mother_care/utils/extensions/extension.dart';

import '../../../../component/image/common_image.dart';
import '../../../../component/other_widgets/item.dart';
import '../../../../component/pop_up/common_pop_menu.dart';
import '../../../../component/text/common_text.dart';
import '../../../../config/route/app_routes.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_images.dart';
import '../../../../utils/constants/app_string.dart';

class ProfileAllItem extends StatelessWidget {
  const ProfileAllItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Container(
          padding: EdgeInsets.symmetric(
              vertical: 10.h,
              horizontal: 12.w),
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12.r)
          ),
          child: Column(
            children: [
              /// Edit Profile item here
              Item(
                iconColor: AppColors.primaryColor,
                icon: Icons.person_outline_sharp,
                title: AppString.editProfile,
                onTap: () => Get.toNamed(AppRoutes.editProfile),
              ),

              17.height,
              Item(
                iconColor: AppColors.primaryColor,
                icon: Icons.child_care_outlined,
                title: AppString.childrenDetails,
                onTap: () => Get.toNamed(AppRoutes.children),
              ),


            ],
          ),
        ),

        16.height,

        Container(
          padding: EdgeInsets.symmetric(
              vertical: 10.h,
              horizontal: 12.w),
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12.r)
          ),
          child: Column(
            children: [
              /// Edit Profile item here
              Item(
                iconColor: AppColors.primaryColor,
                icon: Icons.lock_outline_rounded,
                title: AppString.changePassword,
                onTap: () => Get.toNamed(AppRoutes.changePassword),
              ),

              17.height,
              Item(
                iconColor: AppColors.primaryColor,
                icon: Icons.notifications_active_outlined,
                title: AppString.notifications,
                onTap: () => Get.toNamed(AppRoutes.editProfile),
              ),

              17.height,
              Item(
                iconColor: AppColors.primaryColor,
                icon: Icons.support,
                title: AppString.helpSupports,
                onTap: () => Get.toNamed(AppRoutes.editProfile),
              ),


            ],
          ),
        ),


        16.height,

        Container(
          padding: EdgeInsets.symmetric(
              vertical: 10.h,
              horizontal: 12.w),
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12.r)
          ),
          child: Column(
            children: [
              /// Edit Profile item here
              Item(
                iconColor: AppColors.primaryColor,
                icon: Icons.privacy_tip_outlined,
                title: AppString.privacyPolicy,
                onTap: () => Get.toNamed(AppRoutes.privacyPolicy),
              ),

              17.height,
              Item(
                iconColor: AppColors.primaryColor,
                image: AppImages.privacyPolicy,
                title: AppString.termsOfServices
                ,
                onTap: () => Get.toNamed(AppRoutes.termsOfServices),
              ),

              17.height,
              Item(
                iconColor: AppColors.primaryColor,
                image: AppImages.aboutUs,
                title: AppString.aboutUs,
                onTap: () => Get.toNamed(AppRoutes.editProfile),
              ),


            ],
          ),
        ),

        16.height,
        Container(
          padding: EdgeInsets.symmetric(
              vertical: 10.h,
              horizontal: 12.w),
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12.r)
          ),
          child: Column(
            children: [

              Item(
                iconColor: AppColors.primaryColor,
                icon: Icons.logout,
                title: AppString.logOut,
                onTap: () => logOutPopUp,
              ),


            ],
          ),
        ),

        30.height
      ],
    );
  }
}
