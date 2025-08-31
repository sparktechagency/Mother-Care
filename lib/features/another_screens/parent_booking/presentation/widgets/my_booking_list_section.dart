import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mother_care/config/route/app_routes.dart';
import 'package:mother_care/features/another_screens/parent_booking/presentation/controllers/parent_booking_controller.dart';
import 'package:mother_care/features/another_screens/parent_booking/presentation/model/parent_booking_list_model.dart';
import 'booking_item.dart';

class MyBookingListSection extends StatelessWidget {
  const MyBookingListSection({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ParentBookingController(),
      builder: (controller) {
        return      controller.isLoading
            ? Center(
          child: CircularProgressIndicator(color: Colors.black),
        )
            :  ListView.builder(
            itemCount: controller.parentBookingList.length,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,

            itemBuilder: (context, index){
              ParentBookingListModel item = controller.parentBookingList[index];
              return InkWell(
                  onTap: (){
                    // if(controller.selectedBookingType=="Upcoming"){
                    //   NunnyBookingController.instance.updateBookingType(type: "newRequest");
                    // }else if(controller.selectedBookingType=="Ongoing"){
                    //   NunnyBookingController.instance.updateBookingType(type: "onGoing");
                    // }else if(controller.selectedBookingType=="History"){
                    //   NunnyBookingController.instance.updateBookingType(type: "history");
                    // }
                    // Get.toNamed(AppRoutes.nunnyBookingDetailsScreen,arguments: item.id ?? "");
                  },
                  child: BookingItem(item: item));

        });
      }
    );
  }
}
