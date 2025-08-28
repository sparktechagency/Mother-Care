import 'package:intl/intl.dart';

String calculateAge(String? dob) {
  if (dob == null || dob.isEmpty) {
    return "0";
  }

  try {
    DateTime birthDate = DateFormat('yyyy-MM-dd').parse(dob);
    DateTime today = DateTime.now();
    
    int age = today.year - birthDate.year;
    
    // Adjust if birthday hasn't occurred yet this year
    if (today.month < birthDate.month || (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }
    
    return "$age";
  } catch (e) {
    return "0";
  }
}