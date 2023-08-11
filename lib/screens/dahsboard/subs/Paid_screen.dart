import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:karhabtiapp_dashboard_admin/screens/components/tableData.dart';
import 'package:karhabtiapp_dashboard_admin/screens/main/Application.dart';

import '../../../constants.dart';
import '../../buttons/dropdownbutton.dart';
import '../../components/header.dart';
import '../../components/pres.dart';

class Subs_screen extends StatefulWidget {
  const Subs_screen({super.key});

  @override
  State<Subs_screen> createState() => _Subs_screenState();
}

class _Subs_screenState extends State<Subs_screen> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> tableData = [
      {
        'index': false,
        'OrderID': "#KA5631",
        "Date": "04 September 2023",
        "User Name": "Nelson Mandela",
        "User Profile": "B2B",
        "Total": "2000",
        "Payment Status": "Paid",
      },
      {
        'index': true,
        'OrderID': "#KA5771",
        "Date": "04 october 2023",
        "User Name": "Bob Marley",
        "User Profile": "B2C",
        "Total": "200",
        "Payment Status": "Unpaid",
      },
      {
        'index': true,
        'OrderID': "#KA5971",
        "Date": "04 Juillet 2023",
        "User Name": "Micheal Jackson",
        "User Profile": "B2B",
        "Total": "100",
        "Payment Status": "Change Back",
      },
      {
        'index': false,
        'OrderID': "#KA5631",
        "Date": "04 September 2023",
        "User Name": "Nelson Mandela",
        "User Profile": "B2B",
        "Total": "2000",
        "Payment Status": "Paid",
      },
      {
        'index': false,
        'OrderID': "#KA5631",
        "Date": "04 September 2023",
        "User Name": "Nelson Mandela",
        "User Profile": "B2B",
        "Total": "2000",
        "Payment Status": "Paid",
      }
    ];
    List<Map<String, dynamic>> filterByPayment(
        List<Map<String, dynamic>> inputList, String filter) {
      return inputList.where((map) => map['Payment Status'] == filter).toList();
    }

    bool active = false;
    bool active2 = true;
    List<String> options = ['ALL', 'B2C', 'B2B'];
    int num = 5;
    bool active3 = false;
    return SafeArea(
      child: SingleChildScrollView(
        // padding: EdgeInsets.all(defaultPadding),

        child: Column(
          children: [
            Header(
              text: 'Subscriptions',
            ),
            SizedBox(
              height: defaultPadding,
              child: Container(
                color: primaryColor,
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                  height: 600,
                  decoration: box,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 40.0, horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: primaryColor))),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              buttonBar("All Subscriptions", active, () {}),
                              buttonBar("Paid", active2, () {}),
                              buttonBar("Unpaid", active3, () {}),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Container(
                                        height: 45,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: primaryColor)),
                                        child: DRopdownMethod(
                                            first: "ALL", list: options)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 3.0),
                                    child: Container(
                                        height: 45,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: primaryColor)),
                                        child: DRopdownMethod(
                                            first: "2022",
                                            list: ["2022", "2023"])),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Tabled(
                          tableData: filterByPayment(tableData, "Paid"),
                          space: 90,
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
                )),
          ],
        ),
      ),
    );
  }
}
