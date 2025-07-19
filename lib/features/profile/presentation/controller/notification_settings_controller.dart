
import 'package:get/get.dart';

class NotificationSettingsController extends GetxController{
  var isBookingUpdateSwitched = false;
  var isChatMessageSwitched = false;
  var isPaymentSwitched = false;

  void toggleBookingUpdateSwitch(bool value) {
    isBookingUpdateSwitched = value;
    update();
  }

  void toggleChatMessageSwitch(bool value) {
    isChatMessageSwitched = value;
    update();
  }

  void togglePaymentSwitch(bool value) {
    isPaymentSwitched = value;
    update();
  }

}
