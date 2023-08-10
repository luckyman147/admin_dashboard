import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:karhabtiapp_dashboard_admin/screens/components/tableData.dart';

import '../../../constants.dart';
import '../../buttons/dropdownbutton.dart';
import '../../components/header.dart';

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
    List<Map<String, dynamic>> filterByUserProfile(
        List<Map<String, dynamic>> inputList, String filter) {
      return inputList.where((map) => map['User Profile'] == filter).toList();
    }

    bool active = true;
    bool active2 = false;
    List<String> options = ['ALL', 'B2C', 'B2B'];
    int num = 5;
    bool active3 = false;
    return Scaffold(
      body: SafeArea(
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
                                buttonBar("Paid", active2, () {
                                  setState(() {
                                    active2 = !active2;
                                    active = !active;
                                  });
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Subs_screen()));
                                }),
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
                                    press(num),
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
                            tableData: tableData,
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
      ),
    );
  }

  Padding press(int num) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: 65,
        height: 47,
        decoration: BoxDecoration(border: Border.all(color: primaryColor)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    "${num}",
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: styletext,
                        color: black,
                        fontWeight: FontWeight.w500),
                  )),
              Expanded(
                child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            num++;
                          });
                        },
                        child: Icon(
                          Icons.arrow_drop_up,
                          color: black,
                          size: 15,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            num--;
                          });
                        },
                        child: Icon(
                          Icons.arrow_drop_down,
                          color: black,
                          size: 15,
                        ),
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
