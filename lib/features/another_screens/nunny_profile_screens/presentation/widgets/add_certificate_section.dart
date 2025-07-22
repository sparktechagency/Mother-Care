import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mother_care/features/another_screens/nunny_profile_screens/presentation/controller/certificate_and_experience_controller.dart';
import 'package:mother_care/utils/extensions/extension.dart';

import '../../../../../component/other_widgets/no_data.dart';
import '../../../../../component/text/common_text.dart';
import '../../../../../component/text_field/common_text_field.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_string.dart';

class AddCertificateSection extends StatelessWidget {
  const AddCertificateSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CertificateAndExperienceController(),
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            CommonText(
                top: 16,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                bottom: 12,
                text: AppString.addCertificate),

            Row(
              children: [
                Expanded(
                  child: CommonTextField(
                    mexLength: 80,
                    controller:controller.addCertificateAndExperienceController ,
                    hintText: AppString.enterCertifications,
                    borderColor: AppColors.normalGray,
                  ),
                ),

                12.width,

                InkWell(
                  onTap: (){

                    controller.getCertificate();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 12.h),
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: CommonText(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                        text: AppString.add),
                  ),
                )



              ],
            ),
            16.height,


            controller.certificateList.isEmpty?Padding(
              padding: const EdgeInsets.only(top: 30),
              child: NoData(),
            ): ListView.builder(
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.certificateList.length,
                itemBuilder: (context, index){
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 6.h),
                    padding: EdgeInsets.all(15.r),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        border: Border.all(color: AppColors.normalGray2),
                        borderRadius: BorderRadius.circular(12.r)
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CommonText(
                              maxLines: 2,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              textAlign: TextAlign.start,
                              color: AppColors.bodyClr,
                              text: controller.certificateList[index]),
                        ),

                        InkWell(

                            onTap: (){
                              controller.removeCertificate(index);
                            },
                            child: Icon(Icons.delete, color: AppColors.red,))
                      ],
                    ),
                  );


                })

          ],
        );
      }
    );
  }
}
