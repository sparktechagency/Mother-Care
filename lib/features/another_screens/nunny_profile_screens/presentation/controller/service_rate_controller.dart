import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mother_care/features/another_screens/nani_repository/nani_repository.dart';

class ServiceRateController extends GetxController {
  bool isLoading = false;
  bool isSaveLoading=false;

  TextEditingController hourlyRateController = TextEditingController();
  TextEditingController dailyRateController = TextEditingController();

  void save() {
    isSaveLoading=true;
    update();
    serviceRatePutRepository(
      hourlyRate: hourlyRateController.text,
      dailyRate: dailyRateController.text,
    );
    isSaveLoading=false;
    update();
  }

  Future<void> fetchRate() async {
    isLoading = true;
    update();
    var body = await serviceRateGetRepository();
    if (body != null) {
      hourlyRateController.text = body['hourlyRate']?.toString() ?? '';
      dailyRateController.text = body['dayRate']?.toString() ?? '';
    }
    isLoading = false;
    update();
  }

  @override
  void onInit() {
    fetchRate();
    super.onInit();
  }
}
