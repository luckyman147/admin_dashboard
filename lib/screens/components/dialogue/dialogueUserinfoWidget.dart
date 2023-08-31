import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karhabtiapp_dashboard_admin/constants/constants.dart';
import 'package:karhabtiapp_dashboard_admin/constants/utils.dart';
import '../../../model/services/SenderEmailService.dart';

class userInfoAlertDialog extends StatefulWidget {
  final String Name;
  final String email;
  final String phone;
  final String UserProfile;
  final String JoiningDate;
  final String BirthDate;
  final String UserImage;
  final String Genre;
  final String sex;
  final String Adress;

  const userInfoAlertDialog({
    super.key,
    required this.email,
    required this.phone,
    required this.UserProfile,
    required this.JoiningDate,
    required this.BirthDate,
    required this.UserImage,
    required this.Genre,
    required this.sex,
    required this.Adress,
    required this.Name,
  });
  @override
  _userInfoAlertDialogState createState() => _userInfoAlertDialogState();
}

class _userInfoAlertDialogState extends State<userInfoAlertDialog> {
  final SendEmailController sendController = Get.put(SendEmailController());

  @override
  Widget build(BuildContext context) {
    bool isMale = widget.sex == "Male";
    bool isFemale = widget.sex == "Female";

    return AlertDialog(
      title: Center(
        child: Text(
          'User Information',
          style: TextStyle(
              color: black,
              fontFamily: styletext,
              fontSize: 20,
              fontWeight: FontWeight.w600),
        ),
      ),
      content: Container(
        width: 300,
        height: 600,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: secondaryColor, width: 5),
                ),
                child: CircleAvatar(
                  radius: 40,
                  // backgroundImage: NetworkImage(widget.UserImage),
                ),
              ),
              RowInfo("Username", widget.Name),
              RowInfo("Gmail", widget.email),
              RowInfo("Phone", widget.phone),
              RowInfo("Address", widget.Adress),
              RowInfo("BirthDate", widget.BirthDate),
              RowInfo('Gender', widget.Genre),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text("Sex:",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: black,
                            fontFamily: styletext,
                            fontSize: 20,
                            fontWeight: FontWeight.w600)),
                  ),
                  Containersex("Male", isMale),
                  SizedBox(
                    width: 10,
                  ),
                  Containersex("Female", isFemale)
                ],
              )
            ],
          ),
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
        TextButton(
          onPressed: () {
            handleSaveButton();
            // Perform action or close the dialog
            Navigator.of(context).pop();
          },
          child: Text(
            "Edit",
            style: TextStyle(
              color: secondaryColor,
            ),
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
  }

  Container Containersex(String text, bool isMale) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 26),
      decoration: BoxDecoration(
          border: Border.all(color: isMale ? primaryColor : secondaryColor),
          color: isMale ? yellow : Colors.white,
          borderRadius: BorderRadius.circular(11)),
      child: Text(
        "$text",
        style: TextStyle(
            color: isMale ? Colors.white : black,
            fontFamily: styletext,
            fontSize: 20),
      ),
    );
  }

  Padding RowInfo(String text, String type) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 2),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: secondaryColor,
            )),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "$text : ",
                style: TextStyle(
                    color: black,
                    fontFamily: styletext,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                type,
                style: TextStyle(color: black),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void handleSaveButton() async {
    // Call your addUser function or update logic here
  }
}
