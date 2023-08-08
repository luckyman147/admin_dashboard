import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants.dart';

class SalesANA extends StatefulWidget {
  SalesANA({required this.first, required this.monthNames});
  List<String> monthNames;

  String first;
  @override
  State<SalesANA> createState() => _SalesState();
}

class _SalesState extends State<SalesANA> {
  String Selected = 'ALL';
  List<String> options = ['ALL', 'B2C', 'B2B'];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: box,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 9, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sales Analytics",
                    style: TextStyle(
                        fontFamily:
                            GoogleFonts.plusJakartaSansTextTheme.toString(),
                        color: black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  //Drop down shadow
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    alignment: Alignment.center,
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(color: primaryColor, width: 2),
                        color: bgColor,
                        borderRadius: BorderRadius.circular(4)),
                    child: DRopdownMethod(widget.first, widget.monthNames),
                  ),
                ],
              ),
              sales("Service Providers", 40, yellow),
              sales("Appointement", 45, secondaryColor),
              sales("Drivers Subscription", 50, pourcentage),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: SizedBox(
                    height: 200,
                    child: PieChart(PieChartData(sectionsSpace: 4, sections: [
                      PieChartSectionData(
                          borderSide: BorderSide(
                              style: BorderStyle.solid, color: yellow),
                          color: yellow,
                          value: 40,
                          showTitle: false,
                          radius: 15),
                      PieChartSectionData(
                          color: secondaryColor,
                          value: 45,
                          showTitle: false,
                          radius: 15),
                      PieChartSectionData(
                          color: pourcentage,
                          value: 25,
                          showTitle: false,
                          radius: 15),
                    ]))),
              )
            ],
          ),
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

  Padding sales(String service, double num, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
                border: Border.all(width: 1, color: yellow),
                boxShadow: [
                  BoxShadow(
                      blurStyle: BlurStyle.normal,
                      color: color,
                      spreadRadius: 4,
                      blurRadius: 4,
                      offset: Offset(0, 0))
                ]),
          ),
          Text(service,
              style: TextStyle(
                  fontFamily: styletext,
                  fontSize: 16,
                  color: textgrey,
                  fontWeight: FontWeight.w400)),
          Text(
            "${num} % ",
            style: TextStyle(
                fontFamily: styletext,
                color: black,
                fontSize: 16,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
