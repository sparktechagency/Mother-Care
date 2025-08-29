import 'package:get/get.dart';
import 'package:mother_care/config/api/api_end_point.dart';
import 'package:mother_care/config/route/app_routes.dart';
import 'package:mother_care/services/api/api_service.dart';

import '../../../../../utils/helpers/other_helper.dart';

class AddPhotoController extends GetxController{
  String? image;
  bool isLoading=false;

  String token="";

  /// select image function here
  getProfileImage() async {
    image = await OtherHelper.openGallery();
   update();

  }

  getToken({tokens}){
    token=tokens;

  }

  addImageRepo()async{
    isLoading=true;
    update();
    
    var response=await ApiService.multipart(ApiEndPoint.profile,imageName: "profileImage", imagePath: image);

    if(response.statusCode==200){
      Get.toNamed(AppRoutes.signIn);
    }

    isLoading=false;
    update();

  }






}