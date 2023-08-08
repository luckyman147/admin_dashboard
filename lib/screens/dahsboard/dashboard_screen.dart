// import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
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
                              Expanded(
                                  flex: 3,
                                  child: Container(
                                      decoration: box,
                                      height: 500,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 18, horizontal: 20),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Revenue Analytics",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontFamily: GoogleFonts
                                                            .plusJakartaSansTextTheme
                                                            .toString(),
                                                        color: black,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      elebutton("Today", () {}),
                                                      elebutton(
                                                          "Weekly", () {}),
                                                      elebutton(
                                                          "Monthly", () {}),
                                                    ],
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ))),
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
                              height: 400,
                              decoration: box,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 18.0, horizontal: 22),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
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
                                        Row(
                                          children: [
                                            Container(
                                                width: 120,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: primaryColor)),
                                                child: NewTextField()),
                                          ],
                                        )
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

  Padding elebutton(String name, VoidCallback funct) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7.0),
      child: ElevatedButton(
        onPressed: funct,
        style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
        child: Text(
          name,
          style: TextStyle(
              fontFamily: GoogleFonts.poppinsTextTheme.toString(),
              fontSize: 16,
              color: black,
              fontWeight: FontWeight.w500),
        ),
      ),
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
