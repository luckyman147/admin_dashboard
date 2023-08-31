import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:karhabtiapp_dashboard_admin/constants/constants.dart';
import 'package:karhabtiapp_dashboard_admin/model/services/TransactionService.dart';

import '../../../model/services/userService.dart';
import '../../../model/Get/counter.dart';
import '../../../model/Get/textfieldbools.dart';

class MyEditDialog extends StatefulWidget {
  final int id;
  final String date;
  final String userName;
  final String userProfil;
  final bool Identity;
  final String paymentStatus;
  final int Userid;

  MyEditDialog(
      {super.key,
      required this.date,
      required this.id,
      required this.userName,
      required this.userProfil,
      required this.Identity,
      required this.paymentStatus,
      required this.Userid});
  @override
  _MyEditDialogState createState() => _MyEditDialogState();
}

class _MyEditDialogState extends State<MyEditDialog> {
  final textfieldcontroller = Get.put(TextFieldController());
  @override
  void initState() {
    super.initState();
    textfieldcontroller
        .updateSelectedDate(parseFormattedDateString(widget.date));
    // print(textfieldcontroller.selectedDate.value);
    // _updatedTime = parseFormattedDateString(widget.date);
  }

  bool isedit = false;
  Map<String, bool> fieldErrors = {
    'Username': false,
    'Email': false,
    'Phone': false,
  };
  final transController = Get.put(TransactionController());
  final counter = Get.put(CounterController());
  // TextEditingController textFieldController1 = TextEditingController();
  // TextEditingController textFieldController2 = TextEditingController();
  // TextEditingController textFieldController3 = TextEditingController();
  // TextEditingController textFieldController4 = TextEditingController();
  TextEditingController textFieldController5 = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // DateTime selectedDate = parseFormattedDateString(widget.date)
    final media = MediaQuery.sizeOf(context);
    // DateTime selectedDate = parseFormattedDateString();
    if (widget.paymentStatus == "Paid") {
      textfieldcontroller.activateP(true);
    } else if (widget.paymentStatus == "Unpaid") {
      textfieldcontroller.activateUn(true);
    } else {
      textfieldcontroller.activateChan(true);
    }

    // print('Date ${textfieldcontroller.selectedDate.value}');

    return Obx(() => AlertDialog(
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
                    "Edit Subs",
                    style: TextStyle(
                        color: secondaryColor,
                        fontFamily: styletext,
                        fontSize: 27,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 2.0, vertical: 17),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "ID:",
                        style: TextStyle(color: textgrey, fontSize: 16),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Date : ",
                          style: TextStyle(color: textgrey, fontSize: 16),
                        ),
                        Text(
                          "${textfieldcontroller.selectedDate.value.year}-${textfieldcontroller.selectedDate.value.month}-${textfieldcontroller.selectedDate.value.day}",
                          style: TextStyle(color: yellow),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30),
                              child: IconButton(
                                  onPressed: () async {
                                    print(
                                        textfieldcontroller.selectedDate.value);

                                    final pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: textfieldcontroller
                                            .selectedDate.value,
                                        firstDate: DateTime(2018),
                                        lastDate: DateTime(2024));

                                    if (pickedDate != null) {
                                      textfieldcontroller
                                          .updateSelectedDate(pickedDate);
                                      setState(() {
                                        // _updatedTime = pickedDate;
                                        textFieldController5.text =
                                            "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
                                      });
                                    }
                                  },
                                  icon: Icon(Icons.edit)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                CustomTextfield(
                    widget.Identity ? "verified" : "Not verified", "Identity"),
                description("UserId", "${widget.Userid}"),
                description("Username", widget.userName),
                description("User Profile", widget.userProfil),

                // CustomTextfield(textFieldController4, 'UserProfile'),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Payment Status:',
                          style: TextStyle(color: textgrey)),
                      checkbox("Paid", textfieldcontroller.paymentP.value,
                          textfieldcontroller.activateP),
                      checkbox("Unpaid", textfieldcontroller.paymentUn.value,
                          textfieldcontroller.activateUn),
                      checkbox(
                          "Change back ",
                          textfieldcontroller.paymentChange.value,
                          textfieldcontroller.activateChan)
                    ],
                  ),
                ),

                SizedBox(height: 20),
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
                // textfieldcontroller.reset(widget.Identity);
                // Close the dialog
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        ));
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

  Padding CustomTextfield(String text, String type) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 18),
      child: SizedBox(
        width: 200,
        child: Row(children: [
          Expanded(
              child: textfieldcontroller.isTextFieldEnabled.value
                  ? TextField(
                      // enabled: textfieldcontroller.isTextFieldEnabled.value,
                      controller: textfieldcontroller.textEditingController,
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
                      textfieldcontroller.textEditingController.text,
                      style: TextStyle(color: yellow, fontSize: 16),
                    )),
          Obx(() => IconButton(
                icon: Icon(textfieldcontroller.isTextFieldEnabled.value
                    ? Icons.check
                    : Icons.edit),
                onPressed: () {
                  print(textfieldcontroller.isTextFieldEnabled);
                  if (textfieldcontroller.isTextFieldEnabled.value) {
                    textfieldcontroller.saveChanges();
                  } else {
                    textfieldcontroller.startEditing(text);
                  }
                },
              )),
        ]),
      ),
    );
  }

  void handleSaveButton() async {
    String chekked = '';

    String date = textFieldController5.text;
    if (date.isEmpty) {
      DateTime defaultDate = textfieldcontroller.selectedDate
          .value; // Set a default date, you can adjust this according to your needs
      date = "${defaultDate.year}-${defaultDate.month}-${defaultDate.day}";
    }

    if (textfieldcontroller.paymentP.value) {
      chekked = 'Paid';
    } else if (textfieldcontroller.paymentUn.value) {
      chekked = "Unpaid";
    } else {
      chekked = "Change back";
    }

    // You can now use these values to send data to a server or update a list
    // For example:
    final Map<String, dynamic> newTrans = {
      'Date': date,
      'Identity': textfieldcontroller.textEditingController.text,
      'PaymentStatus': chekked,
      'UserId': widget.Userid,
    };
    print(newTrans);
    // await userController.addUser(newUser);
    bool success =
        await transController.editTransactionPaymentStatus(widget.id, newTrans);
    showCustomSnackbar(success, "Edited", "Transaction");
    // counter.increment();

    // Call your addUser function or update logic here
  }

  DateTime parseFormattedDateString(String formattedDateString) {
    DateFormat formatter = DateFormat("dd MMM yyyy");
    DateTime parsedDate = formatter.parse(formattedDateString);
    return parsedDate;
  }
}
