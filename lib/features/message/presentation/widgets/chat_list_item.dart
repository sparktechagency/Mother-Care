import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mother_care/utils/constants/app_images.dart';
import '../../../../component/image/common_image.dart';
import '../../../../component/text/common_text.dart';
import '../../../../utils/constants/app_string.dart';
import '../../data/model/chat_list_model.dart';
import '../../../../utils/extensions/extension.dart';
import '../../../../utils/constants/app_colors.dart';

Widget chatListItem({required ChatModel item}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 5),
    padding: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 12.h, top: 12.h),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12.r),
      color: AppColors.white,
    ),
    child: Column(
      children: [
        Row(
          children: [
            /// participant image here
            CircleAvatar(
              radius: 28.sp,
              child: ClipOval(
                child: CommonImage(
                  fill: BoxFit.fill,
                  imageSrc: item.participant.image,
                  size: 70,
                ),
              ),
            ),
            12.width,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// participant Name here
                Row(
                  children: [
                    CommonText(
                      right: 5,
                      text: item.participant.fullName,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                    CommonImage(imageSrc: AppImages.verifiedBatch),
                  ],
                ),

                /// participant Last Message here
                CommonText(
                  text: item.latestMessage.message,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ],
            ),

            Spacer(),

            SizedBox(
              height: 24.h,
              width: 24.w,
              child: PopupMenuButton<String>(
                color: AppColors.white,
                icon: Icon(Icons.more_vert, color: AppColors.textFiledColor),

                onSelected: (value) {},
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem<String>(
                      value: '',
                      child: CommonText(text:"Delete"),
                    ),

                  ];
                },
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
