import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';
import 'package:mother_care/features/another_screens/nani_repository/nani_repository.dart';
import 'package:mother_care/features/another_screens/nunny_booking/presentation/data/model/nani_booking_all_model.dart';

import '../../../../../utils/constants/app_images.dart';

class NunnyHomeController extends GetxController {
  var isAvailableSwitched = false;
  RxBool isloading = false.obs;
  RxBool isLoadingWallet = false.obs;
  int? totalBalance;
  final CarouselSliderController carouselController = CarouselSliderController();
  List<Booking>? todayBooking;

  int sliderIndex = 0;

  updateSliderIndex(int index) {
    sliderIndex = index;
    update();
  }

  void toggleAvailableSwitch(bool value) {
    isAvailableSwitched = value;
    update();
  }

  List sliderImageList = [
    AppImages.sliderOne,
    AppImages.sliderTwo,
    AppImages.sliderThree,
  ];

  void getTodaybookingdata() async {
    try {
      // isloading.value = true;
      todayBooking = await getNannyTodysBookingRepository();
      if (todayBooking != null) {
        update();
      }
    } catch (e) {
      Get.snackbar('Error', '$e');
    } finally {
      isloading.value = false;
      update();
    }
  }

  void wallet() async {
    try {
      isLoadingWallet.value = true;
      var response = await walletRepository();

      if (response != null) totalBalance = response;
      update();
    } catch (e) {
      Get.snackbar('Error', 'Balance Fetching Failed');
    } finally {
      isLoadingWallet.value = false;
    }
  }

  @override
  void onInit() {
    wallet();
    getTodaybookingdata();
    super.onInit();
  }
}
