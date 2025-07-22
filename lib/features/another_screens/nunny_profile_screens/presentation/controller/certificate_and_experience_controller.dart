import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mother_care/features/another_screens/nunny_profile_screens/data/preference_model.dart';

class CertificateAndExperienceController extends GetxController{
  List certificateList=[];
  List<PreferenceModel> preferenceList=[
    PreferenceModel(isSelected: false, title: "Infants (0-1)"),
    PreferenceModel(isSelected: false, title: "Toddlers (1-3)"),
    PreferenceModel(isSelected: false, title: "Preschool (3-5)"),
    PreferenceModel(isSelected: false, title: "School age (5-12)"),
    PreferenceModel(isSelected: false, title: "Teenagers (13+)"),
  ];
  TextEditingController addCertificateAndExperienceController=TextEditingController(text: "1");
  TextEditingController experienceController=TextEditingController();
  TextEditingController positionController=TextEditingController();
  TextEditingController companyController=TextEditingController();
  TextEditingController startDateController=TextEditingController();
  TextEditingController endDateController=TextEditingController();
  TextEditingController locationController=TextEditingController();

  List workExperienceList=[];

  int experience=1;


  togglePreference(int index){
    preferenceList[index].isSelected=!preferenceList[index].isSelected;
    update();
  }

  getCertificate( ){
    if(addCertificateAndExperienceController.text.isEmpty){

    }else{
      certificateList.add(addCertificateAndExperienceController.text);
      addCertificateAndExperienceController.clear();
    }

    update();

  }
  addExperience(){
    experience++;
    experienceController.text=experience.toString();

    update();
  }

  minasExperience(){
    if(experience>1)
    experience--;
    experienceController.text=experience.toString();
    update();
  }

  removeCertificate(int index){
    certificateList.removeAt(index);
    update();
  }

  addWorkExperience(List experienceList, position, company, location, startDate, endDate){
    experienceList.add({
      "position":position,
      "company":company,
      "location":location,
      "startDate":startDate,
      "endDate":endDate,
    });

    update();
    positionController.clear();
    companyController.clear();
    locationController.clear();
    startDateController.clear();
    endDateController.clear();
    Get.back();

  }

 removeWorkExperience (int index){
    workExperienceList.removeAt(index);
    update();
  }
}