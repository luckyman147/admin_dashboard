import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants.dart';
import 'Sales.dart';

class LeftSide extends StatefulWidget {
  const LeftSide({super.key});

  @override
  State<LeftSide> createState() => _LeftSideState();
}

class _LeftSideState extends State<LeftSide> {
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        score(context, "Number of Subscription", 27, 45),
        SizedBox(
          height: defaultPadding,
        ),
        score(context, "Revenue From Subscription", 22, 32),
        SizedBox(
          height: defaultPadding,
        ),
        score(context, "Commission  from subscription", 12, 43, ISTND: false),
        SizedBox(
          height: defaultPadding,
        ),
        SalesANA(
          first: first,
          monthNames: monthNames,
        ),
        SizedBox(
          height: defaultPadding,
        ),
        Container(
          height: 200,
          decoration: box,
          child: SingleChildScrollView(
            child: Padding(
              // padding: EdgeInsets.all(8),
              padding: EdgeInsets.symmetric(horizontal: 9, vertical: 10),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Cost Report",
                        style: TextStyle(
                            fontFamily: GoogleFonts.poppinsTextTheme.toString(),
                            color: black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      DRopdownMethod('Today', year)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "160.7 TND ",
                        style: TextStyle(
                            fontFamily:
                                GoogleFonts.plusJakartaSansTextTheme.toString(),
                            color: Color.fromRGBO(25, 25, 25, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Container score(BuildContext context, String desc, double perc, double amount,
      {bool ISTND = true}) {
    return Container(
        height: 77,
        // padding: EdgeInsets.all(8),
        // color: bgColor,
        decoration: box,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 9.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    desc,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: GoogleFonts.plusJakartaSans.toString(),
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 7),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    width: 88,
                    height: 24,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(18)),
                    child: DropdownButton(
                      underline: Container(),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w300),
                      value: Selected,
                      onChanged: (value) {
                        setState(() {
                          Selected = value.toString();
                        });
                      },
                      borderRadius: BorderRadius.circular(20),
                      items: options.map((e) {
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
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 1.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "${perc}%",
                      style: TextStyle(
                          fontFamily: GoogleFonts.openSans.toString(),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: pourcentage),
                    ),
                    Text(
                      "From Last Period",
                      style: TextStyle(
                          fontFamily: GoogleFonts.poppinsTextTheme.toString(),
                          fontSize: 12,
                          fontWeight: FontWeight.w200,
                          color: Colors.black),
                    ),
                    Text(
                      ISTND == true ? " ${amount}" : "${amount} TND",
                      style: TextStyle(
                          fontFamily: GoogleFonts.poppinsTextTheme.toString(),
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
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
}
