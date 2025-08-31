import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mother_care/features/message/presentation/model/chat_list_model.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import '../../../../config/route/app_routes.dart';
import '../../../../component/bottom_nav_bar/common_bottom_bar.dart';
import '../../../../component/other_widgets/common_loader.dart';
import '../../../../component/screen/error_screen.dart';
import '../../../../component/text/common_text.dart';
import '../../../../component/text_field/common_text_field.dart';
import '../controller/chat_controller.dart';
import '../../../../utils/enum/enum.dart';
import '../../../../utils/constants/app_string.dart';
import '../widgets/chat_list_item.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// App Bar Section Starts here
      appBar: AppBar(
        surfaceTintColor: AppColors.transparent,
        shadowColor: AppColors.transparent,
        backgroundColor: AppColors.white,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            size: 23,
            color: AppColors.textFiledColor,
            Icons.arrow_back_ios,
          ),
        ),
        centerTitle: true,
        title: const CommonText(
          text: AppString.inbox,
          fontWeight: FontWeight.w600,
          fontSize: 24,
        ),
      ),

      /// Body Section Starts here
      body: GetBuilder<ChatController>(
        builder:
            (controller) => switch (controller.status) {
              /// Loading bar here
              Status.loading => const CommonLoader(),

              /// Error Handle here
              Status.error => ErrorScreen(
                onTap: ChatController.instance.getChatRepo,
              ),

              /// Show main data here
              Status.completed => Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: Column(
                  children: [
                    /// User Search bar here
                    CommonTextField(
                      controller: controller.searchController,
                      readOnly: true,
                      onSubmitted: (p0) {
                        controller.getChatListFunction();
                      },
                      prefixIcon: const Icon(Icons.search),
                      hintText: AppString.searchDoctor,
                      textInputAction: TextInputAction.search,
                    ),

                    /// Show all Chat List here
                    Expanded(
                      child: Obx(
                        () =>
                            controller.isLoading.value
                                ? Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.black,
                                  ),
                                )
                                : ListView.builder(
                                  itemCount: controller.chatList.length,
                                  padding: EdgeInsets.only(top: 16.h),
                                  itemBuilder: (context, index) {
                                    ChatListModel item =
                                        controller.chatList[index];
                                    return GestureDetector(
                                      onTap: () {
                                        if (item.participants?.length != 0) {
                                          Get.toNamed(
                                            AppRoutes.message,
                                            arguments: item,
                                          );
                                        }
                                      },

                                      /// Chat List item here
                                      child: chatListItem(item: item),
                                    );
                                  },
                                ),
                      ),
                    ),
                  ],
                ),
              ),
            },
      ),

      /// Bottom Navigation Bar Section Starts here
      bottomNavigationBar: const CommonBottomNavBar(currentIndex: 2),
    );
  }
}
