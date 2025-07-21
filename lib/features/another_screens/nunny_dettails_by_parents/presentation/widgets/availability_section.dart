import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/utils/extensions/extension.dart';

import '../../../../../utils/constants/app_colors.dart';
import '../controller/nunny_details_controller.dart';

class AvailabilitySection extends StatelessWidget {
  const AvailabilitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return   GetBuilder(
      init: NunnyDetailsController(),
      builder: (controller) {
        return Column(
          children: [

            18.height,
            ListView.builder(
                itemCount: controller.availability.length,
                physics: NeverScrollableScrollPhysics()
                ,
                shrinkWrap: true,

                itemBuilder: (context, index){
                  var item=controller.availability[index];
                  return Padding(
                    padding:  EdgeInsets.symmetric(vertical: 4),
                    child: Column(
                      children: [

                        5.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            CommonText(

                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.titleColor,
                                text:item["day"]),

                            CommonText(

                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color:item["availability"]==true?Colors.green:AppColors.red,
                                text:item["time"])
                          ],
                        ),


                        8.height,

                        Container(
                          height: 1,
                          width: double.infinity,
                        color: AppColors.normalGray2,)
                      ],
                    ),
                  );

                }),
          ],
        );
      }
    );
  }
}
