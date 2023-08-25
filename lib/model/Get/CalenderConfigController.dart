import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalendarConfig extends GetxController {
  RxBool isAllDay = false.obs;
  Rx<DateTime> beginDate = DateTime.now().obs;
  Rx<TimeOfDay> beginTime = TimeOfDay.now().obs;
  Rx<DateTime> endDate = DateTime.now().obs;
  Rx<TimeOfDay> endTime = TimeOfDay.now().obs;
  Rx<Color> selectedColor = Colors.blue.obs;

  final TextEditingController subjectController = TextEditingController();
  void addOneHourToEndTime() {
    TimeOfDay currentTime = endTime.value;
    TimeOfDay newTime = TimeOfDay(
      hour: currentTime.hour + 1,
      minute: currentTime.minute,
    );
    endTime.value = newTime;
  }

  @override
  void onClose() {
    super.onClose();
    subjectController.dispose();
  }

  void setIsAllDay(bool value) {
    isAllDay.value = value;
  }

  void setBeginDate(DateTime date) {
    beginDate.value = date;
  }

  void setBeginTime(TimeOfDay time) {
    beginTime.value = time;
  }

  //foor
  void setEndDate(DateTime date) {
    endDate.value = date;
  }

  //end time
  void setEndTime(TimeOfDay time) {
    endTime.value = time;
  }

  void setSelectedColor(Color color) {
    selectedColor.value = color;
  }

  bool get getIsAllDay => isAllDay.value;
  DateTime get getBeginDate => beginDate.value;
  TimeOfDay get getBeginTime => beginTime.value;
  Color get getSelectedColor => selectedColor.value;
  DateTime get getEndDate => endDate.value;
  TimeOfDay get getEndTime => endTime.value;
}
