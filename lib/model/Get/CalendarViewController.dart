import 'package:get/get.dart';

enum CalendarViewType { month, week, day }

class CalendarViewController extends GetxController {
  var _currentView = CalendarViewType.month.obs;

  CalendarViewType get currentView => _currentView.value;

  void changeView(CalendarViewType viewType) {
    _currentView.value = viewType;
  }
}
