import 'package:mother_care/features/another_screens/nunny_booking/presentation/data/model/nani_booking_all_model.dart';

class NaniSingleBookingModel {
  final bool success;
  final String message;
  final int statusCode;
  final Booking data;

  NaniSingleBookingModel({
    required this.success,
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory NaniSingleBookingModel.fromJson(Map<String, dynamic> json) {
    return NaniSingleBookingModel(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      statusCode: json['statusCode'] ?? 0,
      data: Booking.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "statusCode": statusCode,
    "data": data.toJson(),
  };
}
