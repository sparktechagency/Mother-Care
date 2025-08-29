import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/features/another_screens/nunny_dettails_by_parents/presentation/controller/nunny_details_controller.dart';
import 'package:mother_care/features/another_screens/nunny_dettails_by_parents/presentation/model/nanny_details_model.dart';
import 'package:mother_care/features/another_screens/nunny_dettails_by_parents/presentation/widgets/review_item.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import 'package:mother_care/utils/extensions/extension.dart';

class ReviewSection extends StatelessWidget {
  const ReviewSection({super.key, required this.controller});
  final NunnyDetailsController controller;

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
                      text: "${controller.nannyDetailsData.averageRating ?? 0}",
                    ),
                  ),

                  8.height,
                  CommonText(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    text:
                        "${controller.nannyDetailsData.totalReviews ?? 0} reviews",
                  ),
                  6.height,

                  RatingBar.builder(
                    initialRating: double.parse(
                      (controller.nannyDetailsData.averageRating?.toString() ??
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
              if (controller.nannyDetailsData.starCounts != null)
                SizedBox(
                  width: 189.w,
                  child: Column(
                    children: [
                      RatingBarRow(
                        label: "5 stars",
                        count:
                            controller.nannyDetailsData.starCounts?["5"] ?? 0,
                        totalCount: 5,
                      ),
                      RatingBarRow(
                        label: "4 stars",
                        count:
                            controller.nannyDetailsData.starCounts?["4"] ?? 0,
                        totalCount: 5,
                      ),
                      RatingBarRow(
                        label: "3 stars",
                        count:
                            controller.nannyDetailsData.starCounts?["3"] ?? 0,
                        totalCount: 5,
                      ),
                      RatingBarRow(
                        label: "2 stars",
                        count:
                            controller.nannyDetailsData.starCounts?["2"] ?? 0,
                        totalCount: 5,
                      ),
                      RatingBarRow(
                        label: "1 stars",
                        count:
                            controller.nannyDetailsData.starCounts?["1"] ?? 0,
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
        if (controller.nannyDetailsData.reviews?.length != 0)
          ListView.builder(
            itemCount: controller.nannyDetailsData.reviews?.length,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,

            itemBuilder: (context, index) {
              Review item =
                  controller.nannyDetailsData.reviews?[index] ?? Review();

              return ReviewItem(item: item);
            },
          )
        else
          SizedBox(),
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
              text: label,
            ),

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
                      AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
            CommonText(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              left: 5.w,
              text: count.toString(),
            ),
          ],
        ),
      ],
    );
  }
}
