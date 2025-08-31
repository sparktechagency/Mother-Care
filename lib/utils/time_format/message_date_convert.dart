import 'package:intl/intl.dart';

String formatDateToTime(String inputDate) {
  // Parse the input string into a DateTime object
  DateTime dateTime = DateTime.parse(inputDate);
  
  // Format the DateTime object to the desired time format (e.g., 10:00 AM)
  String formattedTime = DateFormat('h:mm a').format(dateTime);
  
  return formattedTime;
}

