
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mother_care/utils/extensions/extension.dart';

import '../../../../../component/image/common_image.dart';
import '../../../../../component/text/common_text.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_images.dart';

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





        ],
      ),
    );
  }
}
