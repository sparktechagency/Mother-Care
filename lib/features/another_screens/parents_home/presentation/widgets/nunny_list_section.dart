import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/utils/constants/app_string.dart';
import 'package:mother_care/utils/extensions/extension.dart';

import 'nunny_item.dart';

class NunnyListSection extends StatelessWidget {
  const NunnyListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: 6.w
      ),
      child: Column(
        children: [

          15.height,
          Row(
            children: [

              CommonText(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  text: AppString.findNannyNearYou),
              Spacer(),

              Row(
                children: [
                  CommonText(
                      fontSize: 12,
                      right: 5,
                      fontWeight: FontWeight.w400,
                      text: AppString.seeAll),

                  Icon(
                      size: 10.sp,
                      Icons.arrow_forward_ios_rounded)
                ],
              )
            ],
          ),


          // ==========================list section=============================

          10.height,

          ListView.builder(
            padding: EdgeInsets.zero,
              itemCount: 10,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),

              scrollDirection: Axis.vertical,
              itemBuilder: (context, index){
                return NunnyItem();

          })
        ],
      ),
    );
  }
}
