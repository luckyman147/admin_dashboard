import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/constants.dart';

class lineChart extends StatefulWidget {
  const lineChart({super.key});

  @override
  State<lineChart> createState() => _lineChartState();
}

class _lineChartState extends State<lineChart> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: LineChart(
          LineChartData(
            lineTouchData: LineTouchData(
                touchTooltipData: LineTouchTooltipData(
                    tooltipBgColor: yellow.withOpacity(.3))),
            gridData: FlGridData(
                show: true,
                drawHorizontalLine: true,
                drawVerticalLine: false,
                horizontalInterval: 1,
                getDrawingHorizontalLine: (value) {
                  return FlLine(
                    color: Colors.grey.withOpacity(0.5),
                    strokeWidth: 1,
                  );
                }),
            titlesData: FlTitlesData(
                show: true,
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    // reservedSize: 30,
                    interval: 1,
                    getTitlesWidget: bottomTitleWidgets,
                  ),
                ),
                leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                        showTitles: true,
                        interval: 2,
                        getTitlesWidget: leftTitleWidgets))),
            borderData: FlBorderData(
                show: true,
                border: Border(
                    bottom: BorderSide(color: primaryColor),
                    left: BorderSide(color: primaryColor),
                    right: BorderSide(color: primaryColor))),
            minX: 0,
            maxX: 13,
            minY: 0,
            maxY: 9,
            lineBarsData: [
              LineChartBarData(
                spots: [
                  FlSpot(1, 3),
                  FlSpot(2, 6),
                  FlSpot(3, 4),
                  FlSpot(4, 8),
                  FlSpot(5, 5),
                  FlSpot(6, 7),
                  FlSpot(7, 2),
                  FlSpot(8, 5),
                  FlSpot(9, 3),
                  FlSpot(10, 6),
                  FlSpot(11, 6),
                  FlSpot(12, 4),
                ],
                isCurved: true,
                isStrokeCapRound: true,
                color: yellow,
                dotData: FlDotData(show: true),
                belowBarData: BarAreaData(show: false),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    final style = TextStyle(
        fontWeight: FontWeight.w400,
        color: black,
        fontSize: 12,
        fontFamily: GoogleFonts.plusJakartaSans.toString());
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0';
        break;
      case 2:
        text = '20';
        break;
      case 4:
        text = '40';
        break;
      case 6:
        text = '60';
        break;

      case 8:
        text = '100';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color: black,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = const Text('Jan', style: style);
        break;
      case 2:
        text = const Text('Feb', style: style);
        break;
      case 3:
        text = const Text('MAR', style: style);
        break;
      case 4:
        text = const Text('APR', style: style);
        break;
      case 5:
        text = const Text('MAY', style: style);
        break;

      case 6:
        text = const Text('JUN', style: style);
        break;
      case 7:
        text = const Text('JUL', style: style);
        break;
      case 8:
        text = const Text('AUG', style: style);
        break;

      case 9:
        text = const Text('SEP', style: style);
        break;
      case 10:
        text = const Text('OCT', style: style);
        break;
      case 11:
        text = const Text('NOV', style: style);
        break;
      case 12:
        text = const Text('DEC', style: style);
        break;

      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }
}
