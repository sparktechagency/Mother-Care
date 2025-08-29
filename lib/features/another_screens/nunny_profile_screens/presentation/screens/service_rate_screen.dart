import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mother_care/component/button/common_button.dart';
import 'package:mother_care/component/image/common_image.dart';
import 'package:mother_care/component/other_widgets/common_loader.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/component/text_field/common_text_field.dart';
import 'package:mother_care/features/another_screens/nunny_profile_screens/presentation/controller/service_rate_controller.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import 'package:mother_care/utils/constants/app_images.dart';
import 'package:mother_care/utils/constants/app_string.dart';
import 'package:mother_care/utils/extensions/extension.dart';

class ServiceRateScreen extends StatelessWidget {
  const ServiceRateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ServiceRateController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: CommonText(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              text: AppString.serviceRates,
            ),
            backgroundColor: AppColors.white,
            shadowColor: AppColors.transparent,
            surfaceTintColor: AppColors.transparent,
            leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.arrow_back_ios, size: 23.sp, color: AppColors.titleColor),
            ),
          ),

          body: controller.isLoading?CommonLoader(): Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                16.height,
                CommonText(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  text: AppString.hourlyRate,
                ),
                6.height,

                CommonTextField(
                  controller: controller.hourlyRateController,
                  hintText: AppString.enterHourlyRate,
                  borderColor: AppColors.normalGray2,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CommonImage(
                      height: 24,
                      width: 24,
                      imageSrc: AppImages.priceRate,
                    ),
                  ),
                ),

                16.height,
                CommonText(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  text: AppString.dayRate,
                ),
                6.height,

                CommonTextField(
                  controller: controller.dailyRateController,
                  hintText: AppString.enterDailyRate,
                  borderColor: AppColors.normalGray2,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CommonImage(
                      height: 24,
                      width: 24,
                      imageSrc: AppImages.priceRate,
                    ),
                  ),
                ),

                25.height,
                CommonButton(
                  isLoading: controller.isSaveLoading,
                  onTap: () => controller.save(),
                  buttonRadius: 60,
                  titleText: AppString.save,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
