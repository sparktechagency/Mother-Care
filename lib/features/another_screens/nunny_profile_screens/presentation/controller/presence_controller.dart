import 'package:get/get.dart';
import 'package:mother_care/features/another_screens/nani_repository/nani_repository.dart';

import '../../data/preference_model.dart';

class PresenceController extends GetxController {

  bool isLoading=false;

  List<PreferenceModel> preferenceList = [
    PreferenceModel(isSelected: false, title: "Infants (0-1)"),
    PreferenceModel(isSelected: false, title: "Toddlers (1-3)"),
    PreferenceModel(isSelected: false, title: "Preschool (3-5)"),
    PreferenceModel(isSelected: false, title: "School age (5-12)"),
    PreferenceModel(isSelected: false, title: "Teenagers (13+)"),
  ];

  List<PreferenceModel> serviceOfferList = [
    PreferenceModel(isSelected: false, title: "Newborn care"),
    PreferenceModel(isSelected: false, title: "Homework help"),
    PreferenceModel(isSelected: false, title: "Meal preparation"),
    PreferenceModel(isSelected: false, title: "Light housekeeping"),
    PreferenceModel(isSelected: false, title: "Overnight care"),
    PreferenceModel(isSelected: false, title: "Special needs care"),
    PreferenceModel(isSelected: false, title: "Pet care"),
  ];

  List<PreferenceModel> sendPreferenceList = [
    PreferenceModel(isSelected: false, title: "INFANTS_0_1"),
    PreferenceModel(isSelected: false, title: "TODDLERS_1_3"),
    PreferenceModel(isSelected: false, title: "PRE_SCHOOL_3_5"),
    PreferenceModel(isSelected: false, title: "SCHOOL_AGE_5_12"),
    PreferenceModel(isSelected: false, title: "TEENAGERS_13_PLUS"),
  ];

  List<PreferenceModel> sendServiceOfferList = [
    PreferenceModel(isSelected: false, title: "NEW_BORN_CARE"),
    PreferenceModel(isSelected: false, title: "HOME_WORK_HELP"),
    PreferenceModel(isSelected: false, title: "MEAL_PREPARATION"),
    PreferenceModel(isSelected: false, title: "LIGHT_HOUSE_KEEPING"),
    PreferenceModel(isSelected: false, title: "OVER_NIGHT_CARE"),
    PreferenceModel(isSelected: false, title: "SPECIAL_NEEDS_CARE"),
    PreferenceModel(isSelected: false, title: "PET_CARE"),
  ];

  togglePreference(int index) {
    preferenceList[index].isSelected = !preferenceList[index].isSelected;
    sendPreferenceList[index].isSelected = preferenceList[index].isSelected;
    update();
  }

  toggleOffer(int index) {
    serviceOfferList[index].isSelected = !serviceOfferList[index].isSelected;
    sendServiceOfferList[index].isSelected = serviceOfferList[index].isSelected;
    update();
  }

  void uploadPefrence() {
    update();
    List<String> selectedAgeGroups = sendPreferenceList
        .where((item) => item.isSelected)
        .map((item) => item.title)
        .toList();

    final selectedServices = sendServiceOfferList
        .where((item) => item.isSelected)
        .map((item) => item.title)
        .toList();

    final body = {
      "ageGroupsYouWorkWith": selectedAgeGroups,
      "serviceYouOffer": selectedServices,
    };

    uploadPreferenceRepository(body);
  }

  // mapping between API keys and UI titles
  final Map<String, String> preferenceMap = {
    "INFANTS_0_1": "Infants (0-1)",
    "TODDLERS_1_3": "Toddlers (1-3)",
    "PRE_SCHOOL_3_5": "Preschool (3-5)",
    "SCHOOL_AGE_5_12": "School age (5-12)",
    "TEENAGERS_13_PLUS": "Teenagers (13+)",
  };

  final Map<String, String> serviceMap = {
    "NEW_BORN_CARE": "Newborn care",
    "HOME_WORK_HELP": "Homework help",
    "MEAL_PREPARATION": "Meal preparation",
    "LIGHT_HOUSE_KEEPING": "Light housekeeping",
    "OVER_NIGHT_CARE": "Overnight care",
    "SPECIAL_NEEDS_CARE": "Special needs care",
    "PET_CARE": "Pet care",
  };

  void getPreference() async {
    isLoading=true;
    update();
    NannyPreferenceResponse? data = await getPreferenceRepository();
    if (data == null) return;

    // Update API level
    _updateSelection(sendPreferenceList, data.data.ageGroupsYouWorkWith);
    _updateSelection(sendServiceOfferList, data.data.serviceYouOffer);

    // Update UI level
    _updateUiSelection(preferenceList, data.data.ageGroupsYouWorkWith, preferenceMap);
    _updateUiSelection(serviceOfferList, data.data.serviceYouOffer, serviceMap);
    isLoading=false;
    update();
  }

  /// Updates API-level lists (titles are same as API response)
  void _updateSelection(List<PreferenceModel> localList, List<String> apiList) {
    for (var item in localList) {
      item.isSelected = apiList.contains(item.title);
    }
  }

  /// Updates UI-level lists using a map (API key -> UI title)
  void _updateUiSelection(
    List<PreferenceModel> uiList,
    List<String> apiList,
    Map<String, String> map,
  ) {
    for (var item in uiList) {
      item.isSelected = apiList.any((apiValue) => map[apiValue] == item.title);
    }
  }

  @override
  void onInit() {
    getPreference();
    super.onInit();
  }
}
