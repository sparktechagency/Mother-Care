import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mother_care/config/api/api_end_point.dart';
import 'package:mother_care/features/another_screens/children/presentation/model/children_list_model.dart';
import 'package:mother_care/services/api/api_service.dart';
import 'package:mother_care/utils/app_utils.dart';

class ChildrenScreenController extends GetxController {
  bool isLoading = false;
  bool isLoadingDelete = false;
  List<ChildrenListModel> childrenList = <ChildrenListModel>[];

  Future<void> getChildrenList() async {
    try {
      isLoading = true;
      update();
      var response = await ApiService.get(
        ApiEndPoint.childrenUrl,
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        childrenList.clear();

        for (var element in response.data["data"]) {
          childrenList.add(ChildrenListModel.fromJson(element));
        }
      }
    } catch (e) {
      Utils.errorSnackBar("Error", "Error From Get Bookmark List $e");
    } finally {
      isLoading = false;
      update();
    }
  }

  Future<void> deleteChildrenItem(ChildrenListModel item) async {
    try {
      isLoadingDelete = true;
      update();
      var response = await ApiService.delete(
        "${ApiEndPoint.childrenUrl}/${item.id}",
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        childrenList.remove(item);
        update();
      }
    } catch (e) {
      Utils.errorSnackBar("Error", "Error From Get Bookmark List $e");
    } finally {
      isLoadingDelete = false;
      update();
    }
  }

  void initDataLoadFunction() {
    try {
      getChildrenList();
    } catch (e) {
      Utils.errorSnackBar("Error", "Error From Init Data Load Function $e");
    }
  }

  @override
  void onInit() {
    initDataLoadFunction();
    super.onInit();
  }
}
