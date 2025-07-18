
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mother_care/component/image/common_image.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/component/text_field/common_text_field.dart';
import 'package:mother_care/features/another_screens/request_booking/presentation/controller/request_booking_controller.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import 'package:mother_care/utils/constants/app_images.dart';
import 'package:mother_care/utils/constants/app_string.dart';
import 'package:mother_care/utils/extensions/extension.dart';

class BodySection extends StatelessWidget {
  const BodySection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: RequestBookingController(),
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            20.height,
            CommonText(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                text: AppString.selectBabies),


            10.height,

            ListView.builder(
              padding: EdgeInsets.all(0),
                itemCount:  controller.items.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index){
                  var item = controller.items[index];
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    padding: EdgeInsets.all(12.r),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12.r)
                    ),

                    child:Row(
                      children: [
                        Container(

                          decoration: BoxDecoration(
                            color: AppColors.normalGray2,
                            shape: BoxShape.circle
                          ),
                          padding: EdgeInsets.all(2),
                          child: ClipOval(
                            child: CommonImage(

                                height: 56,
                                width: 56,
                                imageSrc: AppImages.female),
                          ),
                        ),

                        6.width,

                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonText(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  text: "Chinedu Okonkwo  "),

                              CommonText(
                                top: 2,
                                  fontSize: 12,
                                  color: AppColors.bodyClr,
                                  fontWeight: FontWeight.w400,
                                  text: "Girl "),

                              CommonText(
                                top: 2,
                                  fontSize: 12,
                                  color: AppColors.bodyClr,
                                  fontWeight: FontWeight.w400,
                                  text: "4 Years 9 Months"),
                            ],
                          ),
                        ),



                        Expanded(
                          flex: 1,
                          child: SizedBox(

                            height: 24.h,
                            width: 24.w,

                            child: Checkbox(

                              activeColor: AppColors.primaryColor,
                                value: item['isSelected'],
                                onChanged: (va){
                                  controller.toggleCheckBox(index);
                                }),
                          ),
                        )

                      ],
                    ),
                  );

            }),

            20.height,
            
            CommonText(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                text: AppString.addSpecialNoteForNanny),

            12.height,

            CommonTextField(
              maxline: 4,
              borderColor: AppColors.normalGray2,
              hintText: AppString.anySpecialInstructionsOrRequirements,
            ),

            20.height,

            Container(
              padding: EdgeInsets.all(12.r),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: Colors.green.shade50
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                      fontSize: 12,
                      color:Colors.green,
                      fontWeight: FontWeight.w700,
                      text: AppString.pricing),
                  
                  Flexible(
                    child: CommonText(
                        fontSize: 12,
                        left: 5,
                        color:Colors.green,
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.w400,
                        maxLines: 2,
                        text: "1 Child (Base Price), 2 Children (+10%), 3 Children (+20%)"),
                  )
                ],
              ),
            ),

            20.height

          ],
        );
      }
    );
  }
}
