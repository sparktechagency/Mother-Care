import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/features/another_screens/parents_home/presentation/controller/nanny_see_all_controller.dart';
import 'package:mother_care/utils/constants/app_colors.dart';


sortDialogBox(NannySeeAllController controller) {
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
                "Sort",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),

             
              Row(
                children: [
                  CommonText(
                    fontSize: 16,
                    bottom: 6,

                    fontWeight: FontWeight.w600,
                    text: "Distance",
                  ),
                ],
              ),
              const SizedBox(height: 5),
 SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: List.generate(controller.distanceList.length, (
                    index,
                  ) {
                    var item = controller.distanceList[index];
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
                              controller.selectedDistanceIndex.value = index;
                              controller.selectedDistanceText.value = item;
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
                                                  .selectedDistanceIndex
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
                    text:"Hourly Rate",
                  ),
                ],
              ),
              const SizedBox(height: 5),
             
        

              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: List.generate(controller.hourRateList.length, (
                    index,
                  ) {
                    var item = controller.hourRateList[index];
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
                              controller.selectedHourRateIndex.value = index;
                              controller.selectedHourRateText.value = item;
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
                                                  .selectedHourRateIndex
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
                    text: "Experience",
                  ),
                ],
              ),
              const SizedBox(height: 5),
             

              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: List.generate(controller.experienceSortList.length, (
                    index,
                  ) {
                    var item = controller.experienceSortList[index];
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
                              controller.selectedExperienceSortIndex.value = index;
                              controller.selectedExperienceSortText.value = item;
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
                                                  .selectedExperienceSortIndex
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
                        controller.applyToSort();
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
                          "Apply Sort",
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
