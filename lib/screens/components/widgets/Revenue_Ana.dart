import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:karhabtiapp_dashboard_admin/screens/components/widgets/linechart.dart';

import '../../../constants/constants.dart';

class Revenue extends StatelessWidget {
  const Revenue({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: box,
        height: 500,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Revenue Analytics",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily:
                              GoogleFonts.plusJakartaSansTextTheme.toString(),
                          color: black,
                          fontWeight: FontWeight.w500),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        elebutton("Today", () {}),
                        elebutton("Weekly", () {}),
                        elebutton("Monthly", () {}),
                      ],
                    )
                  ],
                ),
                lineChart(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: yellow),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 7.0),
                        child: Text(
                          "Total Revenue",
                          style: TextStyle(
                              fontFamily: styletext,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: black),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
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
}
