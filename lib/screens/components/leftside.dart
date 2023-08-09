import 'package:fl_chart/fl_chart.dart';
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
          height: 150,
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
                      Column(
                        children: [
                          Text(
                            "Cost Report",
                            style: TextStyle(
                                fontFamily:
                                    GoogleFonts.poppinsTextTheme.toString(),
                                color: black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      DRopdownMethod('Today', year)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "160.7 TND ",
                              style: TextStyle(
                                  fontFamily: GoogleFonts
                                      .plusJakartaSansTextTheme
                                      .toString(),
                                  color: Color.fromRGBO(25, 25, 25, 1),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4, left: 20),
                              child: Text(
                                "- 5%",
                                style: TextStyle(
                                    fontFamily: styletext,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(216, 32, 39, 1)),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: AspectRatio(
                          aspectRatio: 2,
                          child: Center(
                            child:
                                LayoutBuilder(builder: (context, constraints) {
                              final barsSpace =
                                  4.0 * constraints.maxWidth / 400;
                              final barsWidth =
                                  8.0 * constraints.maxWidth / 400;
                              return BarChart(BarChartData(
                                  alignment: BarChartAlignment.center,
                                  barTouchData: BarTouchData(enabled: false),
                                  titlesData: FlTitlesData(show: true),
                                  gridData: FlGridData(show: false),
                                  borderData: FlBorderData(show: false),
                                  groupsSpace: barsSpace,
                                  barGroups: getData(barsWidth, barsSpace)));
                            }),
                          ),
                        ),
                      )
                    ],
                  ),
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
        height: 80,
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

  List<BarChartGroupData> getData(double barsWidth, double barsSpace) {
    return [
      BarChartGroupData(
        x: 0,
        barsSpace: barsSpace,
        barRods: [
          BarChartRodData(
            toY: 17000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 2000000000, secondaryColor),
              BarChartRodStackItem(2000000000, 12000000000, secondaryColor),
              BarChartRodStackItem(12000000000, 17000000000, secondaryColor),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 24000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 13000000000, secondaryColor),
              BarChartRodStackItem(13000000000, 14000000000, secondaryColor),
              BarChartRodStackItem(14000000000, 24000000000, secondaryColor),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 23000000000.5,
            rodStackItems: [
              BarChartRodStackItem(0, 6000000000.5, secondaryColor),
              BarChartRodStackItem(6000000000.5, 18000000000, secondaryColor),
              BarChartRodStackItem(18000000000, 23000000000.5, secondaryColor),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 29000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 9000000000, secondaryColor),
              BarChartRodStackItem(9000000000, 15000000000, secondaryColor),
              BarChartRodStackItem(15000000000, 29000000000, secondaryColor),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 32000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 2000000000.5, secondaryColor),
              BarChartRodStackItem(2000000000.5, 17000000000.5, secondaryColor),
              BarChartRodStackItem(17000000000.5, 32000000000, secondaryColor),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
        ],
      ),
      BarChartGroupData(
        x: 1,
        barsSpace: barsSpace,
        barRods: [
          BarChartRodData(
            toY: 31000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 11000000000, secondaryColor),
              BarChartRodStackItem(11000000000, 18000000000, secondaryColor),
              BarChartRodStackItem(18000000000, 31000000000, secondaryColor),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 35000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 14000000000, secondaryColor),
              BarChartRodStackItem(14000000000, 27000000000, secondaryColor),
              BarChartRodStackItem(27000000000, 35000000000, secondaryColor),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 31000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 8000000000, secondaryColor),
              BarChartRodStackItem(8000000000, 24000000000, secondaryColor),
              BarChartRodStackItem(24000000000, 31000000000, secondaryColor),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 31000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 8000000000, Colors.blue),
              BarChartRodStackItem(8000000000, 24000000000, Colors.blue),
              BarChartRodStackItem(24000000000, 31000000000, Colors.blue),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 15000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 6000000000.5, Colors.blue),
              BarChartRodStackItem(6000000000.5, 12000000000.5, Colors.blue),
              BarChartRodStackItem(12000000000.5, 15000000000, Colors.blue),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 17000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 9000000000, Colors.blue),
              BarChartRodStackItem(9000000000, 15000000000, Colors.blue),
              BarChartRodStackItem(15000000000, 17000000000, Colors.blue),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
        ],
      ),
      BarChartGroupData(
        x: 2,
        barsSpace: barsSpace,
        barRods: [
          BarChartRodData(
            toY: 34000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 6000000000, yellow),
              BarChartRodStackItem(6000000000, 23000000000, yellow),
              BarChartRodStackItem(23000000000, 34000000000, yellow),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 32000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 7000000000, yellow),
              BarChartRodStackItem(7000000000, 24000000000, yellow),
              BarChartRodStackItem(24000000000, 32000000000, yellow),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 14000000000.5,
            rodStackItems: [
              BarChartRodStackItem(0, 1000000000.5, yellow),
              BarChartRodStackItem(1000000000.5, 12000000000, yellow),
              BarChartRodStackItem(12000000000, 14000000000.5, yellow),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 20000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 4000000000, yellow),
              BarChartRodStackItem(4000000000, 15000000000, yellow),
              BarChartRodStackItem(15000000000, 20000000000, yellow),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 24000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 4000000000, yellow),
              BarChartRodStackItem(4000000000, 15000000000, yellow),
              BarChartRodStackItem(15000000000, 24000000000, yellow),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
        ],
      ),
      BarChartGroupData(
        x: 3,
        barsSpace: barsSpace,
        barRods: [
          BarChartRodData(
            toY: 14000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 1000000000.5, yellow),
              BarChartRodStackItem(1000000000.5, 12000000000, yellow),
              BarChartRodStackItem(12000000000, 14000000000, yellow),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 27000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 7000000000, yellow),
              BarChartRodStackItem(7000000000, 25000000000, yellow),
              BarChartRodStackItem(25000000000, 27000000000, yellow),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 29000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 6000000000, yellow),
              BarChartRodStackItem(6000000000, 23000000000, yellow),
              BarChartRodStackItem(23000000000, 29000000000, yellow),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 16000000000.5,
            rodStackItems: [
              BarChartRodStackItem(0, 9000000000, yellow),
              BarChartRodStackItem(9000000000, 15000000000, yellow),
              BarChartRodStackItem(15000000000, 16000000000.5, yellow),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          BarChartRodData(
            toY: 15000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 7000000000, yellow),
              BarChartRodStackItem(7000000000, 12000000000.5, yellow),
              BarChartRodStackItem(12000000000.5, 15000000000, yellow),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
        ],
      ),
    ];
  }
}
