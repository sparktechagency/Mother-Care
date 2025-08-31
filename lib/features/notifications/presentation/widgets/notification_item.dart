import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mother_care/utils/time_format/message_date_convert.dart';
import '../../../../component/text/common_text.dart';
import '../../data/model/notification_model.dart';
import '../../../../utils/extensions/extension.dart';
import '../../../../utils/constants/app_colors.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key, required this.item});
final NotificationModel item;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(12.sp),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8.r),

      ),
      child: Row(
        children: [
          /// icon or image here
          CircleAvatar(
            backgroundColor: Colors.green.shade50,
            radius: 20.r,
            child:  ClipOval(
              child: Icon(Icons.notifications, color: Colors.green),
            ),
          ),
          16.width,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// Notification Title here
                    Flexible(
                      child: CommonText(
                        text: item.title ?? "" ,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                      ),
                    ),

                    /// Notification Time here
                    CommonText(
                      text: formatDateToTime(item.createdAt ?? ""),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.start,
                      color: AppColors.bodyClr,
                      maxLines: 1,
                    ),
                  ],
                ),

                /// Notification Message here
                CommonText(
                   text: item.message ?? "" ,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  maxLines: 2,
                  color: AppColors.bodyClr,
                  textAlign: TextAlign.start,
                  bottom: 10,
                  top: 4,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
