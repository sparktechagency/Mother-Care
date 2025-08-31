import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MultiDatePickerDialog extends StatefulWidget {
  @override
  _MultiDatePickerDialogState createState() => _MultiDatePickerDialogState();
}

class _MultiDatePickerDialogState extends State<MultiDatePickerDialog> {
  List<DateTime> selectedDates = [];

  void _toggleDate(DateTime date) {
    setState(() {
      if (selectedDates.contains(date)) {
        selectedDates.remove(date); // Deselect date
      } else {
        selectedDates.add(date); // Select date
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select Multiple Dates")),
      body: Column(
        children: [
          Expanded(
            child: CalendarDatePicker(
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2101),
              onDateChanged: (date) => _toggleDate(date),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, selectedDates); // Return selected dates
            },
            child: Text("Done"),
          ),
        ],
      ),
    );
  }
}

Future<List<DateTime>> openMultiDatePickerDialog(
TextEditingController controller) async {
final List<DateTime> pickedDates = await showModalBottomSheet<List<DateTime>>(
context: Get.context!,
builder: (context) => MultiDatePickerDialog(),
) ?? [];

// Update controller text with selected dates
if (pickedDates.isNotEmpty) {
String formattedDates = pickedDates
    .map((date) => "${date.day}/${date.month}/${date.year}")
    .join(", ");
controller.text = formattedDates;
}

return pickedDates;
}
