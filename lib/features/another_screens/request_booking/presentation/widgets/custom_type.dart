import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mother_care/utils/constants/app_colors.dart';
import 'package:intl/intl.dart';
import '../../../../../component/text/common_text.dart';
import '../../../../../utils/constants/app_string.dart';
import '../controller/request_booking_controller.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomType extends StatelessWidget {
  CustomType({super.key});

  final RequestBookingController dateControllerState = Get.find<RequestBookingController>();

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
              text: AppString.selectDate,
            ),

          
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: AppColors.normalGray2),
              ),
              padding: EdgeInsets.all(8.r),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: controller.selectedDates.isNotEmpty
                        ? GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 3.2,
                              crossAxisSpacing: 6,
                              mainAxisSpacing: 6,
                            ),
                            itemCount: controller.selectedDates.length,
                            itemBuilder: (context, index) {
                              final date = controller.selectedDates[index];
                              final text = DateFormat('dd/MM/yyyy').format(date);
                              return Container(
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  border: Border.all(color: AppColors.normalGray2),
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: CommonText(
                                        fontSize: 10,
                                        text: text,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () => controller.removeDate(date),
                                      child: const Icon(Icons.close, size: 14),
                                    ),
                                  ],
                                ),
                              );
                            },
                          )
                        : CommonText(
                          text: "No dates selected",
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black,
                        ),
                  ),
                  SizedBox(width: 8.w),
                  InkWell(
                    onTap: () {
                      _showDatePicker(context);
                    },
                    child: const Icon(Icons.calendar_month),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),

            // Removed date text field in favor of the calendar icon in the container above





          ],
        );
      },
    );
  }

  void _showDatePicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: SizedBox(
            width: 380,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: CustomCalendar(),
            ),
          ),
        );
      },
    );
  }
}

class CustomCalendar extends StatefulWidget {
  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  final RequestBookingController controller = Get.find<RequestBookingController>();

  @override
  void initState() {
    super.initState();
    controller.fetchCalendarForMonth(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestBookingController>(
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
              selectedDayPredicate: (day) => controller.isDateSelected(day),
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
                  if (controller.isDateSelected(selectedDay)) {
                    controller.removeDate(selectedDay);
                  } else {
                    controller.addDate(selectedDay);
                  }
                }
              },
              calendarBuilders: CalendarBuilders(
                defaultBuilder: (context, day, focusedDay) {
                  final isAvailable = controller.isDateAvailable(day);
                  final now = DateTime.now();
                  final today = DateTime(now.year, now.month, now.day);
                  final d = DateTime(day.year, day.month, day.day);
                  final isFutureOrToday = !d.isBefore(today);
                  final isDisabled = !(isAvailable && isFutureOrToday);
                  return _buildDayCell(day, isAvailable, controller.isDateSelected(day), isDisabled: isDisabled);
                },
                todayBuilder: (context, day, focusedDay) {
                  final isAvailable = controller.isDateAvailable(day);
                  final now = DateTime.now();
                  final today = DateTime(now.year, now.month, now.day);
                  final d = DateTime(day.year, day.month, day.day);
                  final isFutureOrToday = !d.isBefore(today);
                  final isDisabled = !(isAvailable && isFutureOrToday);
                  return _buildDayCell(day, isAvailable, controller.isDateSelected(day), isToday: true, isDisabled: isDisabled);
                },
                selectedBuilder: (context, day, focusedDay) {
                  return _buildDayCell(day, true, true);
                },
                disabledBuilder: (context, day, focusedDay) {
                  // days outside current month or explicitly disabled by TableCalendar
                  return _buildDayCell(day, false, false, isDisabled: true);
                },
              ),
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
    );
  }

  Widget _buildDayCell(DateTime day, bool isAvailable, bool isSelected, {bool isToday = false, bool isDisabled = false}) {
    final baseColor = isSelected
        ? Colors.blue
        : isAvailable
            ? Colors.green.shade100
            : Colors.grey.shade200;
    final textColor = isSelected
        ? Colors.white
        : isAvailable
            ? Colors.black
            : Colors.grey;
    return Container(
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: baseColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: isToday ? Colors.orange : Colors.grey.shade300),
      ),
      child: Center(
        child: Text(
          '${day.day}',
          style: TextStyle(color: textColor, fontWeight: isSelected ? FontWeight.bold : FontWeight.normal),
        ),
      ),
    );
  }
}
