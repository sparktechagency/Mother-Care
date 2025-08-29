import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/features/another_screens/parents_home/presentation/controller/nanny_see_all_controller.dart';
import 'package:mother_care/features/another_screens/parents_home/presentation/widgets/filter_dialog_box.dart';
import 'package:mother_care/features/another_screens/parents_home/presentation/widgets/nunny_item_for_see_all.dart';
import 'package:mother_care/features/another_screens/parents_home/presentation/widgets/sort_dialog_box.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import 'package:mother_care/utils/constants/app_string.dart';
import 'package:mother_care/utils/extensions/extension.dart';

class NunnySeeAllScreen extends StatelessWidget {
  const NunnySeeAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: AppColors.transparent,
        shadowColor: AppColors.transparent,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(size: 20.sp, Icons.arrow_back_ios),
        ),
        title: CommonText(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          text: AppString.nannyNearYou,
        ),
      ),

      body: GetBuilder(
        init: NannySeeAllController(),
        builder: (controller) {
          return Column(
            children: [
              5.height,

              Row(
                children: [
                  // Filter Button
                  Expanded(
                    child: Material(
                      color: AppColors.normalGray,
                      child: InkWell(
                        onTap: () {
                          userFilterDialogBox(controller);
                          log("Clicked");
                        },
                        child: SizedBox(
                          height: 44.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                size: 18.sp,
                                Icons.filter_alt_outlined,
                                color: AppColors.bodyClr,
                              ),

                              CommonText(
                                left: 5,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                text: AppString.filter,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(height: 44, width: 2, color: AppColors.normalGray2),
                  // Sort Button
                  Expanded(
                    child: Material(
                      color: AppColors.normalGray,
                      child: InkWell(
                        onTap: () {
                            sortDialogBox(controller);
                          log("Clicked");
                        },
                        child: SizedBox(
                          height: 44.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                size: 18.sp,
                                Icons.sort,
                                color: AppColors.bodyClr,
                              ),

                              CommonText(
                                left: 5,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                text: AppString.sort,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // ==========================list section=============================
              10.height,

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child:
                      controller.isLoading
                          ? Center(
                            child: CircularProgressIndicator(
                              color: Colors.black,
                            ),
                          )
                          : ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: controller.nannySeeAllList.length,

                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              var item = controller.nannySeeAllList[index];
                              return NunnyItemForSeeAll(
                                item: item,
                                controller: controller,
                              );
                            },
                          ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
