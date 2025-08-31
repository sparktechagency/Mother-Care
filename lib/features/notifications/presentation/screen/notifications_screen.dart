import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import '../../../../component/bottom_nav_bar/common_bottom_bar.dart';
import '../../../../component/other_widgets/common_loader.dart';
import '../../../../component/other_widgets/no_data.dart';
import '../../../../component/text/common_text.dart';
import '../controller/notifications_controller.dart';
import '../../../../config/api/api_end_point.dart';
import '../../data/model/notification_model.dart';
import '../widgets/notification_item.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// App Bar Section starts here
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.transparent,
        shadowColor: AppColors.transparent,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            color: AppColors.titleColor,
            Icons.arrow_back_ios,
            size: 23.sp,
          ),
        ),
        centerTitle: true,
        title: CommonText(
          color: AppColors.titleColor,
          text: ApiEndPoint.notifications,
          fontWeight: FontWeight.w600,
          fontSize: 16.sp,
        ),
      ),

      /// Body Section starts here
      body: GetBuilder<NotificationsController>(
        builder: (controller) {
          return controller.isLoading
              ? Center(child: CircularProgressIndicator(color: Colors.black))
              : controller.notificationList.isEmpty
              ? Center(child: Text("No Data Found"))
              : ListView.builder(
                // controller: controller.scrollController,
                padding: EdgeInsets.symmetric(
                  horizontal: 20.sp,
                  vertical: 10.sp,
                ),
                itemCount: controller.notificationList.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  NotificationModel item = controller.notificationList[index];

                  return NotificationItem(item: item);
                },
              );
        },
      ),
    );
  }
}
