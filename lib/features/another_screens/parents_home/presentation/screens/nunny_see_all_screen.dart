import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import 'package:mother_care/utils/constants/app_string.dart';
import 'package:mother_care/utils/extensions/extension.dart';

import '../widgets/nunny_item.dart';

class NunnySeeAllScreen extends StatelessWidget {
  const NunnySeeAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: AppColors.transparent,
        shadowColor: AppColors.transparent,
        leading: InkWell(
          onTap: (){
            Get.back();
          },
          child: Icon(
              size: 20.sp,
              Icons.arrow_back_ios),
        ),
        title: CommonText(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            text: AppString.nannyNearYou),
      ),

      body: Column(
        children: [
          5.height,

          Row(
            children: [
              Expanded(
                child: Container(
                  height: 44.h,
                           
                  color: AppColors.normalGray,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center
                    ,
                    children: [
                      Icon(
                        size: 18.sp,
                        Icons.filter_alt_outlined, color: AppColors.bodyClr,),
                      
                      CommonText(
                        left: 5,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          text: AppString.filter)
                    ],
                  ),
                ),
              ),
              Container(
                height: 44,
                width: 2,
                color: AppColors.normalGray2,
              ),
              
              Expanded(
                child: Container(
                  height: 44.h,
                
                  color: AppColors.normalGray,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center
                    ,
                    children: [
                      Icon(
                        size: 18.sp,
                        Icons.sort, color: AppColors.bodyClr,),

                      CommonText(
                        left: 5,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          text: AppString.sort)
                    ],
                  ),
                ),
              ),
            ],
          ),
          // ==========================list section=============================

          10.height,

          Expanded(

            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: 10,


                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index){
                    return NunnyItem();

                  }),
            ),
          )
        ],
      ),
    );
  }
}
