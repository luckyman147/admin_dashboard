import 'package:get/get.dart';

class BooleanStatesController extends GetxController {
  var _isFirstActive = true.obs;
  var _isSecondActive = false.obs;
  var _isThirdActive = false.obs;
  var _isActive = false.obs;
  var _isCheckActive = false.obs;
  var _number = 0.obs;

  int get number => _number.value;

  void setTo1() {
    _number.value = 1;
  }

  void setTo2() {
    _number.value = 2;
  }

  void resetTo0() {
    _number.value = 0;
  }

  bool get isFirstActive => _isFirstActive.value;
  bool get isSecondActive => _isSecondActive.value;
  bool get isThirdActive => _isThirdActive.value;
  bool get isActive => _isActive.value;
  bool get isCheckActive => _isCheckActive.value;

  void activateFirst() {
    _isFirstActive.value = true;
    _isSecondActive.value = false;
    _isThirdActive.value = false;
  }

  void deactivate() {
    _isActive.value = false;
  }

  void activate() {
    _isActive.value = true;
  }

  void deactivatecheck() {
    _isCheckActive.value = false;
  }

  void activateCheck() {
    _isCheckActive.value = true;
  }

  void activateSecond() {
    _isFirstActive.value = false;
    _isSecondActive.value = true;
    _isThirdActive.value = false;
  }

  void activateThird() {
    _isFirstActive.value = false;
    _isSecondActive.value = false;
    _isThirdActive.value = true;
  }
}
