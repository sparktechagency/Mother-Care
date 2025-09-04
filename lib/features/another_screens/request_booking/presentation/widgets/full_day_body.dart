import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:mother_care/utils/extensions/extension.dart';

import '../../../../../component/text/common_text.dart';
import '../../../../../component/text_field/common_text_field.dart';
import '../../../../../utils/constants/app_string.dart';
import '../controller/request_booking_controller.dart';

class FullDayBody extends StatelessWidget {
  const FullDayBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestBookingController>(
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonText(
              fontSize: 16,
              bottom: 12,
              fontWeight: FontWeight.w600,
              text: AppString.startDate,
            ),

            CommonTextField(
              keyboardType: TextInputType.none,
              controller: controller.startDateController,
              suffixIcon: InkWell(
                onTap: () async {
                  await _showStartCalendar(context, );
                },
                child: Icon(Icons.calendar_month),
              ),
              hintText: "DD/MM/YYYY",
            ),

            20.height,

            CommonText(
              fontSize: 16,
              bottom: 12,
              fontWeight: FontWeight.w600,
              text: AppString.endDate,
            ),

            CommonTextField(
              keyboardType: TextInputType.none,
              controller: controller.endDateController,
              suffixIcon: InkWell(
                onTap: () async {
                  await _showEndCalendar(context, controller);
                },
                child: Icon(Icons.calendar_month),
              ),
              hintText: "DD/MM/YYYY",
            ),





       
          ],
        );
      },
    );
  }

  Future<void> _showStartCalendar(BuildContext context, ) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: SizedBox(
            width: 380,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: GetBuilder<RequestBookingController>(
                builder: (controller) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TableCalendar(
                        firstDay: DateTime(2000, 1, 1),
                        lastDay: DateTime(2100, 12, 31),
                        focusedDay: controller.focusedMonth,
                        availableCalendarFormats: const {CalendarFormat.month: 'Month'},
                        calendarFormat: CalendarFormat.month,
                        headerStyle: const HeaderStyle(formatButtonVisible: false, titleCentered: true),
                        selectedDayPredicate: (day) {
                          final text = controller.startDateController.text.trim();
                          if (text.isEmpty) return false;
                          try {
                            final d = DateFormat('dd/MM/yyyy').parse(text);
                            final compare = DateTime(d.year, d.month, d.day);
                            final dt = DateTime(day.year, day.month, day.day);
                            return compare == dt;
                          } catch (_) { return false; }
                        },
                        enabledDayPredicate: (day) {
                          final now = DateTime.now();
                          final today = DateTime(now.year, now.month, now.day);
                          final d = DateTime(day.year, day.month, day.day);
                          final isFutureOrToday = !d.isBefore(today);
                          return controller.isDateAvailable(day) && isFutureOrToday;
                        },
                        onPageChanged: (focusedDay) {
                          controller.fetchCalendarForMonth(focusedDay);
                        },
                        onDaySelected: (selectedDay, focusedDay) {
                          final now = DateTime.now();
                          final today = DateTime(now.year, now.month, now.day);
                          final d = DateTime(selectedDay.year, selectedDay.month, selectedDay.day);
                          final isFutureOrToday = !d.isBefore(today);
                          if (controller.isDateAvailable(selectedDay) && isFutureOrToday) {
                            final text = DateFormat('dd/MM/yyyy').format(d);
                            controller.startDateController.text = text;
                            // reset end date when start changes
                            controller.endDateController.clear();
                            controller.update();
                            Navigator.of(context).pop();
                          }
                        },
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('Close'),
                          ),
                        ],
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _showEndCalendar(BuildContext context, RequestBookingController controller) async {
    // Require start date first
    if (controller.startDateController.text.trim().isEmpty) {
      // Optionally show a snackbar/toast; here just return
      return;
    }

    DateTime? startDate;
    try {
      startDate = DateFormat('dd/MM/yyyy').parse(controller.startDateController.text);
      startDate = DateTime(startDate.year, startDate.month, startDate.day);
    } catch (_) {
      startDate = null;
    }

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: SizedBox(
            width: 380,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: GetBuilder<RequestBookingController>(
                builder: (c) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TableCalendar(
                        firstDay: DateTime(2000, 1, 1),
                        lastDay: DateTime(2100, 12, 31),
                        focusedDay: c.focusedMonth,
                        availableCalendarFormats: const {CalendarFormat.month: 'Month'},
                        calendarFormat: CalendarFormat.month,
                        headerStyle: const HeaderStyle(formatButtonVisible: false, titleCentered: true),
                        selectedDayPredicate: (day) {
                          final text = c.endDateController.text.trim();
                          if (text.isEmpty) return false;
                          try {
                            final d = DateFormat('dd/MM/yyyy').parse(text);
                            final compare = DateTime(d.year, d.month, d.day);
                            final dt = DateTime(day.year, day.month, day.day);
                            return compare == dt;
                          } catch (_) { return false; }
                        },
                        enabledDayPredicate: (day) {
                          final now = DateTime.now();
                          final today = DateTime(now.year, now.month, now.day);
                          final d = DateTime(day.year, day.month, day.day);
                          final isFutureOrToday = !d.isBefore(today);
                          final s = startDate; // promote to local non-nullable for flow analysis
                          final isAfterOrSameStart = s == null ? true : !d.isBefore(s);
                          return c.isDateAvailable(day) && isFutureOrToday && isAfterOrSameStart;
                        },
                        onPageChanged: (focusedDay) {
                          c.fetchCalendarForMonth(focusedDay);
                        },
                        onDaySelected: (selectedDay, focusedDay) {
                          final now = DateTime.now();
                          final today = DateTime(now.year, now.month, now.day);
                          final d = DateTime(selectedDay.year, selectedDay.month, selectedDay.day);
                          final isFutureOrToday = !d.isBefore(today);
                          final s = startDate; // promote to local non-nullable for flow analysis
                          final isAfterOrSameStart = s == null ? true : !d.isBefore(s);
                          if (c.isDateAvailable(selectedDay) && isFutureOrToday && isAfterOrSameStart) {
                            final text = DateFormat('dd/MM/yyyy').format(d);
                            c.endDateController.text = text;
                            c.dayCountForFullDay();
                            c.update();
                            Navigator.of(context).pop();
                          }
                        },
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('Close'),
                          ),
                        ],
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
