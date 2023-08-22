import 'package:get/get.dart';

class CounterController extends GetxController {
  var count = 0.obs;

  void increment() {
    count++;
  }

  void decrement() {
    count--;
  }

  void reset() {
    count.value = 3;
  }

  void set(int value) {
    count.value = value;
  }
}
