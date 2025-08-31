import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mother_care/features/another_screens/nunny_profile_screens/presentation/widgets/review_item.dart';
import 'package:mother_care/utils/extensions/extension.dart';
import '../../../../../component/text/common_text.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_string.dart';
import '../../../nunny_dettails_by_parents/presentation/widgets/review_section.dart';

class MyReviewsScreen extends StatelessWidget {
  const MyReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        shadowColor: AppColors.transparent,
        surfaceTintColor: AppColors.transparent,
        title: CommonText(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          text: AppString.myReviews,
        ),
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios, size: 23.sp, color: AppColors.bodyClr),
        ),


      ),

      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              20.height,
        
              Container(
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(11),
                  border: Border.all(width: 1, color: AppColors.normalGray2),
                ),
        
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(11.r),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: CommonText(
                            fontSize: 15,
                            color: AppColors.white,
                            fontWeight: FontWeight.w700,
                            text: "${ 0}",
                          ),
                        ),
        
                        8.height,
                        CommonText(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          text:
                          " 0 reviews",
                        ),
                        6.height,
        
                        RatingBar.builder(
                          initialRating: double.parse(
                            (
                                '0.0'),
                          ),
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
                //    if (controller.nannyDetailsData.starCounts != null)
                      SizedBox(
                        width: 189.w,
                        child: Column(
                          children: [
                            RatingBarRow(
                              label: "5 stars",
                              count:
                              0,
                              totalCount: 5,
                            ),
                            RatingBarRow(
                              label: "4 stars",
                              count:
                              0,
                              totalCount: 5,
                            ),
                            RatingBarRow(
                              label: "3 stars",
                              count:
                              0,
                              totalCount: 5,
                            ),
                            RatingBarRow(
                              label: "2 stars",
                              count:
                              0,
                              totalCount: 5,
                            ),
                            RatingBarRow(
                              label: "1 stars",
                              count:
                               0,
                              totalCount: 5,
                            ),
                          ],
                        ),
                      )
        
        
                  ],
                ),
              ),
        
              16.height,
            //  if (controller.nannyDetailsData.reviews?.length != 0)
                ListView.builder(
                  itemCount: 20,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
        
                  itemBuilder: (context, index) {
                    // Review item =
                    //     controller.nannyDetailsData.reviews?[index] ?? Review();
        
                    return ReviewItemByNunny();
                  },
                )
        
            ],
          ),
        ),
      ),
    );
  }
}
