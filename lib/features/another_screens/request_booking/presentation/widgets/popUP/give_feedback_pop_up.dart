import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:mother_care/component/button/common_button.dart';
import 'package:mother_care/component/image/common_image.dart';
import 'package:mother_care/component/text/common_text.dart';
import 'package:mother_care/component/text_field/common_text_field.dart';
import 'package:mother_care/features/another_screens/booking_details_screen/presentation/controller/reschedule_controller.dart';
import 'package:mother_care/features/another_screens/request_booking/presentation/widgets/popUP/controller/show_rating_controller.dart';
import 'package:mother_care/utils/constants/app_colors.dart';

Future<void> giveFeedbackPopUp({
  required BuildContext context,
  required RescheduleController singleBookingController,
}) {
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: FeedbackPopup(singleBookingController: singleBookingController),
      );
    },
  );
}

class FeedbackPopup extends StatelessWidget {
  final RescheduleController singleBookingController;
  const FeedbackPopup({super.key, required this.singleBookingController});

  @override
  Widget build(BuildContext context) {
    final FeedbackController controller = Get.put(FeedbackController());

    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CommonImage(imageSrc: 'assets/images/rateAppExperienceIcon.png'),
            const SizedBox(height: 17),
            const CommonText(
              text: "Rate Your App Experience",
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
            const SizedBox(height: 12),

            // ⭐ Rating Bar
            Obx(
              () => RatingBar.builder(
                initialRating: controller.rating.value,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) =>
                    const Icon(Icons.star, color: AppColors.primaryColor),
                onRatingUpdate: (rating) {
                  controller.setRating(rating);
                },
              ),
            ),
            const SizedBox(height: 29),

            Align(
              alignment: Alignment.centerLeft,
              child: const CommonText(
                text: "Write Your feedback",
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12),
            CommonTextField(
              borderColor: AppColors.titleColorSecondary,
              fillColor: Colors.transparent,
              controller: controller.feedbackController,
              maxline: 3,
              hintText: "Give your feedback here",
              borderRadius: 8,
            ),

            const SizedBox(height: 12),

            // ✅ Cancel / Submit Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: CommonButton(
                    buttonRadius: 100,
                    titleText: 'Cancle',
                    titleColor: Colors.red,
                    borderColor: Colors.red,
                    buttonColor: Colors.transparent,
                    onTap: () => controller.cancleButton(),
                  ),
                ),
                SizedBox(width: 24),
                Expanded(
                  child: CommonButton(
                    buttonRadius: 100,
                    titleText: "Submit",
                    titleColor: Colors.white,
                    buttonColor: Colors.green,
                    borderColor: Colors.transparent,
                    onTap: () => controller.submitFeedback(singleBookingController),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
