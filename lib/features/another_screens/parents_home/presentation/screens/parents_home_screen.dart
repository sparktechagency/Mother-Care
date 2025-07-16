import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mother_care/utils/extensions/extension.dart';
import '../../../../../component/bottom_nav_bar/common_bottom_bar.dart';
import '../controller/parents_home_controller.dart';
import '../widgets/carousel_slider.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/nunny_list_section.dart';


class ParentsHomeScreen extends StatelessWidget {
  const ParentsHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: GetBuilder(
        init: ParentsHomeController(),
        builder: (context) {
          return SingleChildScrollView(
            child: Column(
              children: [
                CustomAppBar(),

                15.height,

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Column(
                    children: [
                      CarouselSliderSection(),
                      NunnyListSection(),

                    ],
                  ),
                )





              ],
            ),
          );
        }
      ),
      bottomNavigationBar: const CommonBottomNavBar(currentIndex: 0),
    );
  }
}
