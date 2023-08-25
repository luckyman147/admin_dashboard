import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:karhabtiapp_dashboard_admin/constants/constants.dart';
import 'package:karhabtiapp_dashboard_admin/constants/utils.dart';
import 'package:karhabtiapp_dashboard_admin/model/services/appoitementService.dart';
import 'package:karhabtiapp_dashboard_admin/screens/functions/para.dart';

class appoitmentInfoAlertDialog extends StatefulWidget {
  // final String Name;
  final DateTime StartDate;
  final DateTime EndDate;
  final String subject;
  final Color color;

  const appoitmentInfoAlertDialog({
    super.key,
    required this.subject,
    required this.StartDate,
    required this.EndDate,
    required this.color,
  });
  @override
  _appoitmentInfoAlertDialogState createState() =>
      _appoitmentInfoAlertDialogState();
}

class _appoitmentInfoAlertDialogState extends State<appoitmentInfoAlertDialog> {
  final AppoitmentController sendController = Get.put(AppoitmentController());
  @override
  Widget build(BuildContext context) {
    TimeOfDay StarttimeOfDay = TimeOfDay.fromDateTime(widget.StartDate);
    TimeOfDay EndtimeOfDay = TimeOfDay.fromDateTime(widget.EndDate);
    return StatefulBuilder(builder: (context, snapshot) {
      return AlertDialog(
        title: Text(
          "Appointment Informations",
          style: TextStyle(
              color: widget.color,
              fontFamily: styletext,
              fontSize: 25,
              fontWeight: FontWeight.w800),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 9.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "Subject : ",
                          style: TextStyle(
                              color: textgrey,
                              fontFamily: styletext,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          capitalizeFirstLetter(widget.subject),
                          style: TextStyle(
                              color: black,
                              fontFamily: styletext,
                              fontSize: 17,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${widget.StartDate.year},${DateFormat('MMM').format(widget.StartDate)} ${widget.StartDate.day} ',
                    style: TextStyle(color: black),
                  ),
                  Text(
                    '${StarttimeOfDay.format(context)}',
                    style: TextStyle(color: black),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${widget.EndDate.year},${DateFormat('MMM').format(widget.EndDate)} ${widget.EndDate.day} ',
                    style: TextStyle(color: black),
                  ),
                  Text(
                    '${EndtimeOfDay.format(context)}',
                    style: TextStyle(
                        color: black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Color:",
                    style: TextStyle(color: textgrey),
                  ),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: widget.color,
                        border: Border.all(color: black)),
                  ),
                ],
              ),
            )
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              // print(widget.StartDate);
              // print(
              // '${widget.StartDate.year},${DateFormat('MMM').format(widget.StartDate)} ${widget.StartDate.day} ,${DateFormat('EEE').format(widget.StartDate)}');
              // Perform action or close the dialog
              Navigator.of(context).pop();
            },
            child: Text(
              'Cancel',
              style: TextStyle(color: textgrey),
            ),
          ),
          TextButton(
            onPressed: () {
              handleSaveButton();
              // Perform action or close the dialog
              Navigator.of(context).pop();
            },
            child: Text(
              "Delete",
              style: TextStyle(
                color: red,
              ),
            ),
          ),
        ],
      );
    });
  }

  void handleSaveButton() async {
    // Call your addUser function or update logic here
  }
}
