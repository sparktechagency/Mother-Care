import 'package:flutter/material.dart';
import '../../../../../component/image/common_image.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_images.dart';
import '../../../../../utils/extensions/extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../component/button/common_button.dart';
import '../../../../../component/text/common_text.dart';
import '../../../sign in/presentation/widgets/continue_with_google.dart';
import '../controller/sign_up_controller.dart';
import '../../../../../utils/constants/app_string.dart';
import '../widget/already_accunt_rich_text.dart';
import '../widget/sign_up_all_filed.dart';

class SignUpScreen extends StatelessWidget {
    SignUpScreen({super.key});

  final String type=Get.arguments["type"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      /// Body Section Starts Here
      body: Stack(
        children: [

          Opacity(
            opacity: 0.03,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.splashBg),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          GetBuilder<SignUpController>(
            builder: (controller) {
              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Form(
                  key: controller.signUpFormKey,
                  child: Column(
                    children: [

                      50.height,
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.textFiledColor,
                        ),
                      ).start,



                      Center(
                        child: ClipOval(
                          child: SizedBox(
                            height: 130,
                            width: 130,
                            child: CommonImage(
                              fill: BoxFit.cover,
                              imageSrc: AppImages.logo,
                            ).center,
                          ),
                        ),
                      ),

                      25.height,

                      CommonText(

                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          text: type=="parent"?AppString.parentInformation:AppString.nannyInformation),


                      12.height,
                      CommonText(

                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          maxLines: 2,
                          text: type=="parent"?AppString.parentInformationDes:AppString.nannyInformationDes),



                      /// All Text Filed here
                      SignUpAllField(controller: controller),

                      25.height,

                      /// Submit Button Here
                      CommonButton(
                        titleText: AppString.signUp,
                        isLoading: controller.isLoading,
                        onTap:(){
                          controller.signUpUser(role: type);
                        },
                      ),
                      25.height,

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 1,
                            width: 96.w,
                            color: AppColors.textFiledColor,
                          ),

                          CommonText(
                              left: 8,
                              right: 8,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              text: AppString.orSignUpWith),



                          Container(
                            height: 1,
                            width: 96.w,
                            color: AppColors.textFiledColor,
                          ),
                        ],
                      ),

                      15.height,

                      ContinueWithGoogle(),
                      20.height,


                      ///  Sign In Instruction here
                      const AlreadyAccountRichText(),
                      30.height,
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
