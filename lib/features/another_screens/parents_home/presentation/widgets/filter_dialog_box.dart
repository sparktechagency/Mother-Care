import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/features/another_screens/parents_home/presentation/controller/nanny_see_all_controller.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import 'package:mother_care/utils/constants/app_string.dart';
import 'package:mother_care/utils/extensions/extension.dart';

userFilterDialogBox(NannySeeAllController controller) {
  Get.dialog(
    Dialog(
      insetPadding: const EdgeInsets.all(10),
      backgroundColor: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              Text(
                "Filters",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 20),
              //
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Hourly Rate",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: AppColors.black,
                    ),
                  ),
                  Theme(
                    data: ThemeData(
                      primaryColor: Colors.red,
                      focusColor: Colors.red,
                      splashColor: Colors.red,
                      hintColor: Colors.red,
                      shadowColor: Colors.red,
                      appBarTheme: const AppBarTheme(
                        backgroundColor: Colors.red,
                      ),
                    ),
                    child: Obx(() {
                      // Update the controller's text with the selectedRateMain value
                      var appInputWidgetTwo = TextFormField(
                        // border: InputBorder.none,
                        // fillColor: AppColors.grey200,
                        // padding: const EdgeInsets.all(0),
                        controller: TextEditingController(
                          text: "${controller.selectedRateMain.value}",
                        ),
                        keyboardType: TextInputType.phone,
                        textAlign: TextAlign.end,
                        textInputAction: TextInputAction.done,
                        // contentPadding: const EdgeInsets.symmetric(),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(4),
                          // TextInputNumberLimit(0, 500),
                        ],
                        // suffixIconConstraints:
                        //     BoxConstraints(maxWidth: AppSize.width(value: 45)),
                        onFieldSubmitted: (value) {
                          try {
                            controller.selectedRateMain.value = double.parse(
                              value,
                            );
                          } catch (e) {
                            controller.selectedRateMain.value = 0;
                          }
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        // suffixIcon: const Center(
                        //     child: AppText(
                        //   data: "\$",
                        //   color: AppColors.primary,
                        //   textAlign: TextAlign.center,
                        // )),
                      );
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (controller.selectedRateMain.value > 0)
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth: 100,
                                minWidth: 50,
                              ),
                              child: appInputWidgetTwo,
                            ),
                          if (controller.selectedRateMain.value > 0)
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: const Text(
                                "to",
                                style: TextStyle(color: AppColors.black),
                              ),
                            ),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: 100,
                              minWidth: 50,
                            ),
                            child: TextFormField(
                              // border: InputBorder.none,
                              // fillColor: AppColors.grey200,
                              // elevationColor: Colors.red,
                              // padding: const EdgeInsets.all(0),
                              controller: TextEditingController(
                                text: "${controller.selectedRateMax.value}",
                              ),
                              keyboardType: TextInputType.phone,
                              textInputAction: TextInputAction.done,
                              textAlign: TextAlign.end,
                              // contentPadding: const EdgeInsets.symmetric(),
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(4),
                                // TextInputNumberLimit(0, 9999),
                              ],
                              // suffixIconConstraints: BoxConstraints(
                              //     maxWidth: AppSize.width(value: 45)),
                              onFieldSubmitted: (value) {
                                try {
                                  controller
                                      .selectedRateMax
                                      .value = double.parse(value);
                                } catch (e) {
                                  controller.selectedRateMax.value = 0;
                                }
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                              // suffixIcon: const Center(
                              //     child: AppText(
                              //   data: "\$",
                              //   color: AppColors.black400,
                              //   textAlign: TextAlign.center,
                              // )),
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Obx(
                () => FlutterSlider(
                  handlerHeight: 20,
                  max: 500.0,
                  min: 0.0,
                  rangeSlider: true,
                  values: [
                    controller.selectedRateMain.value,
                    controller.selectedRateMax.value,
                  ],
                  onDragging: (handlerIndex, lowerValue, upperValue) {
                    // Update the values when the slider is dragged
                    controller.selectedRateMain.value = lowerValue;
                    controller.selectedRateMax.value = upperValue;
                  },
                  trackBar: FlutterSliderTrackBar(
                    inactiveTrackBarHeight: 3,
                    activeTrackBarHeight: 5,
                    activeTrackBar: BoxDecoration(
                      color: AppColors.black,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    inactiveTrackBar: BoxDecoration(
                      color: AppColors.black,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  tooltip: FlutterSliderTooltip(
                    alwaysShowTooltip: false,
                    direction: FlutterSliderTooltipDirection.top,
                    positionOffset: FlutterSliderTooltipPositionOffset(top: 0),
                    boxStyle: const FlutterSliderTooltipBox(
                      decoration: BoxDecoration(color: Colors.transparent),
                    ),
                    textStyle: const TextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    format: (value) {
                      return value;
                    },
                  ),
                  rightHandler: FlutterSliderHandler(
                    decoration: const BoxDecoration(),
                    child: Material(
                      type: MaterialType.circle,
                      color: AppColors.black,
                      elevation: 3,
                      child: Container(margin: const EdgeInsets.all(5)),
                    ),
                  ),
                  handler: FlutterSliderHandler(
                    decoration: const BoxDecoration(),
                    child: Material(
                      type: MaterialType.circle,
                      color: AppColors.black,
                      elevation: 3,
                      child: Container(margin: const EdgeInsets.all(5)),
                    ),
                  ),
                ),
              ),

              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("\$1", style: TextStyle(color: AppColors.black)),
                  Text("\$500", style: TextStyle(color: AppColors.black)),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  CommonText(
                    fontSize: 16,
                    bottom: 6,

                    fontWeight: FontWeight.w600,
                    text: AppString.gender,
                  ),
                ],
              ),
              const SizedBox(height: 5),

              Obx(
                () => Row(
                  children: [
                    SizedBox(
                      height: 24,
                      width: 24,
                      child: Checkbox(
                        activeColor: AppColors.primaryColor,

                        side: BorderSide(
                          color: AppColors.primaryColor,
                          width: 2,
                        ),
                        value: controller.genderType.value == "MALE",

                        onChanged: (v) {
                          if (v == true) {
                            controller.updateGenderType("MALE");
                          } else {
                            controller.clearOption();
                          }
                        },
                      ),
                    ),
                    CommonText(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.bodyClr,
                      text: "MALE",
                    ),

                    35.width,
                    SizedBox(
                      height: 24,
                      width: 24,
                      child: Checkbox(
                        side: BorderSide(
                          color: AppColors.primaryColor,
                          width: 2,
                        ),
                        activeColor: AppColors.primaryColor,

                        value: controller.genderType.value == "FEMALE",

                        onChanged: (v) {
                          if (v == true) {
                            controller.updateGenderType("FEMALE");
                          } else {
                            controller.clearOption();
                          }
                        },
                      ),
                    ),

                    CommonText(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.bodyClr,
                      text: "FEMALE",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  CommonText(
                    fontSize: 16,
                    bottom: 6,

                    fontWeight: FontWeight.w600,
                    text:"Experience Level",
                  ),
                ],
              ),
              const SizedBox(height: 5),
             
        

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(controller.experienceList.length, (
                    index,
                  ) {
                    var item = controller.experienceList[index];
                    return Obx(
                      () => Padding(
                        padding: const EdgeInsets.only(
                          left: 5,
                          right: 5,
                          bottom: 5,
                          top: 2,
                        ),
                        child: Material(
                          elevation: 1,
                          borderRadius: BorderRadius.circular(5),
                          child: InkWell(
                            onTap: () {
                              controller.selectedExperienceIndex.value = index;
                              controller.selectedExperienceText.value = item;
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),

                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1.5,
                                  color:
                                      controller
                                                  .selectedExperienceIndex
                                                  .value ==
                                              index
                                          ? AppColors.black
                                          : Colors.transparent,
                                ),
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                item,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 15),

                   Row(
                children: [
                  CommonText(
                    fontSize: 16,
                    bottom: 6,

                    fontWeight: FontWeight.w600,
                    text: "Max Kid Manage",
                  ),
                ],
              ),
              const SizedBox(height: 5),
             

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(controller.maxKidManageList.length, (
                    index,
                  ) {
                    var item = controller.maxKidManageList[index];
                    return Obx(
                      () => Padding(
                        padding: const EdgeInsets.only(
                          left: 5,
                          right: 5,
                          bottom: 5,
                          top: 2,
                        ),
                        child: Material(
                          elevation: 1,
                          borderRadius: BorderRadius.circular(5),
                          child: InkWell(
                            onTap: () {
                              controller.selectedMaxKidManageIndex.value =
                                  index;
                              controller.selectedMaxKidManageText.value = item;
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),

                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1.5,
                                  color:
                                      controller
                                                  .selectedMaxKidManageIndex
                                                  .value ==
                                              index
                                          ? AppColors.black
                                          : Colors.transparent,
                                ),
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                item,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 10),
                  Row(
                children: [
                  CommonText(
                    fontSize: 16,
                    bottom: 6,

                    fontWeight: FontWeight.w600,
                    text:    "Rating",
                  ),
                ],
              ),
              const SizedBox(height: 5),
             
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(controller.rateList.length, (index) {
                    var item = controller.rateList[index];
                    return Obx(
                      () => Padding(
                        padding: const EdgeInsets.only(
                          left: 5,
                          right: 5,
                          bottom: 5,
                          top: 2,
                        ),
                        child: Material(
                          elevation: 1,
                          borderRadius: BorderRadius.circular(5),
                          child: InkWell(
                            onTap: () {
                              controller.selectedRateIndex.value = index;
                              controller.selectedRateText.value = item;
                              // if (isSelected) {
                              //   controller.slectedShoesSizeList.remove(item);
                              //   controller.update();
                              // } else {
                              //   controller.slectedShoesSizeList.add(item);
                              //   controller.update();
                              // }
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              // height: 40,
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1.5,
                                  color:
                                      controller.selectedRateIndex.value ==
                                              index
                                          ? AppColors.black
                                          : Colors.transparent,
                                ),
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: AppColors.black,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    item,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 30),

              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
               
                        Get.back();
                      },
                      child: Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(5),
                        width: Get.width,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.red),
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: const Text(
                          "Cancel",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        controller.applyToFillter();
                        // Get.closeAllDialogs();
                      },
                      child: Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(5),
                        width: Get.width,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white10),
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: const Text(
                          "Apply Filter",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    ),
  );
}
