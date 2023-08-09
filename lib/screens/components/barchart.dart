import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class barchart extends StatefulWidget {
  const barchart({super.key});

  @override
  State<barchart> createState() => _barchartState();
}

class _barchartState extends State<barchart> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: Center(
        child: LayoutBuilder(builder: (context, constraints) {
          final barsSpace = 4.0 * constraints.maxWidth / 400;
          final barsWidth = 8.0 * constraints.maxWidth / 400;
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
