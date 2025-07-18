import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/features/another_screens/nunny_dettails/presentation/controller/nunny_details_controller.dart';
import 'package:mother_care/features/another_screens/nunny_dettails/presentation/widgets/about_section.dart';
import 'package:mother_care/features/another_screens/nunny_dettails/presentation/widgets/availability_section.dart';
import 'package:mother_care/features/another_screens/nunny_dettails/presentation/widgets/gallery_section.dart';
import 'package:mother_care/features/another_screens/nunny_dettails/presentation/widgets/review_section.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import 'package:mother_care/utils/constants/app_string.dart';
import 'package:mother_care/utils/extensions/extension.dart';

class NunnyOtherDetails extends StatelessWidget {
  const NunnyOtherDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: NunnyDetailsController(),
      builder: (controller) {
        return Column(
          children: [
            12.height,

            CommonText(
              maxLines: 40,
              fontSize: 12,
              textAlign: TextAlign.start,
              fontWeight: FontWeight.w400,
              text:
                  "Hello! I’m Tandiwe Amina, a warm-hearted and dependable nanny from Nairobi with over 6 years of experience caring for children aged 6 months to 10 year",
            ),

            20.height,

            Container(
              height: 1,
              width: double.infinity,
              color: AppColors.normalGray2,
            ),

            8.height,

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    CommonText(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      text: "35",
                    ),

                    CommonText(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      text: "Yrs old",
                    ),
                  ],
                ),

                Column(
                  children: [
                    CommonText(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      text: "06Y",
                    ),

                    CommonText(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      text: "Experience",
                    ),
                  ],
                ),
                Column(
                  children: [
                    CommonText(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      text: "\$15/hr",
                    ),

                    CommonText(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      text: "Hourly Rate",
                    ),
                  ],
                ),

                Column(
                  children: [
                    Row(
                      children: [
                        CommonText(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          text: "4.8",
                        ),
                        Icon(size: 20.sp, Icons.star, color: Colors.amber),
                      ],
                    ),

                    CommonText(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      text: "Ratings",
                    ),
                  ],
                ),
              ],
            ),

            8.height,

            Container(
              height: 1,
              width: double.infinity,
              color: AppColors.normalGray2,
            ),

            16.height,

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 100.w,
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            controller.updateIndex(0);
                          },
                          child: CommonText(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            text: "About",
                          ),
                        ),

                        6.height,
                        controller.selectedIndex == 0
                            ? Container(
                                width: 100,
                                height: 5,
                                decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(6.r),
                                    topRight: Radius.circular(6.r),
                                  ),
                                ),
                              )
                            : SizedBox(),
                      ],
                    ),
                  ),

                  SizedBox(
                    width: 100.w,
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            controller.updateIndex(1);
                          },
                          child: CommonText(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            text: AppString.availability,
                          ),
                        ),

                        6.height,
                        controller.selectedIndex == 1
                            ? Container(
                                width: 100,
                                height: 5,
                                decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(6.r),
                                    topRight: Radius.circular(6.r),
                                  ),
                                ),
                              )
                            : SizedBox(),
                      ],
                    ),
                  ),

                  SizedBox(
                    width: 100.w,
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            controller.updateIndex(2);
                          },
                          child: CommonText(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            text: AppString.gallery,
                          ),
                        ),

                        6.height,
                        controller.selectedIndex == 2
                            ? Container(
                                width: 100,
                                height: 5,
                                decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(6.r),
                                    topRight: Radius.circular(6.r),
                                  ),
                                ),
                              )
                            : SizedBox(),
                      ],
                    ),
                  ),

                  SizedBox(
                    width: 100.w,
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            controller.updateIndex(3);
                          },
                          child: CommonText(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            text: AppString.reviews,
                          ),
                        ),

                        6.height,
                        controller.selectedIndex == 3
                            ? Container(
                                width: 100.w,
                                height: 5,
                                decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(6.r),
                                    topRight: Radius.circular(6.r),
                                  ),
                                ),
                              )
                            : SizedBox(),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            controller.selectedIndex == 0
                ? AboutSection()
                : controller.selectedIndex == 1
                ? AvailabilitySection()
                : controller.selectedIndex == 2
                ? GallerySection()
                : ReviewSection(),
          ],
        );
      },
    );
  }
}
