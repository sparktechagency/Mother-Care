import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mother_care/component/image/common_image.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/features/another_screens/parent_booking/presentation/model/parent_booking_list_model.dart';
import 'package:mother_care/utils/extensions/extension.dart';
import 'package:mother_care/utils/time_format/time_format_for_booking.dart';
import '../../../../../utils/constants/app_colors.dart';

class BookingItem extends StatelessWidget {
  const BookingItem({super.key, required this.item});
  final ParentBookingListModel item;
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

      child: Row(
        children: [
          ClipOval(
            child: CommonImage(
              height: 48,
              width: 48,
              imageSrc: item.nannyId.profileImage ?? "",
            ),
          ),

          15.width,

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  text: item.nannyId.name ?? "N/A",
                ),

                CommonText(
                  fontSize: 12,
                  top: 3,
                  fontWeight: FontWeight.w400,
                  color: AppColors.bodyClr,
                  text: formatDateforBooking(item.createdAt.toString() ?? "N/A"),
                ),

                CommonText(
                  color:
                      item.nannyId.status == "COMPLETED"
                          ? Colors.green
                          : AppColors.primaryColor,
                  text: item.nannyId.status ?? "N/A",
                ),
              ],
            ),
          ),

          CommonText(
            fontSize: 15,
            top: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryColor,
            text: "\$${item.totalPayable ?? 0}",
          ),

          // SizedBox(
          //   height: 24.h,
          //   width: 24.w,
          //   child: PopupMenuButton<String>(
          //     color: AppColors.white,
          //     icon: Icon(Icons.more_vert, color: AppColors.textFiledColor),

          //     onSelected: (value) {},
          //     itemBuilder: (BuildContext context) {
          //       return [
          //         PopupMenuItem<String>(
          //           value: '',
          //           child: Row(
          //             children: [
          //               Icon(
          //                 size: 25,
          //                 Icons.edit,
          //                 color: AppColors.textFiledColor,
          //               ),
          //               5.width,
          //               CommonText(text: AppString.editBooking),
          //             ],
          //           ),
          //         ),
          //         PopupMenuItem<String>(
          //           value: 'Option 2',
          //           child: Row(
          //             children: [
          //               Icon(size: 25, Icons.clear, color: AppColors.red),
          //               5.width,
          //               CommonText(
          //                 color: AppColors.red,
          //                 text: AppString.cancel,
          //               ),
          //             ],
          //           ),
          //         ),
          //       ];
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
