
import 'package:get/get.dart';
import 'package:mother_care/utils/helpers/other_helper.dart';

class GalleryController extends GetxController{
  String? image;


  getImage()async{
    image=await OtherHelper.openGallery();

    update();

      }
}