import 'package:get/get.dart';

class TableStatesController extends GetxController {
  final List<RxBool> activationList;
  final checkall = false.obs;

  TableStatesController(int length)
      : activationList = List.generate(length, (_) => false.obs);

  void activate(int index) {
    if (_isValidIndex(index)) {
      activationList[index].value = true;
    }
  }

  void deactivate(int index) {
    if (_isValidIndex(index)) {
      activationList[index].value = false;
    }
  }

  void toggle(int index) {
    if (_isValidIndex(index)) {
      activationList[index].toggle();
    }
  }

  void deactivateAll() {
    activationList.forEach((rxBool) {
      rxBool.value = false;
    });
    checkall.value = false;
  }

  void activateAll() {
    activationList.forEach((rxBool) {
      rxBool.value = true;
    });
    checkall.value = true;
  }

  void resetAll() {
    activationList.forEach((rxBool) {
      rxBool.value = false;
    });
    checkall.value = false;
  }

  bool _isValidIndex(int index) {
    return index >= 0 && index < activationList.length;
  }
}
