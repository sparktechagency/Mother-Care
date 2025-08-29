import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/utils/extensions/extension.dart';

import '../../../../../utils/constants/app_colors.dart';
import '../controller/nunny_details_controller.dart';

class AvailabilitySection extends StatelessWidget {
  const AvailabilitySection({super.key, required this.controller});
  final NunnyDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: NunnyDetailsController(),
      builder: (controller) {
        return Column(
          children: [
            if (controller.nannyDetailsData.availability?.length != 0)
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: Column(
                  children: [
                    // Friday
                    5.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonText(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.titleColor,
                          text: "Friday",
                        ),

                        CommonText(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color:
                              controller
                                          .nannyDetailsData
                                          .availability?[0]
                                          .weeklyAvailability
                                          ?.friday
                                          ?.isAvailable ==
                                      true
                                  ? Colors.green
                                  : AppColors.red,
                          text:
                              controller
                                          .nannyDetailsData
                                          .availability?[0]
                                          .weeklyAvailability
                                          ?.friday
                                          ?.isAvailable ==
                                      true
                                  ? "${controller.nannyDetailsData.availability?[0].weeklyAvailability?.friday?.slot?.startTime.toString()} - ${controller.nannyDetailsData.availability?[0].weeklyAvailability?.friday?.slot?.endTime.toString()} "
                                  : "Closed",
                        ),
                      ],
                    ),

                    8.height,

                    Container(
                      height: 1,
                      width: double.infinity,
                      color: AppColors.normalGray2,
                    ),
                    // Saturday
                    5.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonText(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.titleColor,
                          text: "Saturday",
                        ),

                        CommonText(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color:
                              controller
                                          .nannyDetailsData
                                          .availability?[0]
                                          .weeklyAvailability
                                          ?.saturday
                                          ?.isAvailable ==
                                      true
                                  ? Colors.green
                                  : AppColors.red,
                          text:
                              controller
                                          .nannyDetailsData
                                          .availability?[0]
                                          .weeklyAvailability
                                          ?.saturday
                                          ?.isAvailable ==
                                      true
                                  ? "${controller.nannyDetailsData.availability?[0].weeklyAvailability?.saturday?.slot?.startTime.toString()} - ${controller.nannyDetailsData.availability?[0].weeklyAvailability?.friday?.slot?.endTime.toString()} "
                                  : "Closed",
                        ),
                      ],
                    ),

                    8.height,

                    Container(
                      height: 1,
                      width: double.infinity,
                      color: AppColors.normalGray2,
                    ),
                    // Sunday
                    5.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonText(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.titleColor,
                          text: "Sunday",
                        ),

                        CommonText(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color:
                              controller
                                          .nannyDetailsData
                                          .availability?[0]
                                          .weeklyAvailability
                                          ?.sunday
                                          ?.isAvailable ==
                                      true
                                  ? Colors.green
                                  : AppColors.red,
                          text:
                              controller
                                          .nannyDetailsData
                                          .availability?[0]
                                          .weeklyAvailability
                                          ?.sunday
                                          ?.isAvailable ==
                                      true
                                  ? "${controller.nannyDetailsData.availability?[0].weeklyAvailability?.sunday?.slot?.startTime.toString()} - ${controller.nannyDetailsData.availability?[0].weeklyAvailability?.sunday?.slot?.endTime.toString()} "
                                  : "Closed",
                        ),
                      ],
                    ),

                    8.height,

                    Container(
                      height: 1,
                      width: double.infinity,
                      color: AppColors.normalGray2,
                    ),
                    // Monday
                    5.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonText(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.titleColor,
                          text: "Monday",
                        ),

                        CommonText(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color:
                              controller
                                          .nannyDetailsData
                                          .availability?[0]
                                          .weeklyAvailability
                                          ?.monday
                                          ?.isAvailable ==
                                      true
                                  ? Colors.green
                                  : AppColors.red,
                          text:
                              controller
                                          .nannyDetailsData
                                          .availability?[0]
                                          .weeklyAvailability
                                          ?.monday
                                          ?.isAvailable ==
                                      true
                                  ? "${controller.nannyDetailsData.availability?[0].weeklyAvailability?.monday?.slot?.startTime.toString()} - ${controller.nannyDetailsData.availability?[0].weeklyAvailability?.monday?.slot?.endTime.toString()} "
                                  : "Closed",
                        ),
                      ],
                    ),

                    8.height,

                    Container(
                      height: 1,
                      width: double.infinity,
                      color: AppColors.normalGray2,
                    ),
                    // Tuesday
                    5.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonText(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.titleColor,
                          text: "Tuesday",
                        ),

                        CommonText(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color:
                              controller
                                          .nannyDetailsData
                                          .availability?[0]
                                          .weeklyAvailability
                                          ?.tuesday
                                          ?.isAvailable ==
                                      true
                                  ? Colors.green
                                  : AppColors.red,
                          text:
                              controller
                                          .nannyDetailsData
                                          .availability?[0]
                                          .weeklyAvailability
                                          ?.tuesday
                                          ?.isAvailable ==
                                      true
                                  ? "${controller.nannyDetailsData.availability?[0].weeklyAvailability?.tuesday?.slot?.startTime.toString()} - ${controller.nannyDetailsData.availability?[0].weeklyAvailability?.tuesday?.slot?.endTime.toString()} "
                                  : "Closed",
                        ),
                      ],
                    ),

                    8.height,

                    Container(
                      height: 1,
                      width: double.infinity,
                      color: AppColors.normalGray2,
                    ),
                    // Wednesday
                    5.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonText(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.titleColor,
                          text: "Wednesday",
                        ),

                        CommonText(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color:
                              controller
                                          .nannyDetailsData
                                          .availability?[0]
                                          .weeklyAvailability
                                          ?.wednesday
                                          ?.isAvailable ==
                                      true
                                  ? Colors.green
                                  : AppColors.red,
                          text:
                              controller
                                          .nannyDetailsData
                                          .availability?[0]
                                          .weeklyAvailability
                                          ?.wednesday
                                          ?.isAvailable ==
                                      true
                                  ? "${controller.nannyDetailsData.availability?[0].weeklyAvailability?.wednesday?.slot?.startTime.toString()} - ${controller.nannyDetailsData.availability?[0].weeklyAvailability?.wednesday?.slot?.endTime.toString()} "
                                  : "Closed",
                        ),
                      ],
                    ),

                    8.height,

                    Container(
                      height: 1,
                      width: double.infinity,
                      color: AppColors.normalGray2,
                    ),
                    // Thursday
                    5.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonText(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.titleColor,
                          text: "Thursday",
                        ),

                        CommonText(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color:
                              controller
                                          .nannyDetailsData
                                          .availability?[0]
                                          .weeklyAvailability
                                          ?.thursday
                                          ?.isAvailable ==
                                      true
                                  ? Colors.green
                                  : AppColors.red,
                          text:
                              controller
                                          .nannyDetailsData
                                          .availability?[0]
                                          .weeklyAvailability
                                          ?.thursday
                                          ?.isAvailable ==
                                      true
                                  ? "${controller.nannyDetailsData.availability?[0].weeklyAvailability?.thursday?.slot?.startTime.toString()} - ${controller.nannyDetailsData.availability?[0].weeklyAvailability?.thursday?.slot?.endTime.toString()} "
                                  : "Closed",
                        ),
                      ],
                    ),

                    8.height,

                    Container(
                      height: 1,
                      width: double.infinity,
                      color: AppColors.normalGray2,
                    ),
                  ],
                ),
              )
            else
              SizedBox(),

            // 18.height,
            // if (controller.nannyDetailsData.availability?.length != 0)
            //   ListView.builder(
            //     itemCount: controller.availability.length,
            //     physics: NeverScrollableScrollPhysics(),
            //     shrinkWrap: true,

            //     itemBuilder: (context, index) {
            //       var item = controller.availability[index];
            //       return Padding(
            //         padding: EdgeInsets.symmetric(vertical: 4),
            //         child: Column(
            //           children: [
            //             5.height,
            //             Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 CommonText(
            //                   fontSize: 14,
            //                   fontWeight: FontWeight.w400,
            //                   color: AppColors.titleColor,
            //                   text: item["day"],
            //                 ),

            //                 CommonText(
            //                   fontSize: 14,
            //                   fontWeight: FontWeight.w400,
            //                   color:
            //                       item["availability"] == true
            //                           ? Colors.green
            //                           : AppColors.red,
            //                   text: item["time"],
            //                 ),
            //               ],
            //             ),

            //             8.height,

            //             Container(
            //               height: 1,
            //               width: double.infinity,
            //               color: AppColors.normalGray2,
            //             ),
            //           ],
            //         ),
            //       );
            //     },
            //   )
            // else
            //   SizedBox(),
          ],
        );
      },
    );
  }
}
