import 'package:get/get.dart';
import 'package:mother_care/config/api/api_end_point.dart';
import 'package:mother_care/features/another_screens/nunny_booking/presentation/data/model/nani_booking_all_model.dart';
import 'package:mother_care/features/another_screens/nunny_profile_screens/data/preference_model.dart';
import 'package:mother_care/features/another_screens/nunny_profile_screens/presentation/controller/availability_controller.dart';
import 'package:mother_care/services/api/api_service.dart';
import 'package:mother_care/services/storage/storage_services.dart';

import '../nunny_profile_screens/data/gallery_model.dart';

Future<List<Booking>> naniGetAllBookingRepository(int page) async {
  var response = await ApiService.get('${ApiEndPoint.naniAllBookings}?page=$page');

  if (response.statusCode == 200) {
    var naniAllBookingList = response.data['data']['data'] ?? [];

    List<Booking> list = [];

    for (var element in naniAllBookingList) {
      list.add(Booking.fromJson(element));
    }
    return list;
  }
  return [];
}

Future<List<Booking>> naniGetAllHistoryBookingRepository(int page) async {
  var response = await ApiService.get(
    '${ApiEndPoint.naniAllBookings}?page=$page&category=HISTORY',
  );

  if (response.statusCode == 200) {
    var naniAllBookingList = response.data['data']['data'] ?? [];

    List<Booking> list = [];

    for (var element in naniAllBookingList) {
      list.add(Booking.fromJson(element));
    }
    return list;
  }
  return [];
}

Future<List<Booking>> naniGetAllUpcomingBookingRepository(int page) async {
  var response = await ApiService.get(
    '${ApiEndPoint.naniAllBookings}?page=$page&category=UPCOMING',
  );
  if (response.statusCode == 200) {
    var naniAllBookingList = response.data['data']['data'] ?? [];

    List<Booking> list = [];

    for (var element in naniAllBookingList) {
      list.add(Booking.fromJson(element));
    }
    return list;
  }
  return [];
}

Future<List<Booking>> naniGetAllOngoingBookingRepository(int page) async {
  var response = await ApiService.get(
    '${ApiEndPoint.naniAllBookings}?page=$page&category=ONGOING',
  );
  if (response.statusCode == 200) {
    var naniAllBookingList = response.data['data']['data'] ?? [];

    List<Booking> list = [];

    for (var element in naniAllBookingList) {
      list.add(Booking.fromJson(element));
    }
    return list;
  }
  return [];
}

Future<Booking?> getSinglebookingByIdRepository({required String bookingID}) async {
  try {
    var response = await ApiService.get('${ApiEndPoint.naniAllBookings}/$bookingID');
    if (response.statusCode == 200) {
      var singleBookingById = response.data['data'];
      return Booking.fromJson(singleBookingById);
    }
  } catch (e) {
    return null;
  }
  return null;
}

Future<List<Booking>> naniGetAllBookingRequestRepository() async {
  try {
    var response = await ApiService.get(ApiEndPoint.naniBookingRequest);
    if (response.statusCode == 200) {
      var nannyRequestList = response.data["data"]["data"] as List;
      return nannyRequestList.map((json) => Booking.fromJson(json)).toList();
    } else {
      Get.snackbar('Error', 'An error occuerd from Repository');
      return [];
    }
  } on FormatException catch (e) {
    Get.snackbar('Error', 'Contact with backend developer $e');
    return [];
  } catch (e) {
    Get.snackbar('Error ', 'Contact with developer $e');
    return [];
  }
}

void handleBookingActionrepository({
  required String bookingID,
  required String bookingStatus,
}) async {
  try {
    var body = {"bookingStatus": bookingStatus};

    var response = await ApiService.patch(
      '/bookings/me/nanny/$bookingID/status',
      body: body,
    );
    if (response.statusCode == 200) {
      Get.snackbar('Success', response.message);
    }
    if (response.statusCode == 400) {
      Get.snackbar('Error', 'An Error occured. Please contact with developer');
    }
  } catch (e) {
    Get.snackbar('Error', 'An Error occured. Please contact with developer');
  }
}

void bookingSessioneRpository({
  required String bookingID,
  required String bookingStatus,
  required String session,
}) async {
  try {
    var body = {"bookingStatus": bookingStatus};

    var response = await ApiService.patch('/bookings/$bookingID/$session', body: body);
    if (response.statusCode == 200) {
      Get.snackbar('Success', response.message);
    }
    if (response.statusCode == 400) {
      Get.snackbar('Error', 'An Error occured. Please contact with developer');
    }
  } catch (e) {
    Get.snackbar('Error', 'An Error occured. Please contact with developer');
  }
}

