import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mother_care/config/api/api_end_point.dart';
import 'package:mother_care/features/another_screens/children/presentation/model/children_list_model.dart';
import 'package:mother_care/services/api/api_service.dart';
import 'package:mother_care/utils/app_utils.dart';
import 'package:mother_care/utils/helpers/other_helper.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../../config/route/app_routes.dart';
import '../../data/model/time_slote_model.dart';
import '../widgets/payment_success_popup.dart';

class RequestBookingController extends GetxController {
  bool isBabySelect = false;
  bool isTermsSelect = false;

  WebViewController? webViewController;

  var paymentUrl = "";

  int dayCount = 0;
  bool isLoading = false;
  bool isPaymentLoading = false;

  String id = "";
  String hourlyRate="";
  String dailyRate="";
  String extraBabyCharge="";
  String duration="";
  num totalEstmate=0;

  List childrenIdList = [];
  List selectedHourList = [];

  List<ChildrenListModel> childrenList = [];

  getId(nannyId, dailyRetes, hourlyRates) {
    id = nannyId;
    hourlyRate=hourlyRates;
    dailyRate=dailyRetes;

  }


  //======================multiple select date with availability=================
  final selectedDates = <DateTime>[]; // dates without time component
  final availableDates = <DateTime>{}; // from API, dates without time
  DateTime focusedMonth = DateTime(DateTime.now().year, DateTime.now().month);

  DateTime _dateOnly(DateTime d) => DateTime(d.year, d.month, d.day);

  void addDate(DateTime date) {
    final d = _dateOnly(date);
    if (!selectedDates.any((e) => _dateOnly(e) == d)) {
      selectedDates.add(d);

      _updateChooseDateTextField();
      update();
    }
  }

  void removeDate(DateTime date) {
    final d = _dateOnly(date);
    selectedDates.removeWhere((e) => _dateOnly(e) == d);
  
    _updateChooseDateTextField();
    update();
  }

  bool isDateSelected(DateTime date) {
    final d = _dateOnly(date);
    return selectedDates.any((e) => _dateOnly(e) == d);
  }

  bool isDateAvailable(DateTime date) {
    final d = _dateOnly(date);
    // If availability hasn't been loaded or is empty, allow selection by default
    if (availableDates.isEmpty) return true;
    return availableDates.any((e) => _dateOnly(e) == d);
  }

  void _updateChooseDateTextField() {
    final formatter = DateFormat('dd/MM/yyyy');
    chooseDateController.text = selectedDates
        .map((d) => formatter.format(_dateOnly(d)))
        .join(', ');
  }

  Future<void> fetchCalendarForMonth(DateTime monthStart) async {
    // monthStart is any date in the target month; API expects startDate
    focusedMonth = DateTime(monthStart.year, monthStart.month); // normalize
    final apiStart = DateFormat('yyyy-MM-dd').format(focusedMonth);

    if (id.isEmpty) return; // nanny id must be set via getId()

    final url = "${ApiEndPoint.calendarSlots}/$id?startDate=$apiStart";
    final response = await ApiService.get(url);
    availableDates.clear();
    if (response.statusCode == 200) {
      final List data = response.data['data'] ?? [];
      for (final item in data) {
        try {
          final String dateStr = item['date'];
          final bool isAvailable = item['isAvailable'] == true;
          if (isAvailable) {
            final dt = DateTime.parse(dateStr);
            availableDates.add(_dateOnly(dt));
          }
        } catch (_) {}
      }
    }
    update();
  }
  //==========================================================================

  void addChildren({required String getId}) {
    if (childrenIdList.contains(getId)) {
      childrenIdList.remove(getId);
    } else {
      childrenIdList.add(getId);
    }

    print(childrenIdList);
  }

  static RequestBookingController get instance =>
      Get.put(RequestBookingController());

  TextEditingController chooseDateController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  String selectedBookingType = "hourly";

  List<TimeSlote> timeSlots = <TimeSlote>[

  ];



  getHourSlot()async{

    var inputFormat = DateFormat("dd/MM/yyyy");
    var date = inputFormat.parse(chooseDateController.text);

    var outputFormat = DateFormat("yyyy-MM-dd");
    var formatDate = outputFormat.format(date);
    
    var response=await ApiService.get("${ApiEndPoint.bookingSlote}/$id?date=$formatDate");

timeSlots.clear();
    if(response.statusCode==200){
      var data=response.data['data'];

      for(var time in data){
        timeSlots.add(TimeSlote.fromJson(time));
      }
    }

    update();

  }

