import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants.dart';

class Tabled extends StatefulWidget {
  Tabled(
      {super.key,
      required this.tableData,
      required this.space,
      required this.number});
  double space;
  final int number;
  List<Map<String, dynamic>> tableData;
  @override
  State<Tabled> createState() => _TabledState();
}

class _TabledState extends State<Tabled> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 1),
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            border: TableBorder(
                horizontalInside:
                    BorderSide(color: rox, style: BorderStyle.solid, width: 1)),
            showBottomBorder: true,
            // sortAscending: true,

            columnSpacing: widget.space,
            dividerThickness: 3,
            showCheckboxColumn: false,
            horizontalMargin: 12,
            headingRowColor: MaterialStateColor.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return secondaryColor;
              }
              return primaryColor;
            }),
            dataRowColor: MaterialStateColor.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return secondaryColor;
              }
              return Colors.white;
            }),
            columns: [
              DataColumn(label: check(false)),
              DataColumn(label: Text("OrderID", style: column)),
              DataColumn(label: Text('Date', style: column)),
              DataColumn(label: Text('User Name', style: column)),
              DataColumn(label: Text('User Profile', style: column)),
              DataColumn(label: Text('Total', style: column)),
              DataColumn(label: Text('Payment Status', style: column)),
              DataColumn(label: Text('Actions', style: column)),
            ],
            rows: List<DataRow>.generate(
                widget.number > widget.tableData.length
                    ? widget.tableData.length
                    : widget.number,
                (index) => DataRow(cells: [
                      DataCell(check(widget.tableData[index]['index'])),
                      DataCell(Text(
                        widget.tableData[index]['OrderID'],
                        style: column,
                      )),
                      DataCell(Text(
                        widget.tableData[index]['Date'],
                        style: columnRO,
                      )),
                      DataCell(Text(
                        widget.tableData[index]['User Name'],
                        style: columnRO,
                      )),
                      DataCell(Text(
                        widget.tableData[index]['User Profile'],
                        style: columnRO,
                      )),
                      DataCell(Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            widget.tableData[index]['Total'],
                            style: columnRO,
                          ),
                          Text(
                            "TND",
                            style: columnRO,
                          )
                        ],
                      )),
                      DataCell(Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: widget.tableData[index]
                                                ['Payment Status'] ==
                                            "Paid"
                                        ? pourcentage
                                        : widget.tableData[index]
                                                    ['Payment Status'] ==
                                                "Unpaid"
                                            ? yellow
                                            : Colors.red),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 3.0),
                                child: Text(
                                  widget.tableData[index]['Payment Status'],
                                  style: columnRO,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                      DataCell(Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: SvgPicture.asset(
                              "assets/icons/modify.svg",
                              // colorFilter:
                              //     ColorFilter.mode(
                              //         black,
                              //         BlendMode
                              //             .srcIn),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: SvgPicture.asset(
                              "assets/icons/delete.svg",
                              // colorFilter:
                              //     ColorFilter.mode(
                              //         black,
                              //         BlendMode
                              //             .srcIn),
                            ),
                          ),
                        ],
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
