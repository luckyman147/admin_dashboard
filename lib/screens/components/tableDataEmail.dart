import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants.dart';

class TableEmail extends StatefulWidget {
  TableEmail(
      {required this.tableData, required this.space, required this.height});
  double space;
  double height;
  List<Map<String, dynamic>> tableData;
  @override
  State<TableEmail> createState() => _TableEmailState();
}

class _TableEmailState extends State<TableEmail> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 1),
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            dataRowHeight: widget.height,
            border: TableBorder(
                horizontalInside:
                    BorderSide(color: rox, style: BorderStyle.solid, width: 2)),
            showBottomBorder: true,
            sortAscending: true,

            columnSpacing: widget.space,
            // dividerThickness: 100,
            showCheckboxColumn: true,
            horizontalMargin: 12,
            // headingRowColor: MaterialStateColor.resolveWith((states) {
            //   if (states.contains(MaterialState.selected)) {
            //     return secondaryColor;
            //   }
            //   return primaryColor;
            // }),
            dataRowColor: MaterialStateColor.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return secondaryColor;
              }

              return Colors.white;
            }),
            columns: [
              DataColumn(label: check(false)),
              DataColumn(label: Text("")),
              DataColumn(label: Text("")),
              DataColumn(label: Text("")),
              DataColumn(label: Text("")),
            ],
            rows: List<DataRow>.generate(
                widget.tableData.length,
                (index) => DataRow(
                        color: MaterialStateColor.resolveWith((states) {
                          if (states.contains(MaterialState.selected)) {
                            return secondaryColor;
                          }
                          if (widget.tableData[index]['read'] == true) {
                            return Color.fromRGBO(228, 225, 225,
                                1); // Change this to the color you want for true
                          }
                          return Colors.white;
                        }),
                        cells: [
                          DataCell(check(widget.tableData[index]['index'])),
                          DataCell(Text(
                            widget.tableData[index]['Email'],
                            style: colu(24, FontWeight.bold, black),
                          )),
                          DataCell(Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.tableData[index]['Message'],
                                style: colu(27, FontWeight.w400, black),
                              ),
                              Text(
                                widget.tableData[index]['Description'],
                                style: colu(27, FontWeight.w100, textColor),
                              ),
                            ],
                          )),
                          DataCell(Text(
                            widget.tableData[index]['Date'],
                            style: colu(22, FontWeight.w400, black),
                          )),
                          DataCell(InkWell(
                            onTap: () {},
                            child: SvgPicture.asset(
                              "assets/icons/sent.svg",
                              // colorFilter:
                              //     ColorFilter.mode(
                              //         black,
                              //         BlendMode
                              //             .srcIn),
                            ),
                          ))
                        ])),
          ),
        ),
      ),
    );
  }

  Checkbox check(index) {
    return Checkbox(
      activeColor: secondaryColor,
      fillColor: MaterialStateColor.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return secondaryColor;
        }
        return Colors.white;
      }),
      value: index,
      onChanged: (value) {
        setState(() {
          index = value!;
        });
      },
      splashRadius: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      side: BorderSide(color: checkColor),
    );
  }
}
