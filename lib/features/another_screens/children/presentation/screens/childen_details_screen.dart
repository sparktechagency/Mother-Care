import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/features/another_screens/children/presentation/controller/children_screen_controller.dart';
import 'package:mother_care/features/another_screens/children/presentation/model/children_list_model.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import 'package:mother_care/utils/constants/app_string.dart';
import '../widget/add_children_button.dart';
import '../widget/children_item.dart';

class ChildrenDetailsScreen extends StatelessWidget {
  const ChildrenDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ChildrenScreenController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            surfaceTintColor: AppColors.transparent,
            shadowColor: AppColors.transparent,
            title: CommonText(text: AppString.children),
            backgroundColor: AppColors.white,
            leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.arrow_back_ios, size: 23.sp),
            ),
          ),

          body: controller.isLoading ?
          Center(child: CircularProgressIndicator(color: Colors.black,),)
              : ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
            itemCount: controller.childrenList.length,
            itemBuilder: (context, index) {
              ChildrenListModel item = controller.childrenList[index];
              return ChildrenItem(item: item,controller: controller,);
            },
          ),

          bottomNavigationBar: AddChildrenButton(),
        );
      },
    );
  }
}
