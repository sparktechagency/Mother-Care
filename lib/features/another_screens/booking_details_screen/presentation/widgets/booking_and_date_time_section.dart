import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mother_care/config/api/api_end_point.dart';
import 'package:mother_care/features/another_screens/booking_details_screen/presentation/controller/reschedule_controller.dart';
import 'package:mother_care/utils/extensions/extension.dart';
import '../../../../../component/image/common_image.dart';
import '../../../../../component/text/common_text.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_images.dart';
import '../../../../../utils/constants/app_string.dart';

class BookingAndDateTimeSection extends StatelessWidget {
  final RescheduleController controller;
  const BookingAndDateTimeSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (controller.singleBookingById!.bookingType) {
        case 'HOURLY':
          return controller.isLoading.value
              ? CircularProgressIndicator()
              : HourlyBookingWidget(controller: controller);
        case 'FULL_DAY':
          return controller.isLoading.value
              ? CircularProgressIndicator()
              : FullDayBookingWidget(controller: controller);
        case 'CUSTOM':
          return controller.isLoading.value
              ? CircularProgressIndicator()
              : CustomBookingWidget(controller: controller);

        default:
          return SizedBox.shrink();
      }
    });
  }
}

class CustomBookingWidget extends StatelessWidget {
  const CustomBookingWidget({super.key, required this.controller});

  final RescheduleController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppColors.normalGray2),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: CommonText(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.titleColor,
                      text:
                          "${AppString.bookingID} ${controller.singleBookingById!.id}", //"${AppString.bookingID} #10001",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  // Spacer(),
                  CommonText(
                    fontSize: 12,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w400,
                    text: controller.singleBookingById?.bookingStatus ?? 'Status Error',
                  ),
                ],
              ),

              16.height,
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.normalGray2, width: 2),
                      shape: BoxShape.circle,
                    ),
                    child: ClipOval(
                      child: CommonImage(
                        fill: BoxFit.cover,
                        height: 56,
                        width: 56,
                        imageSrc:
                            controller.singleBookingById!.parentId.profileImage, //AppImages.female,
                      ),
                    ),
                  ),
                  6.width,



                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        text:
                            controller.singleBookingById!.parentId.name, //"Zuri Mwangi",
                      ),
                      4.height,

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(size: 14.sp, Icons.star, color: Colors.amber),
                          CommonText(
                            left: 4,
                            fontSize: 12,
                            color: AppColors.bodyClr,
                            fontWeight: FontWeight.w400,
                            // TODO: Data Missing from backend
                            text: "4.8 (120  Reviews)",
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              10.height,
            ],
          ),
        ),

        20.height,

        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
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
                text: AppString.dateTime,
              ),

              13.height,
              ListView.builder(
                padding: EdgeInsets.all(0),
                shrinkWrap: true,
                itemCount: controller.singleBookingById!.customBooking.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3.0),
                    child: Row(
                      children: [
                        Icon(Icons.calendar_month, color: AppColors.bodyClr, size: 16.sp),
                        CommonText(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          left: 3,
                          text:
                              '${controller.singleBookingById!.customBooking[index].date} | ${controller.singleBookingById!.customBooking[index].startTime} - ${controller.singleBookingById!.customBooking[index].endTime}', //"25 March 25",
                        ),
                      ],
                    ),
                  );
                },
              ),
              3.height,
              Row(
                children: [
                  CommonImage(imageSrc: AppImages.duration),
                  CommonText(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    left: 3,
                    // TODO: Duration missing
                    text: "Duration : 6 Hours",
                  ),
                ],
              ),
            ],
          ),
        ),

        20.height,

        Map(),
      ],
    );
  }
}

class FullDayBookingWidget extends StatelessWidget {
  const FullDayBookingWidget({super.key, required this.controller});

