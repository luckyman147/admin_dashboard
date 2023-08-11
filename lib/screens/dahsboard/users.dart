import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:karhabtiapp_dashboard_admin/screens/buttons/dropdownbutton.dart';
// import 'package:karhabtiapp_dashboard_admin/screens/components/tableData.dart';

import '../../../constants.dart';
// import '../../buttons/dropdownbutton.dart';
// import '../../components/header.dart';
import '../components/header.dart';
import '../components/pres.dart';
import '../components/tableDataUsers.dart';

class User_screen extends StatefulWidget {
  const User_screen({super.key});

  @override
  State<User_screen> createState() => _User_screenState();
}

class _User_screenState extends State<User_screen> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.sizeOf(context);
    List<Map<String, dynamic>> tableDataUser = [
      {
        'index': false,
        'user name': 'Bob',
        'email': 'eve@example.com',
        'phone': '555-555-5555',
        'user profile': 'B2C',
        'joining date': "2023-08-01 "
      },
      {
        'index': false,
        'user name': 'David',
        'email': 'charlie@example.com',
        'phone': '444-555-6666',
        'user profile': 'B2B',
        'joining date': "2023-07-28"
      },
      {
        'index': false,
        'user name': 'Charlie',
        'email': 'eve@example.com',
        'phone': '123-456-7890',
        'user profile': 'B2C',
        'joining date': "2023-07-30"
      },
      // ... more entries
    ];

    // bool active = true;
    // bool active2 = false;
    List<String> options = ['ALL', 'B2C', 'B2B'];
    int num = 5;
    // bool active3 = false;
    return Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
          height: 600,
          decoration: box,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17.0),
                  child: Row(
                    children: [
                      addThing("Add User", "assets/icons/plus.svg", () {})
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Show",
                            style: row,
                          ),
                          press(),
                          Text(
                            "Rows",
                            style: row,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                    border: Border.all(color: primaryColor)),
                                child: DRopdownMethod(
                                    first: "ALL", list: options)),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 3.0),
                            child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                    border: Border.all(color: primaryColor)),
                                child: DRopdownMethod(
                                    first: "2022", list: ["2022", "2023"])),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                TabledUser(
                  tableData: tableDataUser,
                  space: media.width * .081,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      elevatedNE("Previous", () {}),
                      elevatedNUmber("1", () {}, true),
                      elevatedNUmber("2", () {}, false),
                      elevatedNE("Next", () {}),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
