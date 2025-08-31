import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mother_care/component/image/common_image.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/config/route/app_routes.dart';
import 'package:mother_care/features/another_screens/nunny_booking/presentation/controller/nunny_booking_controller.dart';
import 'package:mother_care/utils/constants/app_string.dart';
import 'package:mother_care/utils/extensions/extension.dart';

import '../../../../../utils/constants/app_colors.dart';

class HistoryItem extends StatelessWidget {
  final String status;
  final String bookingId;
  final String amount;
  final String parentsName;
  final String date;
  final String startTime;
  final String endTime;
  final String location;
  final String? bookingType;
  final String image;
  final NunnyBookingController controller;
  const HistoryItem({
    super.key,
    required this.status,
    required this.amount,
    required this.parentsName,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.location,
    required this.bookingId,
    this.bookingType,
    required this.image,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 12.w),
      margin: EdgeInsets.symmetric(vertical: 8.h),
      width: double.infinity,

      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(6.r),
      ),

      child: InkWell(
        onTap: () {
          Get.toNamed(AppRoutes.nunnyBookingDetailsScreen, arguments: bookingId);
        },
        child: Row(
          children: [
            ClipOval(
              child: CommonImage(
                height: 48,
                width: 48,
                imageSrc: image,
                fill: BoxFit.cover,
              ),
            ),
            15.width,

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonText(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        text: parentsName, //"Zara Taylor",
                      ),

                      CommonText(
                        fontSize: 16,

                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                        text: "\$$amount", // "\$60",
                      ),
                    ],
                  ),
                  6.height,

                  Row(
                    children: [
                      Icon(Icons.calendar_month, color: AppColors.bodyClr),
                      5.width,
                      bookingType != 'FULL_DAY' && bookingType != 'CUSTOM'
                          ? CommonText(
                              fontSize: 12,
                              top: 3,
                              fontWeight: FontWeight.w400,
                              color: AppColors.bodyClr,
                              text:
                                  '$date - $startTime', //"25 March 25 | 09:30am - 3:00pm", ( - $endTime)
                            )
                          : CommonText(
                              fontSize: 12,
                              top: 3,
                              fontWeight: FontWeight.w400,
                              color: AppColors.bodyClr,
                              text:
                                  ' $startTime | $endTime', //"25 March 25 | 09:30am - 3:00pm",
                            ),
                    ],
                  ),

                  2.height,

                  Row(
                    children: [
                      Icon(Icons.location_on_outlined, color: AppColors.bodyClr),
                      5.width,
                      CommonText(
                        fontSize: 12,
                        top: 3,
                        fontWeight: FontWeight.w400,
                        color: AppColors.bodyClr,
                        text: location, //"123 Ngong Road, Nairobi, Kenya",
                      ),
                    ],
                  ),

                  if (status != "upComing" &&
                      status != "onGoing" &&
                      status != "newRequest")
                    CommonText(color: Colors.green, text: "COMPLETED"),

                  if (status == "newRequest")
                    Row(
                      children: [
                        AcceptDeclineButton(
                          buttonText: AppString.accept,
                          buttonColor: Colors.green,
                          onTap: () => controller.acceptBooking(bookingID: bookingId),
                        ),

                        12.width,

                        AcceptDeclineButton(
                          buttonText: AppString.decline,
                          buttonColor: Colors.red,
                          onTap: () => controller.declineBooking(bookingID: bookingId),
                        ),
                      ],
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

class AcceptDeclineButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final void Function() onTap;
  const AcceptDeclineButton({
    super.key,
    required this.buttonText,
    required this.buttonColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 6.h),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(60.r),
        ),
        child: CommonText(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.white,
          text: buttonText,
        ),
      ),
    );
  }
}
