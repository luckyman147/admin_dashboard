import 'package:get/get.dart';

class NumberController extends GetxController {
  var _number = 5.obs;

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
}
