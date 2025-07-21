
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mother_care/component/image/common_image.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import 'package:mother_care/utils/constants/app_images.dart';
import 'package:mother_care/utils/extensions/extension.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 8.h),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.red)
                ),
                child: ClipOval(
                  child: CommonImage(

                    height: 43,
                      width: 43,
                      imageSrc: AppImages.female),
                ),
              ),

              12.width,

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        text: "Amina Bello"),
                
                    4.height,
                
                    RatingBar.builder(
                      initialRating: 4.5,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      ignoreGestures: true,
                      itemSize: 15.sp,
                      itemPadding: EdgeInsets.symmetric(horizontal: 1.w),
                      itemBuilder:
                          (context, _) => Icon(Icons.star, color: Colors.amber),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                
                    5.height,
                    
                    CommonText(
                        fontSize: 12,
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.w400,
                        maxLines: 10,
                        text: "Tandiwe is amazing! She’s been so caring with my daughter, and we trust her completely.")
                
                
                  ],
                ),
              ),

              CommonText(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.bodyClr,
                  text: "12 Nov 24")
            ],
          ),

          25.height,
          Container(height: 1,
          width: double.infinity,
            color: AppColors.normalGray2,
          )
        ],
      ),
    );
  }
}
