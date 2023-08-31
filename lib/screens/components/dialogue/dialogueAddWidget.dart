import 'dart:io';
import 'dart:typed_data';

import 'package:bcrypt/bcrypt.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:karhabtiapp_dashboard_admin/constants/constants.dart';
import 'package:karhabtiapp_dashboard_admin/model/Get/countcontroller/textfieldbools.dart';
import 'package:badges/badges.dart' as badges;
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import '../../../model/services/userService.dart';
import '../../../model/Get/countcontroller/counter.dart';

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
  PlatformFile? _pickedImage;
  final ImagePickerPlatform _picker = ImagePickerPlatform.instance;
  final UserController userController = Get.put(UserController());
  final textfieldcontroller = Get.put(TextFieldController());
  final counter = Get.put(CounterController());
  TextEditingController textFieldController1 = TextEditingController();
  TextEditingController textFieldController2 = TextEditingController();
  TextEditingController textFieldController3 = TextEditingController();
  TextEditingController textFieldController4 = TextEditingController();
  TextEditingController textFieldController5 = TextEditingController();
  TextEditingController textFieldController6 = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();

  final list = ['Service Provider', 'Driver'];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AlertDialog(
      title: Text(
        "Add new User",
        style: TextStyle(
            color: black,
            fontFamily: styletext,
            fontSize: 20,
            fontWeight: FontWeight.w600),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: badges.Badge(
                onTap: () async {
                  _openImagePicker();
                },
                badgeContent: Icon(
                  Icons.add,
                  size: 18,
                  color: Colors.white,
                ),
                badgeStyle: const badges.BadgeStyle(
                  badgeColor: pourcentage,
                  padding: EdgeInsets.all(5),
                  shape: badges.BadgeShape.circle,
                  elevation: 0,
                ),
                position: badges.BadgePosition.bottomEnd(bottom: 2, end: -1),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: secondaryColor, width: 5),
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 40,
                    backgroundImage: _pickedImage != null
                        ? FileImage(File(_pickedImage!.path ?? ''))
                        : AssetImage('assets/img/karhaba.png') as ImageProvider,
                  ),
                ),
              ),
            ),
            CustomTextfield(textFieldController1, 'Username', 'username'),
            CustomTextfield(textFieldController2, 'Email', "email"),
            CustomTextfield(textFieldController3, 'Phone', "phone"),
            CustomTextfield(textFieldController4, 'password', "password"),
            CustomTextfield(textFieldController6, 'Adress', "Adress"),
            Birthdate(context),
            Sex(size),
            SizedBox(height: 8),
            User(size),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: double.infinity,
                decoration: dec,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 11.0),
                  child: Column(
                    children: [
                      Text(
                        "Genre",
                        style: TextStyle(color: textColor, fontSize: 20),
                      ),
                      DropdownButton2(
                        underline: Container(),
                        value: list[0],
                        onChanged: (value) {
                          print(value);
                        },
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontFamily: GoogleFonts.plusJakartaSans.toString(),
                            fontWeight: FontWeight.w400),
                        items: list.map((e) {
                          return DropdownMenuItem(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 9),
                              child: Text(
                                e,
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            value: e,
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
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
            // Close the dialog
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
      ],
    );
  }

  Container Sex(Size size) {
    return Container(
      decoration: dec,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text('Sex:', style: TextStyle(color: textColor, fontSize: 20)),
          SizedBox(
            height: size.width * .005,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(() {
                  return choix("Male", textfieldcontroller.userIsMale.value,
                      textfieldcontroller.activateMale);
                }),
              ),
              SizedBox(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(() {
                  return choix("Female", textfieldcontroller.userIsFemale.value,
                      textfieldcontroller.activateFemale);
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container User(Size size) {
    return Container(
      decoration: dec,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text('User Profile:',
              style: TextStyle(color: textColor, fontSize: 20)),
          SizedBox(
            height: size.width * .005,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(() {
                  return choix("B2B", textfieldcontroller.userIsB2B.value,
                      textfieldcontroller.activateB2B);
                }),
              ),
              SizedBox(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(() {
                  return choix("B2C", textfieldcontroller.userIsB2C.value,
                      textfieldcontroller.activateB2C);
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding Birthdate(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(246, 243, 243, 1),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: Color.fromRGBO(
            94,
            94,
            94,
            1,
          )),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "BirthDate",
                style: TextStyle(color: textColor),
              ),
              IconButton(
                  icon: Icon(
                    Icons.date_range_rounded,
                    color: secondaryColor,
                  ),
                  onPressed: () async {
                    final pickedDate = await showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime(1960),
                        lastDate: DateTime(2024),
                        builder: (BuildContext context, Widget? child) {
                          return Theme(
                            data: ThemeData.light().copyWith(
                              colorScheme: ColorScheme.light().copyWith(
                                  primary: yellow, secondary: secondaryColor),
                            ),
                            child: child!,
                          );
                        });

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
        ),
      ),
    );
  }

  ElevatedButton choix(String text, bool isactive, Function(bool?) func) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: isactive ? yellow : Colors.white,
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          side: BorderSide(
              color: isactive ? primaryColor : secondaryColor, width: 2)),
      onPressed: () {
        func(true);
      },
      child: Text(
        "$text",
        style: TextStyle(color: isactive ? Colors.white : black, fontSize: 20),
      ),
    );
    ;
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
    final File imageFile = File(_pickedImage!.path ?? '');
    final Uint8List imageBytes = await imageFile.readAsBytes();
    final date =
        "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}";
    String userProfile = '';
    String Sex = '';
    final joiningDate =
        "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}";
    // Generate a salt
    final salt = BCrypt.gensalt();

    // Hash the password with the salt
    final hash = BCrypt.hashpw(textFieldController4.text, salt);
    if (textfieldcontroller.userIsFemale.value) {
      Sex = 'Female';
    } else {
      Sex = 'Male';
    }
    if (textfieldcontroller.userIsB2C.value) {
      userProfile = 'B2C';
    } else if (textfieldcontroller.userIsB2B.value) {
      userProfile = 'B2B';
    }

    // You can now use these values to send data to a server or update a list
    // For example:
    final Map<String, dynamic> newUser = {
      'Username': username,
      'email': email,
      'Phone': phone,
      'UserProfile': userProfile,
      'BirthDate': date,
      'JoiningDate': joiningDate,
      'Password': hash,
      'Adress': textFieldController6.text,
      'UserImage': imageBytes,
      'Sex': Sex,
      "Genre": list[0]
    };
    // await userController.addUser(newUser);
    bool success = await userController.addUser(newUser);
    showCustomSnackbar(success, "Added", "User");
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

  Future<void> _openImagePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image, // Specify the type of file to pick
    );

    if (result != null) {
      setState(() {
        _pickedImage = result.files.first;
      });
      // The path to the picked image
      // Process the filePath as needed
    } else {
      // User canceled the file picking
    }
  }
}
