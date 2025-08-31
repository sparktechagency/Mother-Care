import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mother_care/features/another_screens/request_booking/presentation/controller/request_booking_controller.dart';
import 'package:mother_care/utils/extensions/extension.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../../component/other_widgets/common_loader.dart';


class PaymentViewScreen extends StatelessWidget {
  const PaymentViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),


      body: GetBuilder<RequestBookingController>(
          builder: (controller) {
            return SingleChildScrollView(
              child:

              controller.isPaymentLoading==true?SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    250.height,
                    CommonLoader()
                  ],
                ),
              ):
              Column(
                children: [
                  SizedBox(
                    height: Get.height,
                    width: double.infinity,
                    child: WebViewWidget(controller: controller.webViewController!),
                  ),
                ],
              ),
            );
          }
      ),
    );
  }
}
