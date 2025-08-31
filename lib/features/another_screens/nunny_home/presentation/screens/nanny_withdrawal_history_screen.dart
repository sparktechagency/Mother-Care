import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import 'package:mother_care/utils/constants/app_string.dart';

class NannyWithdrawalHistoryScreen extends StatelessWidget {
  const NannyWithdrawalHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.transparent,
        shadowColor: AppColors.transparent,
        title: CommonText(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.titleColor,
          text: AppString.transectionHistory,
        ),
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: const Color.fromRGBO(51, 51, 51, 1),
            size: 23.sp,
          ),
        ),
      ),

      body: ListView.builder(
        itemCount: 5,

        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 17.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/icons/arrow_circle_up.svg'),

                SizedBox(width: 15.h),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      top: 3,
                      fontSize: 14.w,
                      fontWeight: FontWeight.w600,
                      text: AppString.topUPdanaup,
                    ),

                    CommonText(
                      top: 3.57,
                      fontSize: 12.w,
                      color: AppColors.titleColorSecondary,
                      fontWeight: FontWeight.w500,
                      text: '17 Apr 25',
                    ),
                  ],
                ),
                Spacer(),
                CommonText(
                  top: 3.57,
                  fontSize: 16.w,
                  color: Colors.green,
                  fontWeight: FontWeight.w700,
                  text: '+ \$750,0',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
