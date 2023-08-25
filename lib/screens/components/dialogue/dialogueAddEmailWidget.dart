import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karhabtiapp_dashboard_admin/constants/constants.dart';
import 'package:karhabtiapp_dashboard_admin/constants/utils.dart';
import '../../../model/services/SenderEmailService.dart';

class EmailAlertDialog extends StatefulWidget {
  @override
  _EmailAlertDialogState createState() => _EmailAlertDialogState();
}

class _EmailAlertDialogState extends State<EmailAlertDialog> {
  TextEditingController textFieldController1 = TextEditingController();
  TextEditingController textFieldController2 = TextEditingController();
  TextEditingController textFieldController3 = TextEditingController();
  final SendEmailController sendController = Get.put(SendEmailController());
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Email'),
      content: Container(
        width: 500,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "New message",
              style: TextStyle(
                  color: black,
                  fontFamily: styletext,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            Padding(
              // padding: const EdgeInsets.all
              padding: const EdgeInsets.symmetric(vertical: 10.0),

              child: TextField(
                cursorColor: yellow,
                style: TextStyle(color: black),
                controller: textFieldController1,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: secondaryColor, width: 2),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'To',
                    hintStyle: TextStyle(color: textgrey)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: TextField(
                cursorColor: yellow,
                style: TextStyle(color: black),
                controller: textFieldController2,
                decoration: InputDecoration(
                  hintText: "Subject",
                  contentPadding: EdgeInsets.all(10.0),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: secondaryColor, width: 2),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Padding(
              // padding: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.symmetric(vertical: 10.0),

              child: TextField(
                controller: textFieldController3,
                cursorColor: yellow,
                style: TextStyle(color: black),
                decoration: InputDecoration(
                    // filled: true,
                    contentPadding: EdgeInsets.all(10.0),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: secondaryColor, width: 2),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: Text(
                      "${textFieldController3.text.length}/1000",
                      style: TextStyle(
                          color: textColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    ),
                    hintText: "Message"),
                maxLines: 10,
              ),
            )
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            // Perform action or close the dialog
            Navigator.of(context).pop();
          },
          child: Text(
            'Cancel',
            style: TextStyle(color: textgrey),
          ),
        ),
        IconButton(
          onPressed: () {
            handleSaveButton();
            // Perform action or close the dialog
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.send,
            color: secondaryColor,
          ),
        ),
      ],
    );
  }

  void handleSaveButton() async {
    final sendSubject = textFieldController2.text;
    final email = textFieldController1.text;
    final SendDesc = textFieldController3.text;

    // You can now use these values to send data to a server or update a list
    // For example:
    final Map<String, dynamic> newemail = {
      'SendSubject': sendSubject,
      'email': email,
      'SendEmailDescription': SendDesc,
    };
    bool success = await sendController.addSendEmail(newemail);
    showCustomSnackbar(success, "Added","Email");

    // counter.increment();

    // Call your addUser function or update logic here
  }
}