void uploadPreferenceRepository(Map<String, dynamic> body) async {
  try {
    var response = await ApiService.post(ApiEndPoint.naniPefrence, body: body);
    if (response.statusCode == 200) {
      Get.snackbar('Success', 'Peference Updated');
    }
  } catch (e) {
    Get.snackbar('Error', 'Error on updating peference. Contact to Developer');
  }
}

Future<NannyPreferenceResponse?> getPreferenceRepository() async {
  try {
    var response = await ApiService.get(
      '${ApiEndPoint.naniPefrence}/${LocalStorage.userId}',
    );
    return NannyPreferenceResponse.fromJson(response.data as Map<String, dynamic>);
  } catch (e) {
    Get.snackbar('Error', 'Error on updating peference. Contact to Developer');
    return null;
  }
}

Future<ApiResponse<Map<String, dynamic>>> getAvailabilityRepository() async {
  try {
    final apiResponse = await ApiService.get(
      '/nanny-availabilities/${LocalStorage.userId}',
    );

    // Convert existing ApiResponseModel to the expected ApiResponse
    return ApiResponse<Map<String, dynamic>>(
      success: apiResponse.statusCode == 200,
      message:
          apiResponse.data['message'] ??
          (apiResponse.statusCode == 200 ? 'Success' : 'Failed'),
      statusCode: apiResponse.statusCode,
      data: apiResponse.statusCode == 200
          ? apiResponse.data['data'] as Map<String, dynamic>?
          : null,
    );
  } catch (e) {
    return ApiResponse<Map<String, dynamic>>(
      success: false,
      message: e.toString(),
      statusCode: null,
      data: null,
    );
  }
}

Future<ApiResponse<Map<String, dynamic>>> saveAvailabilityRepository(
  Map<String, dynamic> availabilityData,
) async {
  try {
    final apiResponse = await ApiService.post(
      '/nanny-availabilities',
      body: availabilityData,
    );

    // Convert your existing ApiResponseModel to the expected ApiResponse
    return ApiResponse<Map<String, dynamic>>(
      success: apiResponse.statusCode == 200 || apiResponse.statusCode == 201,
      message:
          apiResponse.data['message'] ??
          (apiResponse.statusCode == 200 || apiResponse.statusCode == 201
              ? 'Success'
              : 'Failed'),
      statusCode: apiResponse.statusCode,
      data: (apiResponse.statusCode == 200 || apiResponse.statusCode == 201)
          ? apiResponse.data['data'] as Map<String, dynamic>?
          : null,
    );
  } catch (e) {
    return ApiResponse<Map<String, dynamic>>(
      success: false,
      message: e.toString(),
      statusCode: null,
      data: null,
    );
  }
}

