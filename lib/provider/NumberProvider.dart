import 'package:flutter/material.dart';

class NumberProvider with ChangeNotifier {
  int _number = 0;

  int get number => _number;

  void setTo1() {
    _number = 1;
    notifyListeners();
  }

  void setTo2() {
    _number = 2;
    notifyListeners();
  }

  void resetTo0() {
    _number = 0;
    notifyListeners();
  }
}