  void toggleSelection(int index) {
    if (timeSlots[index].isAvailable) {
      timeSlots[index].isSelected = !timeSlots[index].isSelected;
      update();
    }
  }

  addHour(String hour) {
    if (selectedHourList.contains(hour)) {
      selectedHourList.remove(hour);
    } else {
      selectedHourList.add(hour);
    }

    duration=selectedHourList.length.toString();


    totalEstmate=num.parse(duration)*num.parse(hourlyRate);

    // print("=======>> hour list  $selectedHourList");
    update();
  }


  void toggleTerms() {
    isTermsSelect = !isTermsSelect;
    update();
  }

  void getDuration(String hour) {
    durationController.text = hour;
    update();
  }

  var items = List.generate(2, (index) => {'isSelected': false});

  void toggleCheckBox(int index) {
    childrenList[index].isSelected = !childrenList[index].isSelected!;
    update();
  }

  dayCountForFullDay() {
    DateTime startDate = DateFormat(
      'dd/MM/yyyy',
    ).parse(startDateController.text);
    DateTime endDate = DateFormat('dd/MM/yyyy').parse(endDateController.text);

    Duration difference = endDate.difference(startDate);
    dayCount = difference.inDays + 1;
    update();
  }

  String calculateDateDifference(String inputDate) {
    try {
      DateTime givenDate = DateFormat('dd/MM/yyyy').parse(inputDate);
      DateTime currentDate = DateTime.now();
      int years = currentDate.year - givenDate.year;
      int months = currentDate.month - givenDate.month;

      if (months < 0) {
        years--;
        months += 12;
      }

      return "$years Years $months Months";
    } catch (e) {
      return "Invalid date format";
    }
  }

  getChildren() async {
    isLoading = true;
    update();

    var response = await ApiService.get(ApiEndPoint.childrenUrl);
    if (response.statusCode == 200) {
      var data = response.data["data"];

      for (var children in data) {
        childrenList.add(ChildrenListModel.fromJson(children));
      }
    } else {
      Utils.successSnackBar(response.statusCode.toString(), response.message);
    }

    isLoading = false;
    update();
  }

  //================================fullDayPayment
  var startDate = "";
  var endDate = "";
  dateConvert() {
    var inputFormat = DateFormat("dd/MM/yyyy");
    var sDate = inputFormat.parse(startDateController.text);
    var eDate = inputFormat.parse(endDateController.text);

    var outputFormat = DateFormat("yyyy-MM-dd");
    startDate = outputFormat.format(sDate);
    endDate = outputFormat.format(eDate);
  }

  fullDayPayment() async {
    isPaymentLoading = true;
    update();
    dateConvert();

    Map<String, dynamic> body = {
      "nannyId": id,
      "childrenId": childrenIdList,
      "bookingType": "FULL_DAY",
      "fullDayBooking": {"startDate": startDate, "endDate": endDate},
    };
    
    var response=await ApiService.post(ApiEndPoint.checkout, body: body);

    if(response.statusCode==200){
      var data=response.data["data"];

      paymentUrl=data["sessionUrl"];
      stripePaymentByWebview();

    }

    isPaymentLoading=false;
    update();

  }


  stripePaymentByWebview() {
    if (paymentUrl.isNotEmpty) {
      Get.toNamed(AppRoutes.paymentScreen);
      webViewController =
      WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setNavigationDelegate(
          NavigationDelegate(
            onPageStarted: (url) {
              isLoading = true;
              update();
            },
            onPageFinished: (url) {
              isLoading = false;
              update();

              if (url.contains("success")) {

                Get.back();
                PaymentSuccessPopUp.paymentSuccessDialog();
              } else if (url.contains("failed") || url.contains("cancel")) {
                Get.back();
              }
            },
          ),
        )
        ..loadRequest(Uri.parse(paymentUrl));

      print("++++========Payemnt success");

      isLoading = false;
      update();
    }
  }

  getDateFromCalendar() async {
    await OtherHelper.openDatePickerDialog(chooseDateController);
    getHourSlot();
  }

  updateBookingType(String bookingType) {
    selectedBookingType = bookingType;
    update();
  }

  @override
  void onInit() {
    getChildren();
    super.onInit();
  }
}
