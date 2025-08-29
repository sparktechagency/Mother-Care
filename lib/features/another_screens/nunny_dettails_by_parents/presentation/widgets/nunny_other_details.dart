import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/features/another_screens/nunny_dettails_by_parents/presentation/widgets/review_section.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import 'package:mother_care/utils/constants/app_string.dart';
import 'package:mother_care/utils/extensions/extension.dart';
import 'package:mother_care/utils/time_format/time_format_for_calculate_date_for_birth.dart';
import '../controller/nunny_details_controller.dart';
import 'about_section.dart';
import 'availability_section.dart';
import 'gallery_section.dart';

class NunnyOtherDetails extends StatelessWidget {
  const NunnyOtherDetails({super.key, required this.controller});
  final NunnyDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: NunnyDetailsController(),
      builder: (controller) {
        return Column(
          children: [
            12.height,

            Row(
              children: [
                Flexible(
                  child: CommonText(
                    maxLines: 40,
                    fontSize: 12,
                    textAlign: TextAlign.start,
                    fontWeight: FontWeight.w400,
                    text: controller.nannyDetailsData.nannyAbout ?? "N/A",
                    // text:
                    //     "Hello! I’m Tandiwe Amina, a warm-hearted and dependable nanny from Nairobi with over 6 years of experience caring for children aged 6 months to 10 year",
                  ),
                ),
              ],
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
                      text: calculateAge(
                        controller.nannyDetailsData.dateOfBirth ?? "",
                      ),
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
                      text:
                          "${controller.nannyDetailsData.professionalbackgrounds?[0].totalExperienceInYears ?? 0} Years",
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
                        if (controller.nannyDetailsData.averageRating != null)
                          CommonText(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            text:
                                "${double.parse(controller.nannyDetailsData.averageRating.toString()) ?? 0}",
                          )
                        else
                          SizedBox(),
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
                ? AboutSection(controller: controller)
                : controller.selectedIndex == 1
                ? AvailabilitySection(controller: controller)
                : controller.selectedIndex == 2
                ? GallerySection(controller: controller)
                : ReviewSection(controller: controller),
          ],
        );
      },
    );
  }
}
