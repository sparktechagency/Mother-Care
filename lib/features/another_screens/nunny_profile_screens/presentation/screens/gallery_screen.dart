import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mother_care/component/image/common_image.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/config/route/app_routes.dart';
import 'package:mother_care/features/another_screens/nunny_profile_screens/data/gallery_model.dart';
import 'package:mother_care/features/another_screens/nunny_profile_screens/presentation/controller/gallery_controller.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import 'package:mother_care/utils/constants/app_string.dart';
import 'package:mother_care/utils/extensions/extension.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {
              Get.toNamed(AppRoutes.addPhotoGallery);
            },
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.primaryColor),
              ),
              child: Icon(color: AppColors.primaryColor, Icons.add),
            ),
          ),

          20.width,
        ],
        title: CommonText(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          text: AppString.gallery,
        ),
        surfaceTintColor: AppColors.transparent,
        shadowColor: AppColors.transparent,
        backgroundColor: AppColors.white,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios, size: 23.sp, color: AppColors.titleColor),
        ),
      ),

      body: GetBuilder(
        init: GalleryController(),
        builder: (controller) {
          return Obx(
            () => controller.isLoading.value
                ? Center(child: CircularProgressIndicator())
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: controller.imageList.length,
                      itemBuilder: (context, index) {
                        GalleryImage item = controller.imageList[index];

                        return CommonImage(fill: BoxFit.fill, imageSrc: item.url);
                      },
                    ),
                  ),
          );
        },
      ),
    );
  }
}
