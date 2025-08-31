import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mother_care/component/text_field/common_text_field.dart';
import 'package:mother_care/features/message/presentation/model/message_get_model.dart';
import 'package:mother_care/features/message/presentation/widgets/view_chats.dart';
import 'package:mother_care/services/storage/storage_services.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import 'package:mother_care/utils/log/app_log.dart';
import '../../../../component/image/common_image.dart';
import '../../../../utils/extensions/extension.dart';
import 'package:get/get.dart';
import '../controller/message_controller.dart';
import '../../../../utils/constants/app_string.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MessageController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.white,
          extendBody: true,
          appBar: AppBar(
            leading: BackButton(
              onPressed: () {
                Get.back();
                // var controller = Get.putOrFind(
                //   () => ProfessionalClientsScreenController(),
                // );
                // controller.getChatListRefresh();
              },
            ),

            forceMaterialTransparency: true,
            title: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: CommonImage(
                      fill: BoxFit.fill,
                      height: 35,
                      width: 35,
                      imageSrc:
                          controller.argItem.participants?[0].profileImage ??
                          "",
                    ),
                  ),
                ).center,
                const SizedBox(width: 10),
                Text(
                  controller.argItem.participants?[0].name ?? "N/A",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          body: RefreshIndicator(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            color: Colors.transparent,
            onRefresh: () async {
              controller.addNewMessageItems();
            },
            child: SafeArea(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.black),
                  );
                }
                return GestureDetector(
                  onTap: () {
                    controller.outSideClick();
                  },
                  child: Container(
                    color: Color(0xffF2F2F2),
                    child:
                        controller.listOfMessageData.isEmpty
                            ? Center(child: Text("No Message Found"))
                            : Column(
                              children: [
                                if (controller.hasMore.value &&
                                    controller.isLoadingMore.value)
                                  const Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: CircularProgressIndicator(
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                  )
                                else
                                  SizedBox(),
                                Expanded(
                                  child: ListView.builder(
                                    reverse: true,
                                    padding: EdgeInsets.only(
                                      bottom: 10,
                                      left: 10,
                                      right: 10,
                                    ),
                                    controller: controller.scrollController,
                                    itemCount:
                                        controller.listOfMessageData.length + 1,
                                    itemBuilder: (context, index) {
                                      // loading indicator for pagination
                                      if (index ==
                                          controller.listOfMessageData.length) {
                                        if (controller.hasMore.value &&
                                            controller.isLoadingMore.value) {
                                          return SizedBox();
                                          // return const Center(
                                          //   child: Padding(
                                          //     padding: EdgeInsets.all(8.0),
                                          //     child: CircularProgressIndicator(
                                          //       color: Colors.black,
                                          //     ),
                                          //   ),
                                          // );
                                        } else {
                                          return SizedBox();
                                        }
                                      }
                                      MessageGetModel item =
                                          controller.listOfMessageData[index];
                                          bool isMe = false;
                                          if (item.sender?.id ?? item.sender ==
                                          LocalStorage.userId) {
                                            isMe = true;
                                            
                                          }else{
                                            isMe = false;
                                          }
                                          appLog("is Me Data ${isMe}");
                                    
                                      return showMessage(item, index, isMe);
                                    },
                                  ),
                                ),
                              ],
                            ),
                  ),
                );
              }),
            ),
          ),

          bottomNavigationBar: Container(
            padding: EdgeInsets.only(top: 10, left: 10.0, right: 20.0,bottom: MediaQuery.of(context).viewInsets.bottom  + 20),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColors.bodyClr.withValues(alpha: 0.5),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(2, 2),
                ),
              ],
              // borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20.0)),
              color: AppColors.white,
            ),
            child: Obx(() {
              if (controller.isOnTextFeild.value) {
                return Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.isOnTextFeild.value = false;
                        controller.update();
                      },
                      icon: const Icon(Icons.keyboard_arrow_right, size: 30),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: CommonTextField(
                          hintText: AppString.messageHere,
                          focusNode:
                              controller.focuse.value == true
                                  ? controller.focusNode
                                  : null,
                          controller: controller.chatController,
                          fillColor: Colors.grey.shade200,
                          textInputAction: TextInputAction.newline,
                        
                          borderColor: Colors.white,
                          borderRadius: 8,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Obx(
                      () => InkWell(
                        onTap: () {
                          if (controller.isSendingMessage.value == false) {
                            controller.sendMessage();
                          }
                        },
                        child:
                            controller.isSendingMessage.value
                                ? CircularProgressIndicator(
                                  color: Colors.black,
                                )
                                : Icon(Icons.send),
                      ),
                    ),
                  ],
                );
              } else {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // controller.isLoadingMore.value
                    //     ? Padding(
                    //       padding: EdgeInsets.all(0),
                    //       child: CircularProgressIndicator(
                    //         color: Colors.black,
                    //       ),
                    //     )
                    //     : const SizedBox(height: 0),
                    controller.isLoadingUploadImage.value
                        ? Padding(
                          padding: EdgeInsets.all(0),
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        )
                        : const SizedBox(height: 0),
                    if (controller.isLoadingUploadImage.value == false)
                      IconButton(
                        onPressed: () {
                          controller.sendImage(ImageSource.gallery);
                        },
                        icon: Icon(Icons.image_outlined),
                      ),
                    if (controller.isLoadingUploadImage.value == false)
                      IconButton(
                        onPressed: () {
                          controller.sendImage(ImageSource.camera);
                        },
                        icon: Icon(Icons.camera_alt_outlined),
                      ),
                    const SizedBox(width: 5),
                    if (controller.chatController.text != "")
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: CommonTextField(
                            hintText: AppString.messageHere,
                            controller: controller.chatController,
                            readOnly: true,
                            onTap: () {
                              controller.isOnTextFeild.value = true;
                              controller.focuse.value = true;
                              controller.update();
                              controller.focuse.value == true
                                  ? controller.focusNode.requestFocus()
                                  : null;
                            },
                            fillColor: Colors.grey.shade200,
                            textInputAction: TextInputAction.newline,
                            onSubmitted: (p0) {},
                            // filled: true,
                            borderColor: Colors.white,
                            borderRadius: 8,
                          ),
                        ),
                      ),
                    const SizedBox(width: 5),
                    if (controller.chatController.text == "")
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: CommonTextField(
                            hintText: AppString.messageHere,
                            readOnly: true,
                            onTap: () {
                              controller.isOnTextFeild.value = true;
                              controller.focuse.value = true;
                              controller.update();
                        
                              controller.focuse.value == true
                                  ? {controller.focusNode.requestFocus()}
                                  : null;
                            },
                            borderColor: Colors.white,
                            borderRadius: 8,
                            fillColor: Colors.grey.shade200,
                            textInputAction: TextInputAction.newline,
                            controller: controller.chatController,
                          ),
                        ),
                      ),
                    const SizedBox(width: 5),
                    Obx(
                      () => IconButton(
                        onPressed: () {
                          if (controller.isSendingMessage.value == false) {
                            controller.sendMessage();
                          }
                        },
                        icon:
                            controller.isSendingMessage.value
                                ? CircularProgressIndicator(
                                  color: Colors.black,
                                )
                                : Icon(Icons.send),
                      ),
                    ),
                  ],
                );
              }
            }),
          ),
        );
      },
    );
  }
}
