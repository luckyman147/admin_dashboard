import 'package:flutter/material.dart';

enum CalendarViewType { month, week, day }

class CalendarViewProvider with ChangeNotifier {
  CalendarViewType _currentView = CalendarViewType.month;

  CalendarViewType get currentView => _currentView;

  void ChangeView(CalendarViewType viewType) {
    _currentView = viewType;
    notifyListeners();
  }
}
