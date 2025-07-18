import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_images.dart';
import '../../../../component/image/common_image.dart';
import '../../../../component/text/common_text.dart';


class ChatBubbleMessage extends StatelessWidget {
  final DateTime time;
  final String text;
  final String image;
  final bool isMe;
  final int index;
  final int messageIndex;

  final VoidCallback onTap;

  const ChatBubbleMessage({
    super.key,
    required this.time,
    required this.text,
    required this.image,
    required this.isMe,
    required this.onTap,
    this.index = 0,
    this.messageIndex = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
                color: isMe?AppColors.primaryColor:AppColors.chatClr                    ),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            child: CommonText(
              maxLines: 5,
              text: text,
              fontSize: 18,
              color:isMe? AppColors.white:AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
