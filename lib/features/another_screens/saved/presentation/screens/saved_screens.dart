import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/features/another_screens/saved/presentation/controller/saved_screen_controller.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import 'package:mother_care/utils/constants/app_string.dart';
import '../../../../../component/bottom_nav_bar/common_bottom_bar.dart';
import '../widgets/nunny_saved_item.dart';

class SavedScreens extends StatelessWidget {
  const SavedScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SavedScreenController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            surfaceTintColor: AppColors.transparent,
            shadowColor: AppColors.transparent,
            backgroundColor: AppColors.white,
            leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.arrow_back_ios, size: 23.sp),
            ),
            title: CommonText(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              text: AppString.savedNanny,
            ),
          ),

          body:
              controller.isLoading
                  ? Center(
                    child: CircularProgressIndicator(color: Colors.black),
                  )
                  : controller.bookmarkList.isEmpty
                  ? Center(
                    child: Text(
                      "No Boomark Found",
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                  : ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    itemCount: controller.bookmarkList.length,
                    itemBuilder: (context, index) {
                          RxBool isLoadingBookmark = false.obs;
                      var item = controller.bookmarkList[index];
                      return NunnySavedItem(item: item,controller: controller,isLoadingBookmark: isLoadingBookmark);
                    },
                  ),

          bottomNavigationBar: const CommonBottomNavBar(currentIndex: 3),
        );
      },
    );
  }
}
