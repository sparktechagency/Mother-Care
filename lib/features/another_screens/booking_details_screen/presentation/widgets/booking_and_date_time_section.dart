import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mother_care/utils/extensions/extension.dart';

import '../../../../../component/image/common_image.dart';
import '../../../../../component/text/common_text.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_images.dart';
import '../../../../../utils/constants/app_string.dart';

class BookingAndDateTimeSection extends StatelessWidget {
  const BookingAndDateTimeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: AppColors.normalGray2)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CommonText(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.titleColor,
                      text: "${AppString.bookingID} #10001"),
                  Spacer(),
                  CommonText(
                      fontSize: 12,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w400,
                      text: AppString.pending)
                ],
              ),

              16.height,
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.normalGray2,width: 2),
                        shape: BoxShape.circle

                    ),
                    child: ClipOval(
                      child: CommonImage(

                          height: 56,
                          width: 56,
                          imageSrc: AppImages.female),
                    ),
                  ),
                  6.width,Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      CommonText(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          text:"Zuri Mwangi"),
                      4.height,

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            size: 14.sp,
                            Icons.star, color: Colors.amber,),

                          CommonText(
                              left: 4,
                              fontSize: 12,
                              color: AppColors.bodyClr,
                              fontWeight: FontWeight.w400,
                              text: "4.8 (120  Reviews)")
                        ],
                      )
                    ],
                  )
                ],
              ),

              10.height
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
              border: Border.all(color: AppColors.normalGray2)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              CommonText(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  text: AppString.dateTime),

              13.height,

              Row(
                children: [

                  Icon(Icons.calendar_month, color: AppColors.bodyClr,size: 16.sp,),
                  CommonText(
                      fontSize: 12,fontWeight: FontWeight.w400,
                      left: 3,
                      text: "25 March 25")
                ],
              ),
              6.height,


              Row(
                children: [

                  Icon(Icons.watch_later_outlined, color: AppColors.bodyClr,size: 16.sp,),
                  CommonText(
                      fontSize: 12,fontWeight: FontWeight.w400,
                      left: 3,
                      text: "09-00 am - 3:00 pm")
                ],
              ),


              6.height,


              Row(
                children: [

                  CommonImage(imageSrc: AppImages.duration),
                  CommonText(
                      fontSize: 12,fontWeight: FontWeight.w400,
                      left: 3,
                      text: "Duration : 6 Hours")
                ],
              ),

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
              border: Border.all(color: AppColors.normalGray2)
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
                      text: AppString.location),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: AppColors.gridClr
                    ),
                    child:CommonText(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        text: "2.3 km away"),
                  )
                ],
              ),

              12.height,

              CommonText(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  text: "12b, Lekki Phase 1, Lagos, Nigeria"),
              6.height,
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(10.r),
                child: CommonImage(
                    width: double.infinity,
                    height: 131.h,
                    imageSrc: AppImages.map),
              )




            ],
          ),
        ),
      ],
    );
  }
}
