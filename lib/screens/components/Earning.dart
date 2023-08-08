import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants.dart';

class Earn extends StatelessWidget {
  const Earn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 22),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Earning Reports",
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: GoogleFonts.plusJakartaSansTextTheme.toString(),
                  color: black,
                  fontWeight: FontWeight.w500),
            ),
            piechart(yellow, 70),
            textearn("Monthly Earnings", FontWeight.w400),
            textearn("5555 TND", FontWeight.bold),
            piechart(secondaryColor, 70),
            textearn("Weekly Earnings", FontWeight.w400),
            textearn("2122 TND", FontWeight.bold),
          ],
        ),
      ),
    );
  }

  Center textearn(String text, FontWeight weight) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
            fontSize: 19,
            fontFamily: GoogleFonts.plusJakartaSansTextTheme.toString(),
            color: black,
            fontWeight: weight),
      ),
    );
  }

  Padding piechart(Color color, double perc) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: SizedBox(
          height: 100,
          child: PieChart(PieChartData(sectionsSpace: 2, sections: [
            PieChartSectionData(
                borderSide: BorderSide(style: BorderStyle.solid, color: color),
                color: color,
                value: perc,
                showTitle: false,
                radius: 12),
            PieChartSectionData(
                color: primaryColor,
                value: 100 - perc,
                showTitle: false,
                radius: 12),
          ]))),
    );
  }
}
