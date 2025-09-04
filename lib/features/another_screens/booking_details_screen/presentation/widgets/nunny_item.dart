import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mother_care/features/another_screens/booking_details_screen/presentation/controller/reschedule_controller.dart';
import 'package:mother_care/features/another_screens/nunny_booking/presentation/data/model/nani_booking_all_model.dart';
import 'package:mother_care/utils/extensions/extension.dart';
import '../../../../../component/image/common_image.dart';
import '../../../../../component/text/common_text.dart';
import '../../../../../utils/constants/app_colors.dart';

class NunnyChildrenItem extends StatelessWidget {
  const NunnyChildrenItem({super.key, required this.item, required this.controller});

  final Child item;
  final RescheduleController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),

      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.normalGray2,
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(2),
            child: ClipOval(
              child: CommonImage(
                fill: BoxFit.cover,
                height: 56,
                width: 56,
                imageSrc:item.childImage,
                // imageSrc: AppImages.female,
              ),
            ),
          ),

          6.width,

          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  text: item.name ,
                ),

                CommonText(
                  top: 2,
                  fontSize: 12,
                  color: AppColors.bodyClr,
                  fontWeight: FontWeight.w400,
                  text: item.gender,
                ),

                CommonText(
                  top: 2,
                  fontSize: 12,
                  color: AppColors.bodyClr,
                  fontWeight: FontWeight.w400,
                  text: item.dateOfBirth
                ),
              ],
            ),
          ),
          // IconButton(
          //   onPressed: () {
          //     Get.toNamed(AppRoutes.addChildrenScreen, arguments: item);
          //   },
          //   icon: Icon(Icons.edit_note_rounded, color: Colors.black),
          // ),
          // IconButton(
          //   onPressed: () {
          //     controller.deleteChildrenItem(item);
          //   },
          //   icon:
          //       controller.isLoadingDelete
          //           ? CupertinoActivityIndicator(color: Colors.black)
          //           : Icon(Icons.delete, color: Colors.red),
          // ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:mother_care/features/another_screens/children/presentation/widget/remove_children_popup.dart';
// import 'package:mother_care/features/another_screens/nunny_booking/presentation/data/model/nani_booking_all_model.dart';
// import 'package:mother_care/utils/extensions/extension.dart';

// import '../../../../../component/image/common_image.dart';
// import '../../../../../component/text/common_text.dart';
// import '../../../../../config/route/app_routes.dart';
// import '../../../../../utils/constants/app_colors.dart';
// import '../../../../../utils/constants/app_images.dart';
// import '../../../../../utils/constants/app_string.dart';

// class ChildrenItem extends StatelessWidget {
//   final Child children;
//   const ChildrenItem({super.key, required this.children});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 8),
//       padding: EdgeInsets.all(12.r),
//       decoration: BoxDecoration(
//         color: AppColors.white,
//         borderRadius: BorderRadius.circular(12.r),
//       ),

//       child: Row(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               color: AppColors.normalGray2,
//               shape: BoxShape.circle,
//             ),
//             padding: EdgeInsets.all(2),
//             child: ClipOval(
//               child: CommonImage(height: 56, width: 56, imageSrc: AppImages.female),
//             ),
//           ),

//           6.width,

//           Expanded(
//             flex: 4,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 CommonText(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w700,
//                   text: "Chinedu Okonkwo  ",
//                 ),

//                 CommonText(
//                   top: 2,
//                   fontSize: 12,
//                   color: AppColors.bodyClr,
//                   fontWeight: FontWeight.w400,
//                   text: "Girl ",
//                 ),

//                 CommonText(
//                   top: 2,
//                   fontSize: 12,
//                   color: AppColors.bodyClr,
//                   fontWeight: FontWeight.w400,
//                   text: "4 Years 9 Months",
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
