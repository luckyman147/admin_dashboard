import 'package:get/get.dart';

class DropdownController extends GetxController {
  var options = ['ALL', 'B2C', 'B2B'];
  var years = ["ALL", "2022", "2023"];
  var services = ["Driver", "Busness"];
  var service = "".obs;
  var firstcopy = ''.obs;
  var year = ''.obs;

  @override
  void onInit() {
    firstcopy.value = options[0];
    year.value = years[0];
    service.value = services[0];

    // TODO: implement onInit
    super.onInit();
  }

  void updated(String value) {
    year.value = value;
  }

  void updateFirstCopy(String value) {
    firstcopy.value = value;
  }

  void upodateService(String value) {
    service.value = value;
  }
}
