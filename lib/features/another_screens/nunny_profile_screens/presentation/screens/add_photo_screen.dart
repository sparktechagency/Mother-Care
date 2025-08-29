import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mother_care/component/button/common_button.dart';
import 'package:mother_care/component/image/common_image.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/features/another_screens/nunny_profile_screens/presentation/controller/gallery_controller.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import 'package:mother_care/utils/constants/app_images.dart';
import 'package:mother_care/utils/constants/app_string.dart';
import 'package:mother_care/utils/extensions/extension.dart';

class AddPhotoGalleryScreen extends StatelessWidget {
  const AddPhotoGalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CommonText(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          text: AppString.addPhoto,
        ),
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.transparent,
        shadowColor: AppColors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          iconSize: 23.sp,
          onPressed: () => Get.back(),
        ),
      ),
      body: GetBuilder(
        init: GalleryController(),
        builder: (controller) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                20.height,

                SizedBox(
                  width: double.infinity,
                  height: 150.h,
                  child: InkWell(
                    onTap: () {
                      controller.getImage();
                    },
                    child: DottedBorder(
                      options: RectDottedBorderOptions(color: AppColors.primaryColor),
                      child: controller.image == null || controller.image!.isEmpty
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Icon(
                                    color: AppColors.primaryColor,
                                    size: 35.sp,
                                    Icons.add,
                                  ),
                                ),

                                CommonText(
                                  top: 7,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primaryColor,
                                  text: AppString.addPhoto,
                                ),
                              ],
                            )
                          : Image.file(
                              width: double.infinity,
                              fit: BoxFit.fill,
                              File(controller.image!),
                            ),
                    ),
                  ),
                ),

                20.height,

                Obx(
                  () => CommonButton(
                    isLoading: controller.isLoadingUpload.value,
                    onTap: () {
                      controller
                          .uploadImageFunction(); // print(controller.image.toString());
                      // Get.back();
                    },
                    buttonRadius: 60,
                    titleText: AppString.upload,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
