import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karhabtiapp_dashboard_admin/constants/constants.dart';

import '../../../model/services/userService.dart';
import '../../../model/Get/counter.dart';

class MyDialog extends StatefulWidget {
  @override
  _MyDialogState createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  Map<String, bool> fieldErrors = {
    'username': false,
    'email': false,
    'phone': false,
  };
  final UserController userController = Get.put(UserController());
  final counter = Get.put(CounterController());
  TextEditingController textFieldController1 = TextEditingController();
  TextEditingController textFieldController2 = TextEditingController();
  TextEditingController textFieldController3 = TextEditingController();
  TextEditingController textFieldController4 = TextEditingController();
  TextEditingController textFieldController5 = TextEditingController();
  bool userIsB2C = false;
  bool userIsB2B = false;
  final _formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('My Dialog'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Add new User",
            style: TextStyle(
                color: black,
                fontFamily: styletext,
                fontSize: 20,
                fontWeight: FontWeight.w600),
          ),
          CustomTextfield(textFieldController1, 'Username', 'username'),
          CustomTextfield(textFieldController2, 'Email', "email"),
          CustomTextfield(textFieldController3, 'Phone', "phone"),
          // CustomTextfield(textFieldController4, 'UserProfile'),

          Row(
            children: [
              Text('User Profile:', style: TextStyle(color: textgrey)),
              Checkbox(
                activeColor: secondaryColor,
                //change border raduis
                side: BorderSide(color: yellow, width: 2),

                value: userIsB2C, // Set this boolean value based on your logic
                onChanged: (newValue) {
                  setState(() {
                    userIsB2C = newValue!;
                    userIsB2B = false;
                  });
                },
              ),
              Text('B2C', style: TextStyle(color: black)),
              Checkbox(
                activeColor: secondaryColor,
                //change border raduis
                side: BorderSide(color: yellow, width: 2),
                value: userIsB2B, // Set this boolean value based on your logic
                onChanged: (newValue) {
                  setState(() {
                    userIsB2B = newValue!;
                    userIsB2C = false;
                  });
                },
              ),
              Text('B2B', style: TextStyle(color: black)),
            ],
          ),

          Row(
            children: [
              IconButton(
                  icon: Icon(
                    Icons.date_range_rounded,
                    color: secondaryColor,
                  ),
                  onPressed: () async {
                    final pickedDate = await showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime(2018),
                        lastDate: DateTime.now());

                    if (pickedDate != null && pickedDate != selectedDate) {
                      setState(() {
                        selectedDate = pickedDate;
                        textFieldController5.text =
                            "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}";
                      });
                    }
                  }),
              Text(
                "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}",
                style: TextStyle(color: textColor),
              )
            ],
          ),

          SizedBox(height: 20),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            handleSaveButton();
            // Handle the data and close the dialog
            Navigator.of(context).pop();
          },
          child: Text('Save'),
        ),
        TextButton(
          onPressed: () {
            // Close the dialog
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
      ],
    );
  }

  Padding CustomTextfield(
      TextEditingController controller, String text, String fieldKey) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        controller: controller,
        style: TextStyle(color: black),
        cursorColor: yellow,
        decoration: InputDecoration(
            errorText:
                fieldErrors[fieldKey]! ? 'Please enter valid $text' : null,
            hintText: text,
            hintStyle: TextStyle(color: textColor),
            filled: true,
            contentPadding: EdgeInsets.all(10.0),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: secondaryColor, width: 2),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )),
        onChanged: (value) {
          setState(() {
            fieldErrors[fieldKey] = false;
          });
        },
      ),
    );
  }

  void handleSaveButton() async {
    final username = textFieldController1.text;
    final email = textFieldController2.text;
    final phone = textFieldController3.text;

    final date =
        "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}";
    String userProfile = '';
    if (userIsB2C) {
      userProfile = 'B2C';
    } else if (userIsB2B) {
      userProfile = 'B2B';
    }

    // You can now use these values to send data to a server or update a list
    // For example:
    final Map<String, dynamic> newUser = {
      'Username': username,
      'email': email,
      'Phone': phone,
      'UserProfile': userProfile,
      'JoiningDate': date,
    };
    // await userController.addUser(newUser);
    bool success = await userController.addUser(newUser);
    showCustomSnackbar(success, "Added");
    counter.increment();

    // Call your addUser function or update logic here
  }

  bool isEmailValid(String email) {
    // You can implement your email validation logic here
    return email.contains('@');
  }

  bool isPhoneValid(String phone) {
    // You can implement your phone validation logic here
    return phone.length != 8;
  }
}
