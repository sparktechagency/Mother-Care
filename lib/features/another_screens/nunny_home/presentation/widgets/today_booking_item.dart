import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mother_care/component/image/common_image.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/features/another_screens/nunny_booking/presentation/data/model/nani_booking_all_model.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import 'package:mother_care/utils/constants/app_images.dart';
import 'package:mother_care/utils/extensions/extension.dart';

class TodayBookingItem extends StatelessWidget {
  final Booking? booking;
  const TodayBookingItem({super.key, this.booking});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              radius: 30,
              child: ClipOval(
                child: CommonImage(height: 60, width: 60, imageSrc: AppImages.female),
              ),
            ),
          ),

          6.width,

          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonText(
                      right: 4,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      text: booking?.parentId.name ?? 'N/A', //"Tandiwe Amina",
                    ),
                    CommonText(
                      top: 8,
                      fontSize: 16,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w700,
                      text: booking?.totalPayable.toString() ?? 'N/A', //"\$50",
                    ),
                  ],
                ),

                6.height,

                booking?.bookingType == 'HOURLY'
                    ? Row(
                        children: [
                          Icon(size: 16.sp, Icons.calendar_month),
                          CommonText(
                            top: 2,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            text:
                                "${booking?.hourlyBooking?.slots[0].date ?? 'N/A'} | ${booking?.hourlyBooking?.slots[0].startTime ?? 'N/A'}",
                          ),
                        ],
                      )
                    : Row(
                        children: [
                          Icon(size: 16.sp, Icons.calendar_month),
                          booking?.bookingType == 'FULL_DAY'
                              ? CommonText(
                                  top: 2,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  text:
                                      "${booking?.fullDayBooking?.fullDays[0] ?? 'N/A'} | ${booking?.fullDayBooking?.fullDays[booking?.fullDayBooking?.fullDays.length == null ? 0 : booking!.fullDayBooking!.fullDays.length - 1] ?? 'N/A'}",
                                )
                              : CommonText(
                                  top: 2,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  text: getCustomBookingRange(booking),
                                ),
                        ],
                      ),

                2.height,

                Row(
                  children: [
                    Icon(
                      size: 16.sp,
                      color: AppColors.titleColor,
                      Icons.location_on_outlined,
                    ),

                    CommonText(
                      top: 2,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      text:
                          booking?.parentId.address ??
                          'N/A', //"123 Ngong Road, Nairobi, Kenya",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

String getCustomBookingRange(Booking? booking) {
  if (booking == null || booking.customBooking.isEmpty) return "N/A";

  final firstBooking = booking.customBooking.first;
  final lastBooking = booking.customBooking.last;

  final firstDate = firstBooking.fullDays.isNotEmpty
      ? firstBooking.fullDays.first
      : "N/A";
  final lastDate = lastBooking.fullDays.isNotEmpty ? lastBooking.fullDays.last : "N/A";

  return "$firstDate | $lastDate";
}
