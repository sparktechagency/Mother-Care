import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/config/route/app_routes.dart';
import 'package:mother_care/features/another_screens/parents_home/presentation/controller/parents_home_controller.dart';
import 'package:mother_care/utils/constants/app_string.dart';
import 'package:mother_care/utils/extensions/extension.dart';

import 'nunny_item.dart';

class NunnyListSection extends StatelessWidget {
  const NunnyListSection({super.key, required this.controller});
  final ParentsHomeController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: Column(
        children: [
          15.height,
          Row(
            children: [
              CommonText(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                text: AppString.findNannyNearYou,
              ),
              Spacer(),

              InkWell(
                onTap: () {
                  Get.toNamed(AppRoutes.nunnySeeAllScreen);
                },
                child: Row(
                  children: [
                    CommonText(
                      fontSize: 12,
                      right: 5,
                      fontWeight: FontWeight.w400,
                      text: AppString.seeAll,
                    ),

                    Icon(size: 10.sp, Icons.arrow_forward_ios_rounded),
                  ],
                ),
              ),
            ],
          ),

          // ==========================list section=============================
          10.height,

          ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: controller.nannyList.length,
          //  itemCount: controller.nannyList.length <= 2 ? controller.nannyList.length : 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),

            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              var item = controller.nannyList[index];
              return NunnyItem(item: item,controller: controller);
            },
          ),
        ],
      ),
    );
  }
}
