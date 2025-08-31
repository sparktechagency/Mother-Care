import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mother_care/features/another_screens/nani_repository/nani_repository.dart';

class NannyWithdrawController extends GetxController {
  RxBool isLoading = false.obs;
  int? totalBalance;

  TextEditingController withDrawController = TextEditingController();

  void withdrawal() async {
    if (withDrawController.text.isNotEmpty) {
      var response = await withdrawRequestRepository(amount: withDrawController.text);

      if (response != null) {
        wallet();
      }
      update();
    } else {
      Get.snackbar('Error', 'Please enter an amount ');
    }
  }

  void wallet() async {
    try {
      isLoading.value = true;
      var response = await walletRepository();

      if (response != null) totalBalance = response;
      update();
    } catch (e) {
      Get.snackbar('Error', 'Balance Fetching Failed');
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    wallet();
    super.onInit();
  }
}
