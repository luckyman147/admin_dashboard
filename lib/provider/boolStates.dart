import 'package:flutter/material.dart';

class BooleanStatesProvider with ChangeNotifier {
  bool _isFirstActive = true;
  bool _isSecondActive = false;
  bool _isThirdActive = false;
  bool _isActive = false;

  bool get isFirstActive => _isFirstActive;
  bool get isSecondActive => _isSecondActive;
  bool get isThirdActive => _isThirdActive;
  bool get isActive => _isActive;

  void activateFirst() {
    _isFirstActive = true;
    _isSecondActive = false;
    _isThirdActive = false;
    notifyListeners();
  }

  void deactivate() {
    _isActive = false;
    notifyListeners();
  }

  void activate() {
    _isActive = true;
    notifyListeners();
  }

  void activateSecond() {
    _isFirstActive = false;
    _isSecondActive = true;
    _isThirdActive = false;
    notifyListeners();
  }

  void activateThird() {
    _isFirstActive = false;
    _isSecondActive = false;
    _isThirdActive = true;
    notifyListeners();
  }
}
