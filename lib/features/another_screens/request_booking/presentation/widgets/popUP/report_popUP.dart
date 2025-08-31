import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mother_care/component/button/common_button.dart';
import 'package:mother_care/component/image/common_image.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/component/text_field/common_text_field.dart';
import 'package:mother_care/features/another_screens/request_booking/presentation/widgets/popUP/controller/report_controller.dart';
import 'package:mother_care/utils/constants/app_colors.dart';

Future<void> showReportPopup(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: const ReportPopup(),
      );
    },
  );
}

class ReportPopup extends StatelessWidget {
  const ReportPopup({super.key});

  @override
  Widget build(BuildContext context) {
    final ReportController controller = Get.put(ReportController());

    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CommonImage(imageSrc: 'assets/images/reportIcon.png'),
            const SizedBox(height: 17),

            const CommonText(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              text: "Report an Issue",
            ),
            const SizedBox(height: 21),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CommonText(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  text: "Select topic",
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 12),
                //  Dropdown for report reason
                Obx(
                  () => DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                    ),
                    hint: const Text("Select a reason"),
                    value: controller.selectedReason.value.isEmpty
                        ? null
                        : controller.selectedReason.value,
                    items: controller.reasons
                        .map(
                          (reason) => DropdownMenuItem<String>(
                            value: reason,
                            child: Text(reason),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value != null) controller.setReason(value);
                    },
                  ),
                ),

                const SizedBox(height: 12),

                const CommonText(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  text: "Describe the Problem",
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 12),
                CommonTextField(
                  controller: controller.reportTextController,
                  maxline: 2,
                  borderRadius: 8,
                  hintText: "Describe the issue (optional)",
                  borderColor: AppColors.titleColorSecondary,
                ),
              ],
            ),

            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: CommonButton(
                    buttonRadius: 100,
                    titleText: 'Cancle',
                    titleColor: Colors.red,
                    borderColor: Colors.red,
                    buttonColor: Colors.transparent,
                    onTap: () => Get.back(),
                  ),
                ),
                SizedBox(width: 24),
                Expanded(
                  child: CommonButton(
                    buttonRadius: 100,
                    titleText: "Submit",
                    titleColor: Colors.white,
                    buttonColor: Colors.green,
                    borderColor: Colors.transparent,
                    onTap: () => controller.submitReport,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
