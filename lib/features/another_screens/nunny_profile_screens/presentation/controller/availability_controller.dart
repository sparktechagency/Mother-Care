import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mother_care/features/another_screens/nani_repository/nani_repository.dart';

class AvailabilityController extends GetxController {
  // Using RxList for reactive updates
  RxList<Map<String, dynamic>> daysOfWeek = <Map<String, dynamic>>[
    {"day": "Sunday", "isOn": false, "startTime": "", "endTime": ""},
    {"day": "Monday", "isOn": false, "startTime": "", "endTime": ""},
    {"day": "Tuesday", "isOn": false, "startTime": "", "endTime": ""},
    {"day": "Wednesday", "isOn": false, "startTime": "", "endTime": ""},
    {"day": "Thursday", "isOn": false, "startTime": "", "endTime": ""},
    {"day": "Friday", "isOn": false, "startTime": "", "endTime": ""},
    {"day": "Saturday", "isOn": false, "startTime": "", "endTime": ""},
  ].obs;

  var isLoading = false;
  String currentTime = "";

  @override
  void onInit() {
    super.onInit();
    loadAvailabilityData();
    update12HourTime();
  }

  List<String> get timesList {
    List<String> times = [];

    // Generate 24-hour time list in 12-hour format
    for (int hour = 1; hour <= 12; hour++) {
      times.add("${hour.toString().padLeft(2, '0')}:00 AM");
      times.add("${hour.toString().padLeft(2, '0')}:30 AM");
    }

    for (int hour = 1; hour <= 12; hour++) {
      times.add("${hour.toString().padLeft(2, '0')}:00 PM");
      times.add("${hour.toString().padLeft(2, '0')}:30 PM");
    }

    return times;
  }

  void update12HourTime() {
    currentTime = DateFormat('h:mm a').format(DateTime.now());
    update(); // Update the UI
  }

  void toggleSwitch(int index) {
    daysOfWeek[index]["isOn"] = !(daysOfWeek[index]["isOn"] as bool);

    // If turning off, clear the time slots
    if (!(daysOfWeek[index]["isOn"] as bool)) {
      daysOfWeek[index]["startTime"] = "";
      daysOfWeek[index]["endTime"] = "";
    }

    update();
  }

  void setStartTime(int index, String time) {
    daysOfWeek[index]["startTime"] = time;
    update();
  }

  void setEndTime(int index, String time) {
    daysOfWeek[index]["endTime"] = time;
    update();
  }

  String convertTo24HourFormat(String time12Hour) {
    if (time12Hour.isEmpty) return "";

    try {
      final DateFormat inputFormat = DateFormat('hh:mm a');
      final DateFormat outputFormat = DateFormat('HH:mm');
      final DateTime dateTime = inputFormat.parse(time12Hour);
      return outputFormat.format(dateTime);
    } catch (e) {
      print('Error converting time: $e');
      return "";
    }
  }

  String convertTo12HourFormat(String time24Hour) {
    if (time24Hour.isEmpty) return "";

    try {
      final DateFormat inputFormat = DateFormat('HH:mm');
      final DateFormat outputFormat = DateFormat('hh:mm a');
      final DateTime dateTime = inputFormat.parse(time24Hour);
      return outputFormat.format(dateTime);
    } catch (e) {
      print('Error converting time: $e');
      return "";
    }
  }

  Map<String, dynamic> prepareApiData() {
    Map<String, dynamic> weeklyAvailability = {};

    for (var dayData in daysOfWeek) {
      String dayName = dayData["day"] as String;
      bool isAvailable = dayData["isOn"] as bool;

      if (isAvailable) {
        String startTime = dayData["startTime"] as String;
        String endTime = dayData["endTime"] as String;

        weeklyAvailability[dayName] = {
          "isAvailable": true,
          "slot": {
            "startTime": convertTo24HourFormat(startTime),
            "endTime": convertTo24HourFormat(endTime),
          },
        };
      } else {
        weeklyAvailability[dayName] = {"isAvailable": false};
      }
    }

    return {"weeklyAvailability": weeklyAvailability};
  }

