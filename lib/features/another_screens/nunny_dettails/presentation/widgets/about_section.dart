import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mother_care/component/image/common_image.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import 'package:mother_care/utils/constants/app_images.dart';
import 'package:mother_care/utils/constants/app_string.dart';
import 'package:mother_care/utils/extensions/extension.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        20.height,

        Row(
          children: [
            CommonImage(height: 16, width: 16, imageSrc: AppImages.gender),

            CommonText(
                fontSize: 12,
                left: 6,
                fontWeight: FontWeight.w400,
                text: "Gender: Female"),
          ],
        ),

        8.height,

        Row(
          children: [
            Icon(

                size: 16.sp,
                Icons.calendar_month),

            CommonText(
                fontSize: 12,
                left: 6,
                fontWeight: FontWeight.w400,
                text: "Date of Birth: 11/11/1989"),
          ],
        ),

        8.height,

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(

                size: 16.sp,
                Icons.location_on_outlined),

            Flexible(
              child: CommonText(
                  fontSize: 12,
                  maxLines: 2,
                  textAlign: TextAlign.start,
                  left: 6,
                  fontWeight: FontWeight.w400,
                  text: "Address: Kiambu Road, near Ridgeways Mall Runda Estate, Nairobi"),
            ),
          ],
        ),
        
        20.height,
        
        CommonText(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            text: AppString.ageGroup),

        16.height,

        GridView.builder(
            itemCount: 4,
            physics: NeverScrollableScrollPhysics()
            ,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,


              childAspectRatio: 5 / 2, ),
         itemBuilder: (context, index){
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 10),
                decoration: BoxDecoration(
                  color: AppColors.gridClr,
                  borderRadius: BorderRadius.circular(32.r)

                ),
                child: Center(
                  child: CommonText(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor,
                      text: "Infants (0-1)"),
                ),
              );

            }),

        5.height,
        
        CommonText(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            text: AppString.servicesOffered),

        2.height,

        ListView.builder(
          itemCount: 3,
            physics: NeverScrollableScrollPhysics()
            ,
            shrinkWrap: true,

            itemBuilder: (context, index){
              return Padding(
                padding:  EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    Icon(
                        size: 15.sp,
                        color: AppColors.bodyClr,
                        Icons.control_point_rounded),
                    5.width,

                    CommonText(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.bodyClr,
                        text: "Newborn care")
                  ],
                ),
              );

        })

        ,
        CommonText(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            text: AppString.certifications),

        2.height,

        ListView.builder(
          itemCount: 3,
            physics: NeverScrollableScrollPhysics()
            ,
            shrinkWrap: true,

            itemBuilder: (context, index){
              return Padding(
                padding:  EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    Icon(
                        size: 15.sp,
                        color: AppColors.bodyClr,
                        Icons.control_point_rounded),
                    5.width,

                    CommonText(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.bodyClr,
                        text: "CPR & First Aid Certified by Kenya Red Crossg")
                  ],
                ),
              );

        })    ,


        CommonText(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            text: AppString.experience),

        2.height,

        ListView.builder(
          itemCount: 3,
            physics: NeverScrollableScrollPhysics()
            ,
            shrinkWrap: true,

            itemBuilder: (context, index){
              return Padding(
                padding:  EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    Icon(
                        size: 15.sp,
                        color: AppColors.bodyClr,
                        Icons.control_point_rounded),
                    5.width,

                    CommonText(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.bodyClr,
                        text: "2 years as a live-in nanny in Mombasa")
                  ],
                ),
              );

        })
      ],
    );
  }
}
