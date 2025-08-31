import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mother_care/component/image/common_image.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/features/another_screens/booking_details_screen/presentation/controller/reschedule_controller.dart';
import 'package:mother_care/utils/constants/app_images.dart';
import 'package:mother_care/utils/constants/app_string.dart';
import 'package:mother_care/utils/extensions/extension.dart';

import '../../../../../utils/constants/app_colors.dart';
import 'nunny_item.dart';

class ChildrenListAndInstructionSection extends StatelessWidget {
  final RescheduleController controller;
  const ChildrenListAndInstructionSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppColors.normalGray2),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                text: "Children (${controller.singleBookingById!.childrenId.length})",
              ),
              4.height,

              ListView.builder(
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.singleBookingById!.childrenId.length,
                itemBuilder: (context, index) {
                  return NunnyChildrenItem(
                    item: controller.singleBookingById!.childrenId[index],
                    controller: controller,
                  );
                },
              ),
            ],
          ),
        ),

        20.height,
        controller.singleBookingById?.specialInstruction.trim() == ''
            ? SizedBox.shrink()
            : Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Container(
                  padding: EdgeInsets.all(16.r),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.normalGray2),
                    borderRadius: BorderRadius.circular(12.r),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              CommonImage(
                                height: 24,
                                width: 24,
                                imageSrc: AppImages.alertAmber,
                              ),

                              10.width,

                              CommonText(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                text: AppString.specialInstruction,
                              ),
                            ],
                          ),

                          12.height,

                          Container(
                            padding: EdgeInsets.all(8.r),
                            decoration: BoxDecoration(
                              color: AppColors.gridClr,
                              border: Border(
                                left: BorderSide(
                                  color: AppColors.primaryColor,
                                  width: 3.w,
                                ),
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: CommonText(
                              fontSize: 12,
                              textAlign: TextAlign.start,
                              fontWeight: FontWeight.w400,
                              maxLines: 5,
                              text:
                                  controller.singleBookingById?.specialInstruction ??
                                  'N?A',
                              // "Adora has a mild peanut allergy. Please ensure snacks are nut-free. Lucas usually naps from 1-3 PM.",
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

        Container(
          padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 16.w),
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppColors.normalGray2),
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.titleColor,
                text: AppString.payment,
              ),
              5.height,
              infoItem(
                title: "Kids :",
                value: "${controller.singleBookingById?.childrenId.length ?? '0'}",
              ),
              // TODO: Duration missing
              controller.singleBookingById?.bookingType == 'HOURLY'
                  ? infoItem(
                      title: "Duration:  Backend theke data dey nai",
                      value: "5 hours",
                    )
                  : SizedBox(),
              infoItem(
                title: "Hourly Rate: ",
                value:
                    controller.singleBookingById?.serviceRate?.hourlyRate.toString() ??
                    '0.0', //"\$15.00",
              ),

              infoItem(
                title: "Extra Baby charge:",
                value: "\$${controller.singleBookingById!.extraBabyCharge}",
              ),

              10.height,

              CommonImage(width: double.infinity, imageSrc: AppImages.dotedLine),

              10.height,

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonText(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.titleColor,
                    text: "Estimate Total",
                  ),

                  CommonText(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    text: "\$${controller.singleBookingById!.totalPayable}",
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget infoItem({title, value}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommonText(
            color: AppColors.bodyClr,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            text: title,
          ),

          CommonText(
            color: AppColors.bodyClr,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            text: value,
          ),
        ],
      ),
    );
  }
}
