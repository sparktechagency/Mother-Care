import 'package:get/get.dart';
import 'package:mother_care/config/api/api_end_point.dart';
import 'package:mother_care/features/another_screens/nunny_profile_screens/data/nanny_review_model.dart';
import 'package:mother_care/services/api/api_service.dart';
import 'package:mother_care/services/storage/storage_services.dart';
import 'package:mother_care/utils/app_utils.dart';

class NannyReviewsController extends GetxController {
  bool isLoading = false;

  NannyReviewsModel nannyReviewDetailsData = NannyReviewsModel();

  /// Get Nanny Details Data function here
  Future<void> getNannyReviwsDetailsData() async {
    try {
      isLoading = true;
      update();

      var response = await ApiService.get(
        "${ApiEndPoint.nannyReviewsRequest}${LocalStorage.userId}",
      );

      if (response.statusCode == 200) {
        nannyReviewDetailsData = NannyReviewsModel.fromJson(response.data["data"]);
      } else {
        Utils.errorSnackBar(response.statusCode, response.message);
      }

      update();
    } catch (e) {
      Utils.errorSnackBar("Error", "error From get nanny details repo Function $e");
    } finally {
      isLoading = false;
      update();
    }
  }

  void initialDataLoadFunction() {
    getNannyReviwsDetailsData();
  }

  @override
  void onInit() {
    initialDataLoadFunction();
    super.onInit();
  }
}
