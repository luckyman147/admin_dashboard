import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFieldController extends GetxController {
  RxBool isTextFieldEnabled = false.obs;
  RxBool isUserNameEnabled = false.obs;
  // RxBool isEmailEnabled = false.obs;
  RxBool isPhoneEnabled = false.obs;

  TextEditingController textEditingController = TextEditingController();
  TextEditingController UserNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  RxBool paymentP = false.obs;
  RxBool paymentUn = false.obs;
  RxBool paymentChange = false.obs;
  RxBool userIsB2C = false.obs;
  RxBool userIsB2B = false.obs;
  Rx<DateTime> selectedDate = Rx<DateTime>(DateTime.now());

  void updateSelectedDate(DateTime newDate) {
    selectedDate.value = newDate;
  }

//Activate paymentP
  void activateP(value) {
    paymentP.value = value;
    paymentUn.value = false;
    paymentChange.value = false;
  }

  void activateUn(value) {
    paymentP.value = false;
    paymentUn.value = value;
    paymentChange.value = false;
  }

  void activateChan(value) {
    paymentP.value = false;
    paymentUn.value = false;
    paymentChange.value = value;
  }

  //User type B2C or B2B
  void activateB2B(value) {
    userIsB2B.value = value;
    userIsB2C.value = false;
  }

  void activateB2C(value) {
    userIsB2B.value = !value;
    userIsB2C.value = value;
  }

  void startEditing(String initialValue) {
    isTextFieldEnabled.value = true;
    textEditingController.text = initialValue;
  }

  void UserstartEditing(
      String initialValue, TextEditingController controller, RxBool active) {
    active.value = true;
    controller.text = initialValue;
  }

  void stopUserEditing(RxBool booll, TextEditingController controller) {
    print("Modified Value: ${controller.text}");

    booll.value = false;
  }

  void stopEditing() {
    isTextFieldEnabled.value = false;
  }

  void saveChanges() {
    // You can perform any necessary actions with the modified value
    print("Modified Value: ${textEditingController.text}");
    stopEditing();
  }

  void toggleTextFieldEnabled() {
    isTextFieldEnabled.value = !isTextFieldEnabled.value;
  }
  //Reset

  void reset(String init) {
    isTextFieldEnabled.value = false;
    textEditingController.text = init;
  }

  void resetUser(
      String init, RxBool enabled, TextEditingController controller) {
    enabled.value = false;
    controller.text = init;
  }
}
