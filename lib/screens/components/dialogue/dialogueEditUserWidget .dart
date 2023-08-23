import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:karhabtiapp_dashboard_admin/constants/constants.dart';
import 'package:karhabtiapp_dashboard_admin/model/services/TransactionService.dart';

import '../../../model/services/userService.dart';
import '../../../model/Get/counter.dart';
import '../../../model/Get/textfieldbools.dart';

class MyEditUserDialog extends StatefulWidget {
  final int id;
  final String userName;
  final String JoiningDate;
  final String userProfil;
  final String Phone;
  final String email;

  MyEditUserDialog({
    super.key,
    required this.id,
    required this.userName,
    required this.email,
    required this.Phone,
    required this.userProfil,
    required this.JoiningDate,
  });
  @override
  _MyEditUserDialogState createState() => _MyEditUserDialogState();
}

class _MyEditUserDialogState extends State<MyEditUserDialog> {
  final textfieldcontroller = Get.put(TextFieldController());
  @override
  void initState() {
    super.initState();
    textfieldcontroller
        .updateSelectedDate(parseFormattedDateString(widget.JoiningDate));

    // print(textfieldcontroller.selectedDate.value);
    // _updatedTime = parseFormattedDateString(widget.date);
  }

  bool isedit = false;

  final userController = Get.put(UserController());
  final counter = Get.put(CounterController());

  TextEditingController textFieldController5 = TextEditingController();

  // final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // DateTime selectedDate = parseFormattedDateString(widget.date)
    final media = MediaQuery.sizeOf(context);
    // DateTime selectedDate = parseFormattedDateString();
    if (widget.userProfil == "B2B") {
      textfieldcontroller.activateB2B(true);
    } else {
      textfieldcontroller.activateB2C(true);
    }

    // print('Date ${textfieldcontroller.selectedDate.value}');
    var UserNameENabled = textfieldcontroller.isUserNameEnabled;
    // Function stopfunc = textfieldcontroller.stopUserEditing;
    // Function startediting = textfieldcontroller.UserstartEditing;