Future<void> serviceRatePutRepository({
  required String hourlyRate,
  required String dailyRate,
}) async {
  try {
    Map<String, dynamic> body = {"hourlyRate": hourlyRate, "dayRate": dailyRate};
    var response = await ApiService.put('/nanny-service-rates', body: body);
    if (response.statusCode == 200) {
      Get.snackbar("Success", response.message, snackPosition: SnackPosition.BOTTOM);
    }
  } catch (e) {
    Get.snackbar(
      "Error",
      'Update Service Rate Failed',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}

Future<Map<String, dynamic>?> serviceRateGetRepository() async {
  try {
    var response = await ApiService.get('/nanny-service-rates/${LocalStorage.userId}');
    if (response.statusCode == 200) {
      return response.data["data"];
    }
  } catch (e) {
    Get.snackbar(
      "Error",
      'Fetching Service Rate Failed',
      snackPosition: SnackPosition.BOTTOM,
    );
    return null;
  }
  return null;
}

// Update the existing getCertificationExperience method with better error handling:
Future<NannyCertificationExperienceData?> getCertificationExperience() async {
  try {
    var response = await ApiService.get(
      '${ApiEndPoint.baseUrl}/professional-backgrounds/${LocalStorage.userId}',
    );

    if (response.statusCode == 200) {
      var data = response.data["data"];
      if (data != null) {
        return NannyCertificationExperienceData.fromJson(data);
      }
    }
    return null;
  } catch (e) {
    print('Error in getCertificationExperience: $e');
    // Don't show snackbar here, let controller handle it
    return null;
  }
}

// Update the existing postCertificationExperience method with better response handling:
Future<Map<dynamic, dynamic>?> postCertificationExperience(dynamic body) async {
  try {
    print('Sending POST request with body: $body');
    var response = await ApiService.post('/professional-backgrounds', body: body);

    print('API Response Status: ${response.statusCode}');
    print('API Response Data: ${response.data}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data;
    } else {
      print('API returned error status: ${response.statusCode}');
      return null;
    }
  } catch (e) {
    print('Error in postCertificationExperience: $e');
    // Don't show snackbar here, let controller handle it
    return null;
  }
}

Future<List<GalleryImage>?> fetchImageRepository() async {
  List<GalleryImage> imageList = <GalleryImage>[];
  try {
    var response = await ApiService.get('/nanny-galleries');

    if (response.statusCode == 200) {
      var data = response.data["data"]["images"];

      for (var element in data) {
        imageList.add(GalleryImage.fromJson(element));
      }
    }

    return imageList;
  } catch (e) {
    Get.snackbar(
      'Error',
      'Error on getting nanny gallery image $e . Contact to Developer',
    );
    return imageList;
  }
}

Future<int?> withdrawRequestRepository({required String amount}) async {
  try {
    var body = {"amount": amount};

    var response = await ApiService.post('/withdraws', body: body);

    if (response.statusCode == 200) {
      Get.snackbar(
        "Success",
        'Withdraw Request Completed',
        snackPosition: SnackPosition.BOTTOM,
      );
      return response.statusCode;
    } else {
      Get.snackbar(
        "Error",
        '${response.data["message"]}',
        snackPosition: SnackPosition.BOTTOM,
      );
      return null;
    }
  } catch (e) {
    Get.snackbar(
      "Error",
      'An error occured. Please contact to developer',
      snackPosition: SnackPosition.BOTTOM,
    );
    return null;
  }
}

Future<int?> walletRepository() async {
  try {
    var response = await ApiService.get('/wallets/me');

    if (response.statusCode == 200) {
      return response.data["data"]["balance"] as int;
    } else {
      Get.snackbar(
        "Error",
        '${response.data["message"]}',
        snackPosition: SnackPosition.BOTTOM,
      );
      return null;
    }
  } catch (e) {
    Get.snackbar(
      "Error",
      'An error occured. Please contact to developer',
      snackPosition: SnackPosition.BOTTOM,
    );
    return null;
  }
}

Future<void> sendFeedBackRepository({
  required String bookingId,
  required String toUserId,
  required int ratingValue,
  required String feedback,
}) async {
  try {
    var body = {
      "bookingId": bookingId,
      "toUserId": toUserId,
      "ratingValue": ratingValue,
      "feedback": feedback,
    };

    var response = await ApiService.post('/reviews', body: body);

    if (response.statusCode == 200) {
      Get.snackbar(
        "Success",
        'Thank You for reviewing',
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      Get.snackbar(
        "Error",
        '${response.data["message"]}',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  } catch (e) {
    Get.snackbar(
      "Error",
      'An error occured. Please contact to developer',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}

Future<List<Booking>?> getNannyTodysBookingRepository() async {
  try {
    var response = await ApiService.get('/bookings/me/nanny/request/today');

    if (response.statusCode == 200) {
      var data = response.data["data"]["data"] as List;
      return data.map((e) => Booking.fromJson(e)).toList();
      // return NaniAllBookingModelData.fromJson(response.data["data"]["data"]);
    } else {
      Get.snackbar(
        "Error",
        '${response.data["message"]}',
        snackPosition: SnackPosition.BOTTOM,
      );

      return null;
    }
  } catch (e) {
    Get.snackbar(
      "Error",
      'An error occured. Please contact to developer',
      snackPosition: SnackPosition.BOTTOM,
    );

    return null;
  }
}

// Future<NaniAllBookingModelData?> getNannyTodysBookingRepository() async {
//   try {
//     var response = await ApiService.get('/bookings/me/nanny/request/today');

//     if (response.statusCode == 200) {
//       Get.snackbar(
//         "Success",
//         'Withdraw Request Completed',
//         snackPosition: SnackPosition.BOTTOM,
//       );

//       return NaniAllBookingModelData.fromJson(response.data["data"]);
//     } else {
//       Get.snackbar(
//         "Error",
//         '${response.data["message"]}',
//         snackPosition: SnackPosition.BOTTOM,
//       );

//       return null;
//     }
//   } catch (e) {
//     Get.snackbar(
//       "Error",
//       'An error occured. Please contact to developer',
//       snackPosition: SnackPosition.BOTTOM,
//     );

//     return null;
//   }
// }
