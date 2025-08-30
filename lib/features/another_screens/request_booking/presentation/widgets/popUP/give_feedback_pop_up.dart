import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mother_care/component/text/common_text.dart';

Future<void> giveFeedbackPopUp(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Dialog(
          // backgroundColor: ConstColour.appDarktBackGround, // dark background
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 246,
                  child: CommonText(
                    text: 'Are you sure you want to cancel this booking?',
                    color: Colors.red,
                    fontSize: 16.h,
                    fontWeight: FontWeight.w700,
                    maxLines: 3,
                  ),
                ),
                SizedBox(height: 15),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [

                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
