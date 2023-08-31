import 'package:get/get.dart';

class TableComplainceStatesController extends GetxController {
  final List<RxBool> activationList;
  final List<RxBool> favorite;
  final favoriteall = false.obs;
  final checkall = false.obs;

  TableComplainceStatesController(int length)
      : activationList = List.generate(length, (_) => false.obs),
        favorite = List.generate(length, (_) => false.obs);

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

  bool _isValidIndexfav(int index) {
    return index >= 0 && index < favorite.length;
  }

  void activatedFav(int index) {
    if (_isValidIndexfav(index)) {
      favorite[index].value = true;
    }
  }

  void deactivateFavAll() {
    favorite.forEach((rxBool) {
      rxBool.value = false;
    });
    favoriteall.value = false;
  }

  void activateFavAll() {
    favorite.forEach((rxBool) {
      rxBool.value = true;
    });
    favoriteall.value = true;
  }

  void deactivatefav(int index) {
    if (_isValidIndexfav(index)) {
      favorite[index].value = false;
    }
  }

  void togglefav(int index) {
    if (_isValidIndexfav(index)) {
      favorite[index].toggle();
    }
  }
}
