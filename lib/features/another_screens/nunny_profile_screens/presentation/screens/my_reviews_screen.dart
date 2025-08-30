import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mother_care/features/another_screens/nunny_profile_screens/data/nanny_review_model.dart';
import 'package:mother_care/features/another_screens/nunny_profile_screens/presentation/controller/nanny_reviews_controller.dart';
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

      body: GetBuilder(
        init: NannyReviewsController(),
        builder: (controller) {
          return controller.isLoading
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [CircularProgressIndicator(color: Colors.black)],
                  ),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
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
                                      text:
                                          "${controller.nannyReviewDetailsData.averageRating ?? 0}",
                                    ),
                                  ),

                                  8.height,
                                  CommonText(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    text:
                                        "${controller.nannyReviewDetailsData.totalReviews ?? 0} reviews",
                                  ),
                                  6.height,

                                  RatingBar.builder(
                                    initialRating: double.parse(
                                      (controller.nannyReviewDetailsData.averageRating
                                              ?.toString() ??
                                          '0.0'),
                                    ),
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    ignoreGestures: true,
                                    itemSize: 15.sp,
                                    itemPadding: EdgeInsets.symmetric(horizontal: 1.w),
                                    itemBuilder: (context, _) =>
                                        Icon(Icons.star, color: Colors.amber),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                ],
                              ),

                              16.width,
                              if (controller.nannyReviewDetailsData.starCounts != null)
                                SizedBox(
                                  width: 189.w,
                                  child: Column(
                                    children: [
                                      RatingBarRow(
                                        label: "5 stars",
                                        count:
                                            controller
                                                .nannyReviewDetailsData
                                                .starCounts?["5"] ??
                                            0,
                                        totalCount: 5,
                                      ),
                                      RatingBarRow(
                                        label: "4 stars",
                                        count:
                                            controller
                                                .nannyReviewDetailsData
                                                .starCounts?["4"] ??
                                            0,
                                        totalCount: 5,
                                      ),
                                      RatingBarRow(
                                        label: "3 stars",
                                        count:
                                            controller
                                                .nannyReviewDetailsData
                                                .starCounts?["3"] ??
                                            0,
                                        totalCount: 5,
                                      ),
                                      RatingBarRow(
                                        label: "2 stars",
                                        count:
                                            controller
                                                .nannyReviewDetailsData
                                                .starCounts?["2"] ??
                                            0,
                                        totalCount: 5,
                                      ),
                                      RatingBarRow(
                                        label: "1 stars",
                                        count:
                                            controller
                                                .nannyReviewDetailsData
                                                .starCounts?["1"] ??
                                            0,
                                        totalCount: 5,
                                      ),
                                    ],
                                  ),
                                )
                              else
                                SizedBox(),
                            ],
                          ),
                        ),

                        16.height,
                        if (controller.nannyReviewDetailsData.reviews?.length != 0)
                          ListView.builder(
                            itemCount: controller.nannyReviewDetailsData.reviews?.length,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,

                            itemBuilder: (context, index) {
                              Review2 item =
                                  controller.nannyReviewDetailsData.reviews?[index] ??
                                  Review2();

                              return ReviewItemByNunny(item: item);
                            },
                          )
                        else
                          SizedBox(),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
