import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

// enum CalendarViewType { month, week, day }

class CalendarViewController extends GetxController {
  var _isMonthView = true.obs;
  var _isWeekView = false.obs;
  var _isDayView = false.obs;
  var _isScheduleView = false.obs;
  CalendarController _calendarController = CalendarController();
  var _currentView = CalendarView.month.obs;
  var _allowedViews = [CalendarView.month].obs;
  CalendarView get currentView => _currentView.value;

  void changeView(CalendarView viewType) async {
    _currentView.value = viewType;
    notifyChildrens();
  }

  CalendarController get calendarController => _calendarController;
  List<CalendarView> get allowedViews => _allowedViews.value;
  bool get isMonthView => _isMonthView.value;
  bool get isWeekView => _isWeekView.value;
  bool get isDayView => _isDayView.value;
  bool get isScheduleView => _isScheduleView.value;

  void _setViewBooleans(
      bool isMonth, bool isWeek, bool isDay, bool isSchedule) {
    _isMonthView.value = isMonth;
    _isWeekView.value = isWeek;
    _isDayView.value = isDay;
    _isScheduleView.value = isSchedule;
  }

  void setMonthView() {
    _setViewBooleans(true, false, false, false);
  }

  void updateAllowedViews(List<CalendarView> views) {
    _allowedViews.value = views;
  }

  void setWeekView() {
    _setViewBooleans(false, true, false, false);
  }

  void setDayView() {
    _setViewBooleans(false, false, true, false);
  }

  void setScheduleView() {
    _setViewBooleans(false, false, false, true);
  }

  @override
  void dispose() {
    calendarController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
