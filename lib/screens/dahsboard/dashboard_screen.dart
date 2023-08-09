// import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:karhabtiapp_dashboard_admin/screens/components/Revenue_Ana.dart';
import 'package:karhabtiapp_dashboard_admin/screens/components/tableData.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import '../components/barchar.dart';
// import 'package:google_fonts/google_fonts.dart';

import '../../constants.dart';
import '../components/Earning.dart';
import '../components/header.dart';
import '../components/leftside.dart';

class Dashboard_screen extends StatefulWidget {
  const Dashboard_screen({super.key});

  @override
  State<Dashboard_screen> createState() => _Dashboard_screenState();
}

class _Dashboard_screenState extends State<Dashboard_screen> {
  String Selected = 'ALL';
  String first = 'Aug';
  List<String> options = ['ALL', 'B2C', 'B2B'];
  List<String> monthNames = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sept',
    'Oct',
    'Nov',
    'Dec'
  ];
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
    },

    // Add more data as needed
  ];
  List<String> year = ['Today', "Week", "Month", "Year"];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        // padding: EdgeInsets.all(defaultPadding),

        child: Column(
          children: [
            Header(),
            SizedBox(
              height: defaultPadding,
              child: Container(
                color: primaryColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 2, child: LeftSide()),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      flex: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Expanded(flex: 3, child: Revenue()),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Container(
                                      height: 500,
                                      decoration: box,
                                      child: const Earn()))
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: defaultPadding),
                            child: Container(
                              height: 430,
                              decoration: box,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 18.0, horizontal: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Recent Transactions",
                                            style: TextStyle(
                                                fontFamily: styletext,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                color: black),
                                          ),
                                          searchline()
                                        ],
                                      ),
                                    ),
                                    Tabled(tableData: tableData),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        elevatedNE("Previous", () {}),
                                        elevatedNUmber("1", () {}, true),
                                        elevatedNUmber("2", () {}, false),
                                        elevatedNE("Next", () {}),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding elevatedNE(String text, VoidCallback action) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              fixedSize: Size(88, 36),
              shadowColor: bgColor,
              elevation: 1,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              backgroundColor: bgColor),
          onPressed: action,
          child: Text(
            text,
            style: TextStyle(
                fontFamily: GoogleFonts.plusJakartaSansTextTheme.toString(),
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: BABABA),
          )),
    );
  }

  Padding elevatedNUmber(String text, VoidCallback action, bool isActtive) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              fixedSize: Size(40, 36),
              shadowColor: bgColor,
              elevation: 1,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              backgroundColor: isActtive ? secondaryColor : bgColor),
          onPressed: action,
          child: Text(
            text,
            style: TextStyle(
                fontFamily: GoogleFonts.plusJakartaSansTextTheme.toString(),
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: BABABA),
          )),
    );
  }

  Row searchline() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3.0),
          child: Container(
              width: 120,
              height: 45,
              decoration:
                  BoxDecoration(border: Border.all(color: primaryColor)),
              child: NewTextField()),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
              height: 45,
              decoration:
                  BoxDecoration(border: Border.all(color: primaryColor)),
              child: DRopdownMethod("ALL", options)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3.0),
          child: Container(
              height: 45,
              decoration:
                  BoxDecoration(border: Border.all(color: primaryColor)),
              child: DRopdownMethod("2022", ["2022", "2023"])),
        ),
      ],
    );
  }

  DropdownButton<String> DRopdownMethod(String first, List<String> list) {
    return DropdownButton(
      underline: Container(),
      style: TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontFamily: GoogleFonts.plusJakartaSans.toString(),
          fontWeight: FontWeight.w400),
      value: first,
      onChanged: (value) {
        setState(() {
          first = value.toString();
        });
      },
      borderRadius: BorderRadius.circular(20),
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
      icon: Icon(
        Icons.arrow_drop_down,
        color: Colors.black,
      ),
    );
  }

  TextField NewTextField() {
    return TextField(
      decoration: InputDecoration(
          label: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text("Search ")),
          labelStyle: TextStyle(
              fontSize: 10,
              fontFamily: GoogleFonts.plusJakartaSans.toString(),
              color: black,
              fontWeight: FontWeight.w400),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: black),
          ),
          prefixIcon: InkWell(
            onTap: () {},
            child: SvgPicture.asset(
              "assets/icons/Search.svg",
              fit: BoxFit.contain,
              colorFilter: ColorFilter.mode(textgrey, BlendMode.srcIn),
            ),
          )),
    );
  }
}
