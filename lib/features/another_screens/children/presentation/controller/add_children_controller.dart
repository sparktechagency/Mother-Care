import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../utils/helpers/other_helper.dart';

class AddChildrenController extends GetxController{
  TextEditingController childNameController =TextEditingController();
  TextEditingController dateControllerController =TextEditingController();

  String genderType="";

  String? image;

  /// select image function here
  getChildImage() async {
    image = await OtherHelper.openGallery();
    update();

  }
  updateGenderType(String gender){
    genderType=gender;
    update();
  }

  clearOption(){
    genderType="";
    update();
  }


}