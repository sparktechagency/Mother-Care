import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mother_care/component/image/common_image.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/features/another_screens/nunny_dettails_by_parents/presentation/controller/nunny_details_controller.dart';
import 'package:mother_care/features/another_screens/nunny_dettails_by_parents/presentation/model/nanny_details_model.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import 'package:mother_care/utils/constants/app_images.dart';
import 'package:mother_care/utils/constants/app_string.dart';
import 'package:mother_care/utils/extensions/extension.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key, required this.controller});
  final NunnyDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        20.height,

        Row(
          children: [
            CommonImage(height: 16, width: 16, imageSrc: AppImages.gender),

            CommonText(
              fontSize: 12,
              left: 6,
              fontWeight: FontWeight.w400,
              text: "Gender: ${controller.nannyDetailsData.gender ?? "N/A"}",
            ),
          ],
        ),
        8.height,
        Row(
          children: [
            Icon(size: 16.sp, Icons.calendar_month),

            CommonText(
              fontSize: 12,
              left: 6,
              fontWeight: FontWeight.w400,
              text:
                  "Date of Birth: ${controller.nannyDetailsData.dateOfBirth ?? "N/A"}",
            ),
          ],
        ),
        8.height,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(size: 16.sp, Icons.location_on_outlined),

            Flexible(
              child: CommonText(
                fontSize: 12,
                maxLines: 2,
                textAlign: TextAlign.start,
                left: 6,
                fontWeight: FontWeight.w400,
                text:
                    "Address: ${controller.nannyDetailsData.address ?? "N/A"}",
              ),
            ),
          ],
        ),

        20.height,

        CommonText(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          text: AppString.ageGroup,
        ),

        16.height,

        if (controller.nannyDetailsData.preferences.length != 0)
          GridView.builder(
            itemCount:
                controller
                    .nannyDetailsData
                    .preferences[0]
                    .ageGroupsYouWorkWith
                    ?.length ??
                0,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 5 / 2,
            ),

            itemBuilder: (context, index) {
              var item =
                  controller
                      .nannyDetailsData
                      .preferences[0]
                      .ageGroupsYouWorkWith?[index] ??
                  0;

              return Container(
                padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 10),
                decoration: BoxDecoration(
                  color: AppColors.gridClr,
                  borderRadius: BorderRadius.circular(32.r),
                ),
                child: Center(
                  child: CommonText(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor,
                    text: item.toString() ,
                  ),
                ),
              );
            },
          )
        else
          SizedBox(),

        5.height,

        CommonText(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          text: AppString.servicesOffered,
        ),

        2.height,
        if (controller.nannyDetailsData.preferences.length != 0)
          ListView.builder(
            itemCount:
                controller
                    .nannyDetailsData
                    .preferences[0]
                    .serviceYouOffer
                    ?.length ??
                0,

            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,

            itemBuilder: (context, index) {
              var item =
                  controller
                      .nannyDetailsData
                      .preferences[0]
                      .serviceYouOffer?[index] ??
                  0;
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    Icon(
                      size: 15.sp,
                      color: AppColors.bodyClr,
                      Icons.control_point_rounded,
                    ),
                    5.width,

                    CommonText(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.bodyClr,
                      text: item.toString() ,
                    ),
                  ],
                ),
              );
            },
          )
        else
          SizedBox(),
        CommonText(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          text: AppString.certifications,
        ),

        2.height,
        if (controller.nannyDetailsData.professionalbackgrounds.length != 0)
          ListView.builder(
            itemCount:
                controller
                    .nannyDetailsData
                    .professionalbackgrounds[0]
                    .certifications
                    ?.length ??
                0,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,

            itemBuilder: (context, index) {
              var item =
                  controller
                      .nannyDetailsData
                      .professionalbackgrounds[0]
                      .certifications?[index] ??
                  0;

              return Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    Icon(
                      size: 15.sp,
                      color: AppColors.bodyClr,
                      Icons.control_point_rounded,
                    ),
                    5.width,

                    CommonText(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.bodyClr,
                      text: item.toString() ,
                    ),
                  ],
                ),
              );
            },
          )
        else
          SizedBox(),
        CommonText(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          text: AppString.experience,
        ),

        2.height,
        if (controller.nannyDetailsData.professionalbackgrounds.length != 0)
          ListView.builder(
            itemCount:
                controller
                    .nannyDetailsData
                    .professionalbackgrounds[0]
                    .workExperience
                    ?.length ??
                0,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,

            itemBuilder: (context, index) {
              WorkExperience item =
                  controller
                      .nannyDetailsData
                      .professionalbackgrounds[0]
                      .workExperience?[index] ??
                  WorkExperience();
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      size: 15.sp,
                      color: AppColors.bodyClr,
                      Icons.mode_standby_rounded,
                    ),
                    5.width,

                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                   
                        children: [
                          Row(
                            children: [
                              Flexible(
                                child: CommonText(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.bodyClr,
                                  text: item.position ?? "N/A",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  // text: "",
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: CommonText(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.bodyClr,
                                  text:
                                      "${item.company ?? "N/A"} , ${item.location ?? "N/A"}",

                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: CommonText(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.bodyClr,
                                  text:
                                      "${item.startDate ?? "N/A"} - ${item.endDate ?? "N/A"}",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        else
          SizedBox(),
      ],
    );
  }
}
