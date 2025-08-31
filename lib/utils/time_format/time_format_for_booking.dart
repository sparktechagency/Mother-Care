String formatDateforBooking(String input) {
  // Parse the input string to DateTime object
  DateTime date = DateTime.parse(input);

  // List of months to convert the month number to month name
  List<String> months = [
    "January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December"
  ];

  // Format the date as "dd Month yyyy"
  String formattedDate = "${date.day} ${months[date.month - 1]} ${date.year}";

  return formattedDate;
}