import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mother_care/component/button/common_button.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import 'package:mother_care/utils/constants/app_string.dart';
import '../widget/add_children_button.dart';
import '../widget/children_item.dart';

class ChildrenDetailsScreen extends StatelessWidget {
  const ChildrenDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: AppColors.transparent,
        shadowColor: AppColors.transparent,
        title: CommonText(text: AppString.children),
        backgroundColor: AppColors.white,
        leading: InkWell(
          
            onTap: (){
              Get.back();
            },
            child: Icon(Icons.arrow_back_ios, size: 23.sp,)),
      ),

      body: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
          itemCount: 3,
          itemBuilder: (context, index){
           // var item = controller.items[index];
            return ChildrenItem();

          }),
      
      bottomNavigationBar: AddChildrenButton(),
    );
    
    
  }
}
