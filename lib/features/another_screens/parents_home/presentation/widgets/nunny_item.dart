import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mother_care/component/image/common_image.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/config/route/app_routes.dart';
import 'package:mother_care/features/another_screens/parents_home/presentation/controller/parents_home_controller.dart';
import 'package:mother_care/features/another_screens/parents_home/presentation/model/nanny_model.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import 'package:mother_care/utils/constants/app_images.dart';
import 'package:mother_care/utils/extensions/extension.dart';

class NunnyItem extends StatelessWidget {
  const NunnyItem({super.key, required this.item, required this.controller});
  final NannyModel item;
  final ParentsHomeController controller;
  @override
  Widget build(BuildContext context) {
    RxBool isLoadingBookmark = false.obs;
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.nunnyDetailsScreen, arguments: item.id);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 6),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),

          color: AppColors.white,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: CircleAvatar(
                radius: 25,
                child: ClipOval(
                  child: CommonImage(
                    height: 50,
                    width: 50,
                    imageSrc: item.profileImage ?? "",
                    // imageSrc: AppImages.female
                  ),
                ),
              ),
            ),

            6.width,

            Expanded(
              flex: 4,
              child: Column(
                children: [
                  Row(
                    children: [
                      CommonText(
                        right: 4,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        text: item.name ?? "N/A",
                      ),

                      CommonImage(
                        height: 20,
                        width: 20,
                        imageSrc: AppImages.verifiedBatch,
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Icon(size: 16, Icons.location_on_outlined),

                      CommonText(
                        top: 2,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        text: item.address ?? "N/A",
                        // text: "0.31 mi away",
                      ),
                    ],
                  ),

                  2.height,

                  Row(
                    children: [
                      Icon(size: 10, color: Colors.amber, Icons.star),

                      CommonText(
                        top: 2,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        text:
                            "${item.averageRating ?? 0} (${item.totalReviews ?? 0}  Reviews)",
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Obx(
                    () => IconButton(
                      onPressed: () async {
                        if (item.isBookmark != true) {
                          item.isBookmark = await controller
                              .createBookmarkFunction(
                                item.id ?? "",
                                isLoadingBookmark,
                              );
                          controller.update();
                        } else {
                          item.isBookmark = await controller
                              .removeBookmarkFunction(
                                item.id ?? "",
                                isLoadingBookmark,
                              );
                          controller.update();
                        }
                      },
                      icon:
                          isLoadingBookmark.value
                              ? CupertinoActivityIndicator(color: Colors.black)
                              : Icon(
                                size: 24,
                                item.isBookmark == true
                                    ? Icons.bookmark
                                    : Icons.bookmark_border,
                              ),
                    ),
                  ),

                  if (item.servicerates?.length != 0)
                    CommonText(
                      top: 8,
                      fontSize: 14,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                      text: "\$${item.servicerates?[0].hourlyRate ?? 0}",
                    )
                  else
                    SizedBox(),

                  CommonText(
                    top: 4,
                    fontSize: 12,

                    fontWeight: FontWeight.w500,
                    text: "Per hour",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
