
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/features/another_screens/nunny_dettails_by_parents/presentation/widgets/review_item.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import 'package:mother_care/utils/extensions/extension.dart';

class ReviewSection extends StatelessWidget {
  const ReviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        20.height,

        Container(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20),
          decoration: BoxDecoration(

            color: AppColors.white,
            borderRadius: BorderRadius.circular(11),
            border: Border.all(width: 1, color: AppColors.normalGray2)
          ),

          child: Row(
            children: [

              Column(
                children: [

                  Container(
                    padding: EdgeInsets.all(11.r),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      shape: BoxShape.circle
                    ),
                    child: CommonText(
                        fontSize: 15,
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                        text: "4.5"),
                  ),

                  8.height,
                  CommonText(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      text: "320 reviews"),
6.height,
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

                ],
              ),

              16.width,


              SizedBox(
                width: 189.w,
                child: Column(
                  children: [
                    RatingBarRow(label: "5 stars", count: 150, totalCount: 200),
                    RatingBarRow(label: "4 stars", count: 130, totalCount: 200),
                    RatingBarRow(label: "3 stars", count: 90, totalCount: 200),
                    RatingBarRow(label: "2 stars", count: 60, totalCount: 200),
                    RatingBarRow(label: "1 stars", count: 30, totalCount: 200),
                  ],
                ),
              ),
            ],
          ),
        ),

        16.height,

        ListView.builder(

          itemCount: 7,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,

            itemBuilder: (context, index){
            return ReviewItem();

        })


      ],
    );
  }


}
class RatingBarRow extends StatelessWidget {
  final String label;
  final int count;
  final int totalCount;

  RatingBarRow({
    required this.label,
    required this.count,
    required this.totalCount,
  });

  @override
  Widget build(BuildContext context) {
    double percentage = count / totalCount;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        8.height,
        Row(
          children: [

            CommonText(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                right: 5.w,
                text: label),

            SizedBox(
              width: 118.w,
              child: Container(
                height: 7.h, // Custom height
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade300,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(

                    value: percentage,
                    backgroundColor: AppColors.transparent,
                    valueColor: AlwaysStoppedAnimation<Color>(
                        AppColors.primaryColor),
                  ),
                ),
              ),
            ),
            CommonText(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                left: 5.w,
                text: count.toString()),
          ],
        ),

      ],
    );
  }}
