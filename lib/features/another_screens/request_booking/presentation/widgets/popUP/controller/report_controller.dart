import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportController extends GetxController {
  var selectedReason = "".obs;
  final reportTextController = TextEditingController();

  final List<String> reasons = [
    "Inappropriate Content",
    "Spam or Scam",
    "Harassment",
    "False Information",
    "Other",
  ];

  void setReason(String value) {
    selectedReason.value = value;
  }

  void submitReport() {
    final reason = selectedReason.value;
    final details = reportTextController.text;

    print("Report Submitted -> Reason: $reason, Details: $details");

    // TODO: send report to API
    Get.back(); // close popup
  }

  @override
  void onClose() {
    reportTextController.dispose();
    super.onClose();
  }
}
