import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mother_care/config/route/app_routes.dart';
import 'package:mother_care/features/another_screens/children/presentation/controller/children_screen_controller.dart';
import 'package:mother_care/features/another_screens/children/presentation/model/children_list_model.dart';
import 'package:mother_care/utils/extensions/extension.dart';
import '../../../../../component/image/common_image.dart';
import '../../../../../component/text/common_text.dart';
import '../../../../../utils/constants/app_colors.dart';

class ChildrenItem extends StatelessWidget {
  const ChildrenItem({super.key, required this.item, required this.controller});

  final ChildrenListModel item;
  final ChildrenScreenController controller;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.addChildrenScreen, arguments: item);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12.r),
        ),

        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.normalGray2,
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(2),
              child: ClipOval(
                child: CommonImage(
                  height: 56,
                  width: 56,
                  imageSrc: item.childImage ?? "",
                  // imageSrc: AppImages.female,
                ),
              ),
            ),

            6.width,

            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    text: item.name ?? "",
                  ),

                  CommonText(
                    top: 2,
                    fontSize: 12,
                    color: AppColors.bodyClr,
                    fontWeight: FontWeight.w400,
                    text: item.gender == "MALE" ?"Boy" : "Girl" ?? "",
                  ),

                  CommonText(
                    top: 2,
                    fontSize: 12,
                    color: AppColors.bodyClr,
                    fontWeight: FontWeight.w400,
                    text: item.dateOfBirth ?? "",
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                Get.toNamed(AppRoutes.addChildrenScreen, arguments: item);
              },
              icon: Icon(Icons.edit_note_rounded, color: Colors.black),
            ),
            IconButton(
              onPressed: () {
                controller.deleteChildrenItem(item);
              },
              icon:
              controller.isLoadingDelete
                  ? CupertinoActivityIndicator(color: Colors.black)
                  : Icon(Icons.delete, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
