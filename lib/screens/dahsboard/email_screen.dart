import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:karhabtiapp_dashboard_admin/screens/components/tables/tableDataEmail.dart';

import '../../constants/constants.dart';
import '../../model/listController.dart';
import '../buttons/dropdownbutton.dart';
import '../buttons/dropdownbuttonProfile.dart';
import '../components/widgets/pres.dart';
import '../components/tables/tableDataUsers.dart';

class Email_screen extends StatefulWidget {
  const Email_screen({super.key});

  @override
  State<Email_screen> createState() => _Email_screenState();
}

class _Email_screenState extends State<Email_screen> {
  List<String> options = ['ALL', 'B2C', 'B2B'];
  final DropdownController dropdownController = Get.put(DropdownController());

  @override
  Widget build(BuildContext context) {
    bool active = true;
    bool active2 = false;
    bool active3 = false;
    final tableEmail = [
      {
        "index": false,
        "Email": "John Doe",
        "Message": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ",
        "Description": "Lorem ipsum  ",
        "Date": "12 Janvier",
        "read": false
      },
      {
        "index": false,
        "Email": "John Doe",
        "Message": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ",
        "Description": "Lorem ipsum  ",
        "Date": "12 Janvier",
        "read": false
      },
      {
        "index": false,
        "Email": "John Doe",
        "Message": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ",
        "Description": "Lorem ipsum  ",
        "Date": "12 Janvier",
        "read": true
      },
      {
        "index": true,
        "Email": "John Doe",
        "Message": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ",
        "Description": "Lorem ipsum  ",
        "Date": "12 Janvier",
        "read": true
      },
      {
        "index": false,
        "Email": "John Doe",
        "Message": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ",
        "Description": "Lorem ipsum  ",
        "Date": "12 Janvier",
        "read": true
      },
    ];

    final media = MediaQuery.sizeOf(context);
    return Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
          height: 750,
          decoration: box,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: primaryColor))),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      buttonBar("Inbox", active, () {}),
                      buttonBar("Sent", active2, () {}),
                      buttonBar("Favorites", active3, () {}),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
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
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 40.0),
                            child: addThing(
                                "New Message", "assets/icons/Edit.svg", () {}),
                          ),
                        ],
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Padding(
                      //       padding:
                      //           const EdgeInsets.symmetric(horizontal: 8.0),
                      //       child: Container(
                      //           height: 45,
                      //           decoration: BoxDecoration(
                      //               border: Border.all(color: primaryColor)),
                      //           child: Obx(() => DRopdownPROFILMethod(
                      //               first: dropdownController.firstcopy.value,
                      //               list: options))),
                      //     ),
                      //     // Padding(
                      //     //   padding:
                      //     //       const EdgeInsets.symmetric(horizontal: 3.0),
                      //     //   child: Container(
                      //     //       height: 45,
                      //     //       decoration: BoxDecoration(
                      //     //           border: Border.all(color: primaryColor)),
                      //     //       child: Obx(() => DRopdownYearMethod(
                      //     //           first: dropdownController.year.value,
                      //     //           list: dropdownController.years))),
                      //     // ),
                      //   ],
                      // )
                    ],
                  ),
                ),
                TableEmail(
                  tableData: tableEmail,
                  space: media.width * .017,
                  height: media.height * .092,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 70),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      elevatedNE("Previous", () {}),
                      elevatedNUmber("1", () {}, true),
                      elevatedNUmber("2", () {}, false),
                      elevatedNUmber("3", () {}, false),
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
