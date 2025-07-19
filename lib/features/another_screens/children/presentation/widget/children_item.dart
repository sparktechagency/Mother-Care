import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mother_care/features/another_screens/children/presentation/widget/remove_children_popup.dart';
import 'package:mother_care/utils/extensions/extension.dart';

import '../../../../../component/image/common_image.dart';
import '../../../../../component/text/common_text.dart';
import '../../../../../config/route/app_routes.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_images.dart';
import '../../../../../utils/constants/app_string.dart';

class ChildrenItem extends StatelessWidget {
  const ChildrenItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12.r)
      ),

      child:Row(
        children: [
          Container(

            decoration: BoxDecoration(
                color: AppColors.normalGray2,
                shape: BoxShape.circle
            ),
            padding: EdgeInsets.all(2),
            child: ClipOval(
              child: CommonImage(

                  height: 56,
                  width: 56,
                  imageSrc: AppImages.female),
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
                    text: "Chinedu Okonkwo  "),

                CommonText(
                    top: 2,
                    fontSize: 12,
                    color: AppColors.bodyClr,
                    fontWeight: FontWeight.w400,
                    text: "Girl "),

                CommonText(
                    top: 2,
                    fontSize: 12,
                    color: AppColors.bodyClr,
                    fontWeight: FontWeight.w400,
                    text: "4 Years 9 Months"),
              ],
            ),
          ),




          SizedBox(
            height: 24.h,
            width: 24.w,
            child: PopupMenuButton<String>(
              color: AppColors.white,
              icon: Icon(Icons.more_vert, color: AppColors.textFiledColor),

              onSelected: (value) {
                if(value=="edit"){
                  Get.toNamed(AppRoutes.editChildrenScreen);
                }else if(value=="remove"){
                  RemoveChildrenPopUp.removeChildrenPopUp();

                }

              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem<String>(
                    value: 'edit',
                    child: Row(
                      children: [
                        Icon(
                          size: 25,
                          Icons.edit,
                          color: AppColors.textFiledColor,
                        ),
                        5.width,
                        CommonText(text: AppString.editInfo),
                      ],
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'remove',
                    child: Row(
                      children: [
                        Icon(size: 25, Icons.delete, color: AppColors.red),
                        5.width,
                        CommonText(
                          color: AppColors.red,
                          text: AppString.remove,
                        ),
                      ],
                    ),
                  ),
                ];
              },
            ),
          ),

        ],
      ),
    );
  }
}
