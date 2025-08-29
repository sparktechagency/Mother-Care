import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mother_care/component/image/common_image.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/component/text_field/common_text_field.dart';
import 'package:mother_care/features/another_screens/request_booking/presentation/controller/request_booking_controller.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import 'package:mother_care/utils/constants/app_images.dart';
import 'package:mother_care/utils/constants/app_string.dart';
import 'package:mother_care/utils/extensions/extension.dart';

class SummarySection extends StatelessWidget {
  const SummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: RequestBookingController(),
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 7.w),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: AppColors.normalGray2),
              ),

              child: Column(
                children: [
                  infoItem(title: "Kids :", value: "02"),
                  infoItem(title: "Duration:", value: "5 hours"),
                  infoItem(title: "Hourly Rate:", value: "\$15.00"),
                  infoItem(title: "Extra Baby charge:", value: "\$15.00"),

                  10.height,

                  CommonImage(
                    width: double.infinity,
                    imageSrc: AppImages.dotedLine,
                  ),

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
                        text: "\$80",
                      ),
                    ],
                  ),
                ],
              ),
            ),

            16.height,

            CommonText(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              text: AppString.paymentMethod,
            ),

            12.height,

            CommonTextField(
              borderColor: AppColors.textFiledColor,
              suffixIcon: Icon(
                color: AppColors.textFiledColor,
                Icons.keyboard_arrow_down,
              ),
              hintText: AppString.choosePaymentOption,
            ),

            20.height,

            Row(
              children: [
                SizedBox(
                  height: 24,
                  width: 24,
                  child: Checkbox(
                    activeColor: AppColors.primaryColor,
                    value: controller.isTermsSelect,
                    onChanged: (va) {
                      controller.toggleTerms();
                    },
                  ),
                ),

                CommonText(
                  left: 8,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  text: AppString.iHaveRead,
                ),

                Column(
           
                  children: [
                    Row(
                      children: [
                        CommonText(
                          left: 8,
                        
                          fontSize: 12,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                          text: AppString.termsOfServices,
                        ),
                        CommonText(

                            fontSize: 12,
                            color: AppColors.primaryColor,

                            text: "*")
                      ],
                    ),

                    Container(
                      height: 1,
                      width: 100,
                      color: AppColors.primaryColor,
                    )
                  ],
                ),
              ],
            ),

            35.height
          ],
        );
      },
    );
  }

  Widget infoItem({title, value}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommonText(fontSize: 12, fontWeight: FontWeight.w400, text: title),

          CommonText(fontSize: 12, fontWeight: FontWeight.w400, text: value),
        ],
      ),
    );
  }
}
