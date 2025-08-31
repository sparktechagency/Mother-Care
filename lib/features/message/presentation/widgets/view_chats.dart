import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mother_care/component/image/common_image.dart';
import 'package:mother_care/features/message/presentation/model/message_get_model.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import 'package:mother_care/utils/time_format/message_date_convert.dart';

Widget showMessage(MessageGetModel item, int index, bool isMe) {
  if (item.type == "text") {
    // if Text value is no null then Show Text
    return Column(
      ///////////////// isMe ? Anyone : It's Me
      crossAxisAlignment:
          isMe ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.sizeOf(Get.context!).width * 0.70,
            // maxWidth: AppSize.size.width * 0.7,
          ),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: isMe ? Color(0xffE5E8EC) : AppColors.primaryColor,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(20),
              topRight: const Radius.circular(20),
              bottomLeft:
                  isMe ? const Radius.circular(0) : const Radius.circular(20),
              bottomRight:
                  isMe ? const Radius.circular(20) : const Radius.circular(0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              // isUrl(item.text ?? "")
              //     ? Material(
              //       color:
              //           Colors.transparent, // Keeps the background transparent
              //       child: InkWell(
              //         onTap: () async {
              //           await launchUrl(Uri.parse(item.text ?? ""));
              //         },
              //         splashColor: Colors.blue.withValues (alpha:
              //           0.3,
              //         ), // Splash effect color
              //         highlightColor: Colors.blue.withValues (alpha:
              //           0.2,
              //         ), // Highlight effect when tapped
              //         child: Text(
              //           item.text ?? "",
              //           textAlign: TextAlign.justify,
              //           style: TextStyle(
              //             fontSize: 16,
              //
              //             height: 1.5,
              //             color: Color(0xff666666),
              //             decorationColor: Colors.blue,
              //             decoration: TextDecoration.underline,
              //           ),
              //         ),
              //       ),
              //     )
              //     :
              Text(
                    // "${isMe} /${item.chatId} /${isMe}",
                    item.text ?? "",
                    style: TextStyle(
                      color: isMe ? Color(0xff666666) : AppColors.white,
                      fontSize: 16,
                      // height: 1.5,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  // Text(
                  //   "i Me Value${isMe} User ID :-${ LocalStorage.userId} Sender ID :-${isMe}",
                  //   // item.text ?? "",
                  //   style: TextStyle(
                  //     color: isMe ? Color(0xff666666) : AppColors.white,
                  //     fontSize: 16,
                  //     // height: 1.5,
                  //     fontWeight: FontWeight.w500,
                  //   ),
                  //   textAlign: TextAlign.justify,
                  // ),
            ],
          ),
        ),
        Text(
          formatDateToTime(item.createdAt ?? ""),
          style: TextStyle(color: Colors.grey, fontSize: 12),

          // formatTimeChat(item.createdAt ?? ""),
        ),
      ],
    );
  } else if (item.type == "image") {

    // if Image value is no null then Show Image
    return Column(
      crossAxisAlignment:isMe?CrossAxisAlignment.end:CrossAxisAlignment.start,
      children: [

        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: CommonImage(
            width: 200,
          fill: BoxFit.fill,

          height: 240,

            // width: MediaQuery.sizeOf(Get.context!).width * 0.70,
            imageSrc: item.images?[0] ?? "",
          ),
        //   //  AppImage(
        //   //   isFullScreen: true,
        //   //   url: item.image,
        //   //   height: 250,
        //   //   fit: BoxFit.fitWidth, rf                                                      b
        //   // ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment:
              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Flexible(
              child: Text(
                // "${isMe} /${item.chatId} /${isMe}",
                formatDateToTime(item.createdAt ?? ""),
                style: TextStyle(     color: isMe ? Color(0xff666666) : AppColors.white, fontSize: 12),

                // formatTimeChat(item.createdAt ?? ""),
              ),
            ),
          ],
        ),
      ],
    );
  }


  return const SizedBox();
}

bool isUrl(String text) {
  final RegExp urlRegExp = RegExp(
    r'^(https?:\/\/)?([\w\-]+(\.[\w\-]+)+)([\w.,@?^=%&:/~+#-]*[\w@?^=%&/~+#-])?$',
    caseSensitive: false,
  );
  return urlRegExp.hasMatch(text);
}
