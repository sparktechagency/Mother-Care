import 'package:get/get.dart';

import '../../data/preference_model.dart';

class PresenceController extends GetxController{


  List<PreferenceModel> preferenceList=[
    PreferenceModel(isSelected: false, title: "Infants (0-1)"),
    PreferenceModel(isSelected: false, title: "Toddlers (1-3)"),
    PreferenceModel(isSelected: false, title: "Preschool (3-5)"),
    PreferenceModel(isSelected: false, title: "School age (5-12)"),
    PreferenceModel(isSelected: false, title: "Teenagers (13+)"),
  ];

  List<PreferenceModel> serviceOfferList=[
    PreferenceModel(isSelected: false, title: "Newborn care"),
    PreferenceModel(isSelected: false, title: "Homework help"),
    PreferenceModel(isSelected: false, title: "Meal preparation"),
    PreferenceModel(isSelected: false, title: "Light housekeeping"),
    PreferenceModel(isSelected: false, title: "Overnight care"),
    PreferenceModel(isSelected: false, title: "Special needs care"),
    PreferenceModel(isSelected: false, title: "Pet care"),
  ];

  togglePreference(int index){
    preferenceList[index].isSelected=!preferenceList[index].isSelected;
    update();
  }

  toggleOffer(int index){
    serviceOfferList[index].isSelected=!serviceOfferList[index].isSelected;
    update();
  }

}