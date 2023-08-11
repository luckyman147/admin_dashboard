import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants.dart';

class TabledUser extends StatefulWidget {
  TabledUser({required this.tableData, required this.space});
  double space;
  List<Map<String, dynamic>> tableData;
  @override
  State<TabledUser> createState() => _TabledUserState();
}

class _TabledUserState extends State<TabledUser> {
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
              // DataColumn(label: Text("OrderID", style: column)),
              DataColumn(label: Text('User ', style: column)),
              DataColumn(label: Text('Email', style: column)),
              DataColumn(label: Text('Phone', style: column)),
              DataColumn(label: Text('User Profile', style: column)),
              DataColumn(label: Text('Joining Date', style: column)),
              DataColumn(label: Text('Actions', style: column)),
            ],
            rows: List<DataRow>.generate(
                widget.tableData.length,
                (index) => DataRow(cells: [
                      DataCell(check(widget.tableData[index]['index'])),
                      DataCell(Text(
                        widget.tableData[index]['user name'],
                        style: column,
                      )),
                      DataCell(Text(
                        widget.tableData[index]['email'],
                        style: columnRO,
                      )),
                      DataCell(Text(
                        widget.tableData[index]['phone'],
                        style: columnRO,
                      )),
                      DataCell(Text(
                        widget.tableData[index]['user profile'],
                        style: columnRO,
                      )),
                      DataCell(Text(
                        widget.tableData[index]['joining date'],
                        style: columnRO,
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