  final RescheduleController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppColors.normalGray2),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: CommonText(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.titleColor,
                      text:
                          "${AppString.bookingID} ${controller.singleBookingById!.id}", //"${AppString.bookingID} #10001",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  // Spacer(),
                  CommonText(
                    fontSize: 12,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w400,
                    text: controller.singleBookingById?.bookingStatus ?? 'Status Error',
                  ),
                ],
              ),

              16.height,
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.normalGray2, width: 2),
                      shape: BoxShape.circle,
                    ),
                    child: ClipOval(
                      child: CommonImage(
                        fill: BoxFit.cover,
                        height: 56,
                        width: 56,
                        imageSrc:
                            '${ApiEndPoint.imageUrl}${controller.singleBookingById!.parentId.profileImage}', //AppImages.female,
                      ),
                    ),
                  ),
                  6.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        text:
                            controller.singleBookingById!.parentId.name, //"Zuri Mwangi",
                      ),
                      4.height,

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(size: 14.sp, Icons.star, color: Colors.amber),
                          CommonText(
                            left: 4,
                            fontSize: 12,
                            color: AppColors.bodyClr,
                            fontWeight: FontWeight.w400,
                            // TODO: Data Missing from backend
                            text: "4.8 (120  Reviews)",
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              10.height,
            ],
          ),
        ),

        20.height,

        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
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
                text: AppString.dateTime,
              ),

              13.height,

              ListView.builder(
                padding: EdgeInsets.all(0),
                shrinkWrap: true,
                itemCount: controller.singleBookingById!.fullDayBooking!.fullDays.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3.0),
                    child: Row(
                      children: [
                        Icon(Icons.calendar_month, color: AppColors.bodyClr, size: 16.sp),
                        CommonText(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          left: 3,
                          text:
                              '${controller.singleBookingById!.fullDayBooking!.fullDays[index]} | ${controller.singleBookingById!.fullDayBooking!.startDate} - ${controller.singleBookingById!.fullDayBooking!.endDate}', //"25 March 25",
                        ),
                      ],
                    ),
                  );
                },
              ),
              3.height,
              Row(
                children: [
                  CommonImage(imageSrc: AppImages.duration),
                  CommonText(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    left: 3,
                    // TODO: Duration missing
                    text: "Duration : 6 Hours",
                  ),
                ],
              ),
            ],
          ),
        ),

        20.height,

        Map(),
      ],
    );
  }
}

class HourlyBookingWidget extends StatelessWidget {
  const HourlyBookingWidget({super.key, required this.controller});

  final RescheduleController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppColors.normalGray2),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: CommonText(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.titleColor,
                      text:
                          "${AppString.bookingID} ${controller.singleBookingById!.id}", //"${AppString.bookingID} #10001",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  // Spacer(),
                  CommonText(
                    fontSize: 12,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w400,
                    text: controller.singleBookingById?.bookingStatus ?? 'Status Error',
                  ),
                ],
              ),

              16.height,
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.normalGray2, width: 2),
                      shape: BoxShape.circle,
                    ),
                    child: ClipOval(
                      child: CommonImage(
                        fill: BoxFit.cover,
                        height: 56,
                        width: 56,
                        imageSrc:
                            controller.singleBookingById!.parentId.profileImage, //AppImages.female,
                      ),
                    ),
                  ),
                  6.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        text:
                            controller.singleBookingById!.parentId.name, //"Zuri Mwangi",
                      ),
                      4.height,

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(size: 14.sp, Icons.star, color: Colors.amber),
                          CommonText(
                            left: 4,
                            fontSize: 12,
                            color: AppColors.bodyClr,
                            fontWeight: FontWeight.w400,
                            // TODO: Data Missing from backend
                            text: "4.8 (120  Reviews)",
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              10.height,
            ],
          ),
        ),

        20.height,

        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
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
                text: AppString.dateTime,
              ),

              13.height,
              Row(
                children: [
                  Icon(Icons.calendar_month, color: AppColors.bodyClr, size: 16.sp),
                  CommonText(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    left: 3,
                    text: controller
                        .singleBookingById!
                        .hourlyBooking!
                        .date, //"25 March 25",
                  ),
                ],
              ),
              6.height,

              Row(
                children: [
                  Icon(Icons.watch_later_outlined, color: AppColors.bodyClr, size: 16.sp),
                  CommonText(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    left: 3,
                    text:
                        '${controller.singleBookingById!.hourlyBooking!.startTime} - ${controller.singleBookingById!.hourlyBooking!.endTime}', //"09-00 am - 3:00 pm",
                  ),
                ],
              ),

              6.height,

              Row(
                children: [
                  CommonImage(imageSrc: AppImages.duration),
                  CommonText(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    left: 3,
                    // TODO: Duration missing
                    text: "Duration : 6 Hours",
                  ),
                ],
              ),
            ],
          ),
        ),

        20.height,

        Map(),
      ],
    );
  }
}

class Map extends StatelessWidget {
  const Map({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.normalGray2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                text: AppString.location,
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: AppColors.gridClr,
                ),
                child: CommonText(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  text: "2.3 km away",
                ),
              ),
            ],
          ),

          12.height,

          CommonText(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            text: "12b, Lekki Phase 1, Lagos, Nigeria",
          ),
          6.height,
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(10.r),
            child: CommonImage(
              width: double.infinity,
              height: 131.h,
              imageSrc: AppImages.map,
            ),
          ),
        ],
      ),
    );
  }
}
