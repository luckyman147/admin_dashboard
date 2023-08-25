import 'package:analog_clock_picker/analog_clock_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:karhabtiapp_dashboard_admin/model/Get/CalenderConfigController.dart';
import 'package:karhabtiapp_dashboard_admin/model/services/appoitementService.dart';
// import 'package:karhabtiapp_dashboard_admin/screens/components/dialogue/color.dart';

import '../../../constants/constants.dart';

class showAddAppointmentDialog extends StatefulWidget {
  const showAddAppointmentDialog({super.key});

  @override
  State<showAddAppointmentDialog> createState() =>
      _showAddAppointmentDialogState();
}

class _showAddAppointmentDialogState extends State<showAddAppointmentDialog> {
  final formController = Get.put(CalendarConfig());
  final appoitementController = Get.put(AppoitmentController());
  Color picked = Colors.blue;

  final defaultcolor = [
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.deepPurple,
    Colors.indigo,
    Colors.blue,
    Colors.lightBlue,
    Colors.cyan,
    Colors.teal,
    Colors.green,
    Colors.lightGreen,
    Colors.lime,
    Colors.yellow,
    Colors.amber,
    Colors.orange,
    Colors.deepOrange,
    Colors.brown,
    Colors.grey,
    Colors.blueGrey,
  ];
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return AlertDialog(
          title: Text(
            'Add Appointment',
            style: TextStyle(
                color: black,
                fontFamily: styletext,
                fontSize: 20,
                fontWeight: FontWeight.w600),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: formController.subjectController,
                cursorColor: yellow,
                style: TextStyle(color: black),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: secondaryColor, width: 2),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: secondaryColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Subject',
                    labelStyle: TextStyle(
                      color: yellow,
                      fontFamily: styletext,
                    )),
              ),
              Switcher(formController.getIsAllDay, setState),
              SizedBox(height: 16),
              Obx(() => Row_date(
                  formController.beginDate.value,
                  context,
                  formController.beginTime.value,
                  formController.setBeginDate,
                  formController.setBeginTime)),
              SizedBox(height: 16),
              Obx(() => Row_date(
                  formController.endDate.value,
                  context,
                  formController.endTime.value,
                  formController.setEndDate,
                  formController.setEndTime)),
              SizedBox(height: 16),
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (builder) => AlertDialog(
                            content: BlockPicker(
                              availableColors: defaultcolor,
                              pickerColor: picked,
                              onColorChanged: (color) {
                                setState(() {
                                  picked = color;
                                });
                              },
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Cancel')),
                              TextButton(
                                  onPressed: () {
                                    formController.setSelectedColor(picked);
                                    print(formController.selectedColor);
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Save')),
                            ],
                          ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Obx(() {
                      return Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: formController.getSelectedColor,
                            border: Border.all(color: black)),
                      );
                    }),
                    Text(
                      "${defaultcolor[findColorIndex(formController.getSelectedColor, defaultcolor)]}",
                      style: TextStyle(
                          color: black,
                          fontFamily: styletext,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                handleSaveButton();

                // Perform add appointment logic here
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  Row Switcher(bool isAllDay, StateSetter setState) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'All-Day',
          style: TextStyle(
              color: black,
              fontFamily: styletext,
              fontSize: 20,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(width: 8),
        Obx(() {
          return Switch(
            value: formController.getIsAllDay,
            onChanged: (value) {
              formController.setIsAllDay(value);
            },
          );
        }),
      ],
    );
  }

  Row Row_date(DateTime startDate, BuildContext context, TimeOfDay selectedTime,
      Function(DateTime) functionB, Function(TimeOfDay) fnA) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          child: Text(
              '${startDate.year},${DateFormat('MMM').format(startDate)} ${startDate.day} ,${DateFormat('EEE').format(startDate)}',
              style: TextStyle(
                  color: black,
                  fontFamily: styletext,
                  fontSize: 17,
                  fontWeight: FontWeight.w600)),
          onPressed: () async {
            final StartPickeddate = await showDatePicker(
              context: context,
              initialDate: startDate,
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(Duration(days: 365)),
            );
            if (StartPickeddate != null) {
              functionB(StartPickeddate);
              print(StartPickeddate);
            }
          },
        ),
        TextButton(
            onPressed: () async {
              final startTime = await showTimePicker(
                context: context,
                initialTime: selectedTime,
              );
              if (startTime != null) {
                fnA(startTime);
              }
            },
            child: Text(
              ' ${selectedTime.format(context)}',
              style: TextStyle(
                  color: black,
                  fontFamily: styletext,
                  fontSize: 17,
                  fontWeight: FontWeight.w600),
            ))
      ],
    );
  }

  void handleSaveButton() async {
    final String subject = formController.subjectController.text;
    final DateTime startDate = formController.beginDate.value;
    final TimeOfDay startTime = formController.beginTime.value;
    final DateTime endDate = formController.endDate.value;
    final TimeOfDay endTime = formController.endTime.value;
    final Color selectedColor = formController.selectedColor.value;
    final bool isAllDay = formController.isAllDay.value;

    DateTime combinedStartDateTime = DateTime(
      startDate.year,
      startDate.month,
      startDate.day,
      startTime.hour,
      startTime.minute,
    );
    DateTime CombinedEndDateTime = DateTime(
      endDate.year,
      endDate.month,
      endDate.day,
      endTime.hour,
      endTime.minute,
    );
    String combinedDateTimeString = combinedStartDateTime.toIso8601String();
    String combinedEndDateTimeString = CombinedEndDateTime.toIso8601String();
    final Map<String, dynamic> appoitements = {
      "startTime": combinedDateTimeString,
      "endTime": combinedEndDateTimeString,
      "subject": subject,
      "isAllDay": isAllDay,
      "color": colorToHex(selectedColor)
    };
    print(appoitements);
    bool success = await appoitementController.addAppoitment(appoitements);
    showCustomSnackbar(success, "Added", "Appoitement");

    // counter.increment();

    // Call your addUser function or update logic here
  }

  int findColorIndex(Color targetColor, List<Color> colorList) {
    for (int i = 0; i < colorList.length; i++) {
      if (colorList[i] == targetColor) {
        return i;
      }
    }
    return -1; // Return -1 if color is not found in the list
  }

  String colorToHex(Color color) {
    String hexColor = color.value.toRadixString(16).padLeft(8, '0');
    return hexColor.substring(2); // Remove the alpha channel part
  }
}
