import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mother_care/component/image/common_image.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/utils/constants/app_images.dart';
import 'package:mother_care/utils/extensions/extension.dart';

class GallerySection extends StatelessWidget {
  const GallerySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        15.height,
        GridView.builder(
          itemCount: 14,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            mainAxisExtent: 120.h,

          ),
          itemBuilder: (context, index) {
            return CommonImage(
                width: 111,
                height:120 ,
                fill: BoxFit.cover,
                imageSrc: AppImages.female);
          },
        ),
      ],
    );
  }
}