    return Obx(() {
      return AlertDialog(
        title: Text('My Dialog'),
        content: Container(
          height: media.height * .7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Edit User",
                  style: TextStyle(
                      color: secondaryColor,
                      fontFamily: styletext,
                      fontSize: 27,
                      fontWeight: FontWeight.w800),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 12.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "ID:",
                      style: TextStyle(color: textColor, fontSize: 20),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Text(
                        "#KA${widget.id}",
                        style: TextStyle(
                            color: black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      "Username:",
                      style: TextStyle(color: textColor, fontSize: 16),
                    ),
                  ),
                  CustomTextfield(
                    widget.userName,

                    "UserName",

                    UserNameENabled,

                    textfieldcontroller.UserNameController,

                    textfieldcontroller.stopUserEditing,

                    textfieldcontroller.UserstartEditing,

                    // )
                  ),
                ],
              ),
              description("Email", widget.email),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      "Phone:",
                      style: TextStyle(color: textColor, fontSize: 16),
                    ),
                  ),
                  CustomTextfield(
                      widget.Phone,
                      "Phone",
                      textfieldcontroller.isPhoneEnabled,
                      textfieldcontroller.phoneController,
                      textfieldcontroller.stopUserEditing,
                      textfieldcontroller.UserstartEditing),
                ],
              ),
              // CustomTextfield(widget.email, "email"),
              // CustomTextfield(widget.Phone, "Phone"),

              // CustomTextfield(textFieldController4, 'UserProfile'),

              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('UserProfile:', style: TextStyle(color: textgrey)),
                    checkbox("B2B", textfieldcontroller.userIsB2B.value,
                        textfieldcontroller.activateB2B),
                    checkbox("B2C", textfieldcontroller.userIsB2C.value,
                        textfieldcontroller.activateB2C),
                  ],
                ),
              ),
              JoiningDateField(context),

              // SizedBox(height: 20),
            ],
          ),
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
              textfieldcontroller.resetUser(widget.userName, UserNameENabled,
                  textfieldcontroller.UserNameController);

              textfieldcontroller.resetUser(
                  widget.Phone,
                  textfieldcontroller.isPhoneEnabled,
                  textfieldcontroller.phoneController);

              // Close the dialog
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
        ],
      );
    });
  }

  Row JoiningDateField(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Joining Date : ",
              style: TextStyle(color: textgrey, fontSize: 16),
            ),
            Text(
              "${textfieldcontroller.selectedDate.value.year}-${textfieldcontroller.selectedDate.value.month}-${textfieldcontroller.selectedDate.value.day}",
              style: TextStyle(color: yellow),
            ),
            //Date
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: IconButton(
                      onPressed: () async {
                        // print(textfieldcontroller.selectedDate.value);

                        final pickedDate = await showDatePicker(
                            context: context,
                            initialDate: textfieldcontroller.selectedDate.value,
                            firstDate: DateTime(2018),
                            lastDate: DateTime(2024));

                        if (pickedDate != null) {
                          textfieldcontroller.updateSelectedDate(pickedDate);
                          setState(() {
                            // _updatedTime = pickedDate;
                            textFieldController5.text =
                                "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
                          });
                        }
                      },
                      icon: const Icon(Icons.edit)),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }

  Padding checkbox(String text, bool checked, Function(bool?) func) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Checkbox(
            activeColor: secondaryColor,
            //change border raduis
            side: BorderSide(color: yellow, width: 2),

            value: checked, // Set this boolean value based on your logic
            onChanged: (newValue) {
              func(newValue);
            },
          ),
          Text(text, style: TextStyle(color: black)),
        ],
      ),
    );
  }

  Padding CustomTextfield(
      String text,
      String type,
      RxBool isactivated,
      TextEditingController controlller,
      Function(
        RxBool,
        TextEditingController,
      ) stopfunc,
      Function(
        String,
        TextEditingController,
        RxBool,
      ) startediting)
  // {
  {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 18),
      child: SizedBox(
        width: 200,
        child: Row(children: [
          Expanded(
              child: isactivated.value
                  ? TextField(
                      // enabled: textfieldcontroller.isTextFieldEnabled.value,
                      controller: controlller,
                      style: TextStyle(color: black),
                      cursorColor: yellow,
                      decoration: InputDecoration(
                          labelText: type,
                          labelStyle: TextStyle(color: textgrey),
                          hintText: text,
                          hintStyle: TextStyle(color: textColor),
                          // filled: true,
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: bgColor, style: BorderStyle.none),
                          ),
                          contentPadding: EdgeInsets.all(10.0),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: secondaryColor, width: 2),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    )
                  : Text(
                      controlller.text,
                      style: TextStyle(color: yellow, fontSize: 16),
                    )),
          IconButton(
            icon: Icon(isactivated.value ? Icons.check : Icons.edit),
            onPressed: () {
              // print(textfieldcontroller.isTextFieldEnabled);
              if (isactivated.value) {
                stopfunc(
                  isactivated,
                  controlller,
                );
              } else {
                startediting(text, controlller, isactivated);
              }
            },
          ),
        ]),
      ),
    );
  }

  void handleSaveButton() async {
    String chekked = '';
    if (textfieldcontroller.userIsB2B.value) {
      chekked = "B2B";
    } else {
      chekked = "B2C";
    }

    String date = textFieldController5.text;
    if (date.isEmpty) {
      DateTime defaultDate = textfieldcontroller.selectedDate
          .value; // Set a default date, you can adjust this according to your needs
      date = "${defaultDate.year}-${defaultDate.month}-${defaultDate.day}";
    }

    // You can now use these values to send data to a server or update a list
    // For example:
    final Map<String, dynamic> editedUser = {
      "Username": textfieldcontroller.UserNameController.text,
      "email": widget.email,
      'Phone': textfieldcontroller.phoneController.text,
      "UserProfile": chekked,
      "JoiningDate": date
    };
    print(editedUser);
    bool success = await userController.editUser(widget.id, editedUser);

    showCustomSnackbar(success, "Edited");
    // counter.increment();

    // Call your addUser function or update logic here
  }

  DateTime parseFormattedDateString(String formattedDateString) {
    DateFormat formatter = DateFormat("dd MMM yyyy");
    DateTime parsedDate = formatter.parse(formattedDateString);
    return parsedDate;
  }
}
