import 'package:get/get.dart';

class JoinMamaController extends GetxController{

  int selectedSignUpButtonIndex=0;

  updateSignUpSelectedButton(int index){
    selectedSignUpButtonIndex=index;
    update();
  }

}