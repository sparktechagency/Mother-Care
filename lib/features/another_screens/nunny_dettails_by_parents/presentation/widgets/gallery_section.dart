import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mother_care/component/image/common_image.dart';
import 'package:mother_care/features/another_screens/nunny_dettails_by_parents/presentation/controller/nunny_details_controller.dart';
import 'package:mother_care/utils/constants/app_images.dart';
import 'package:mother_care/utils/extensions/extension.dart';

class GallerySection extends StatelessWidget {
  const GallerySection({super.key, required this.controller});
  final NunnyDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        15.height,

        if (controller.nannyDetailsData.galleries?.length != 0)
          GridView.builder(
            itemCount: controller.nannyDetailsData.galleries?.length ?? 0,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              mainAxisExtent: 120.h,
            ),
            itemBuilder: (context, index) {
              var item = controller.nannyDetailsData.galleries?[index];
              return Material(
                elevation: 1,

                child:
                    item?.images?.length != 0
                        ? CommonImage(
                          width: 111,
                          height: 120,
                          fill: BoxFit.cover,
                          imageSrc:
                              item?.images?[0] == ""
                                  ? AppImages.female
                                  : item?.images?[0] ?? "",
                          // imageSrc: AppImages.female
                        )
                        : SizedBox(),
              );
            },
          )
        else
          SizedBox(),
      ],
    );
  }
}
