import 'package:get/get.dart';

class CounterController extends GetxController {
  var count = 1.obs;

  void increment() {
    count++;
  }

  void decrement() {
    count--;
  }

  void reset(int value) {
    count.value = value;
  }

  void set(int value) {
    count.value = value;
  }
}