  void loadDataFromApi(Map<String, dynamic> apiResponse) {
    try {
      Map<String, dynamic> weeklyAvailability = apiResponse["weeklyAvailability"];

      for (int i = 0; i < daysOfWeek.length; i++) {
        String dayName = daysOfWeek[i]["day"] as String;

        if (weeklyAvailability.containsKey(dayName)) {
          var dayInfo = weeklyAvailability[dayName];
          bool isAvailable = dayInfo["isAvailable"] ?? false;

          daysOfWeek[i]["isOn"] = isAvailable;

          if (isAvailable && dayInfo.containsKey("slot")) {
            var slot = dayInfo["slot"];
            daysOfWeek[i]["startTime"] = convertTo12HourFormat(slot["startTime"] ?? "");
            daysOfWeek[i]["endTime"] = convertTo12HourFormat(slot["endTime"] ?? "");
          } else {
            daysOfWeek[i]["startTime"] = "";
            daysOfWeek[i]["endTime"] = "";
          }
        }
      }

      update();
    } catch (e) {
      print('Error loading data from API: $e');
      Get.snackbar("Error", "Failed to load availability data");
    }
  }

  Future<void> loadAvailabilityData() async {
    try {
      isLoading = true;
      update();

      // Use repository to get availability data
      final response = await getAvailabilityRepository();

      if (response.success && response.data != null) {
        loadDataFromApi(response.data!);
      } else {
        print('Failed to load availability: ${response.message}');
      }
    } catch (e) {
      print('Error loading availability: $e');
    } finally {
      isLoading = false;
      update();
    }
  }

  Future<void> saveAvailability() async {
    // Validate that enabled days have both start and end times
    for (var dayData in daysOfWeek) {
      if (dayData["isOn"] as bool) {
        String startTime = dayData["startTime"] as String;
        String endTime = dayData["endTime"] as String;

        if (startTime.isEmpty || endTime.isEmpty) {
          Get.snackbar(
            "Validation Error",
            "Please select both start and end time for ${dayData["day"]}",
            snackPosition: SnackPosition.BOTTOM,
          );
          return;
        }
      }
    }

    try {
      isLoading = true;
      update();

      Map<String, dynamic> requestData = prepareApiData();

      // Use repository to save availability data
      final response = await saveAvailabilityRepository(requestData);

      if (response.success) {
        Get.snackbar(
          "Success",
          response.message ?? "Availability saved successfully!",
          snackPosition: SnackPosition.BOTTOM,
        );

        // Optionally navigate back
        // Get.back();
      } else {
        Get.snackbar(
          "Error",
          response.message ?? "Failed to save availability",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      print('Error saving availability: $e');
      Get.snackbar(
        "Error",
        "Network error. Please check your connection and try again.",
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading = false;
      update();
    }
  }

  bool isValidTimeSelection(int index) {
    if (!(daysOfWeek[index]["isOn"] as bool)) return true;

    String startTime = daysOfWeek[index]["startTime"] as String;
    String endTime = daysOfWeek[index]["endTime"] as String;

    return startTime.isNotEmpty && endTime.isNotEmpty;
  }
}

class ApiResponse<T> {
  final bool success;
  final String? message;
  final int? statusCode;
  final T? data;

  ApiResponse({required this.success, this.message, this.statusCode, this.data});

  factory ApiResponse.fromJson(Map<String, dynamic> json, T Function(dynamic) fromJsonT) {
    return ApiResponse<T>(
      success: json['success'] ?? false,
      message: json['message'],
      statusCode: json['statusCode'],
      data: json['data'] != null ? fromJsonT(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return {
      'success': success,
      'message': message,
      'statusCode': statusCode,
      'data': data != null ? toJsonT(data as T) : null,
    };
  }

  @override
  String toString() {
    return 'ApiResponse{success: $success, message: $message, statusCode: $statusCode, data: $data}';
  }
}


// import 'package:get/get.dart';
// import 'package:intl/intl.dart';

// class AvailabilityController extends GetxController {
//   var daysOfWeek = [
//     {"day": "Sunday", "isOn": false},
//     {"day": "Monday", "isOn": false},
//     {"day": "Tuesday", "isOn": false},
//     {"day": "Wednesday", "isOn": false},
//     {"day": "Thursday", "isOn": false},
//     {"day": "Friday", "isOn": false},
//     {"day": "Saturday", "isOn": false},
//   ];
//   String currentTime = "";


//   List<String> get timesList {
//     List<String> times = [];

//     for (int hour = 1; hour <= 24; hour++) {
//       if (hour < 12) {
//         times.add("${hour} AM");
//       } else {
//         // times.add("${hour} PM");
//       }
//     }
//     return times;
//   }

//   void update12HourTime() {
//     currentTime = DateFormat('h:mm a').format(DateTime.now());
//     update(); // Update the UI
//   }

//   void toggleSwitch(int index) {
//     if (daysOfWeek[index]["isOn"] is bool) {
//       daysOfWeek[index]["isOn"] = !(daysOfWeek[index]["isOn"] as bool);
//       update();
//     }
//   }
// }
