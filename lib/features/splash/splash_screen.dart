import 'package:flutter/material.dart';
import 'package:mother_care/services/storage/storage_services.dart';
import 'package:mother_care/utils/extensions/extension.dart';
import '../../config/route/app_routes.dart';
import 'package:get/get.dart';
import '../../utils/constants/app_images.dart';
import '../../component/image/common_image.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      if (LocalStorage.isLogIn) {
        if (LocalStorage.myRoll == 'parents') {
          Get.offAllNamed(AppRoutes.parentHomeScreen);
        } else {
          Get.offAllNamed(AppRoutes.nunnHomeScreen);
        }
      } else {
        Get.offAllNamed(AppRoutes.onboarding);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          // Centered Circular Logo
          Center(
            child: ClipOval(
              child: SizedBox(
                height: 200,
                width: 200,
                child: CommonImage(
                  fill: BoxFit.cover,
                  imageSrc: AppImages.logo,
                ).center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
