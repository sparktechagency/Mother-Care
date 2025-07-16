
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mother_care/component/image/common_image.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import 'package:mother_care/utils/constants/app_images.dart';
import 'package:mother_care/utils/extensions/extension.dart';

class NunnyItem extends StatelessWidget {
  const NunnyItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),

        color: AppColors.white
      ),
      child: Row(
        children: [
          
          Expanded(
            flex: 1,
            child: CircleAvatar(
              radius: 25,
              child: ClipOval(
                child: CommonImage(
                    height: 50,
                    width: 50,
                    imageSrc: AppImages.female),
              ),
            ),
          ),
          
          6.width,

          Expanded(
            flex: 4,
            child: Column(
              children: [
                
                Row(
                  children: [
                    CommonText(
                      right: 4,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        text: "Tandiwe Amina"),
                    
              CommonImage(
                  height: 20,
                  width: 20,
                  imageSrc: AppImages.verifiedBatch
              )
            
                    
            
            
            
                  ],
                ),
                
                Row(
                  children: [
                    
                    Icon(
                        size: 16,
                        Icons.location_on_outlined),

                    CommonText(
                      top: 2,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        text: "0.31 mi away")
                  ],
                ),

                2.height,

                Row(
                  children: [

                    Icon(
                        size: 10,
                        color: Colors.amber,
                        Icons.star),

                    CommonText(
                      top: 2,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        text: "4.8 (120  Reviews)")
                  ],
                ),
                
                

            
                
              ],
            ),
          ),

          Expanded(
              flex: 1,
              child: Column(
                children: [
                  Icon(
                      size: 24,
                      Icons.bookmark_border),


                  CommonText(
                    top: 8,
                      fontSize: 14,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                      text: "\$50") ,


                  CommonText(
                    top:
                      4,
                      fontSize: 12,

                      fontWeight: FontWeight.w500,
                      text: "Per hour")
                ],
                
              ))
        ],
      ),

    );
  }
}
