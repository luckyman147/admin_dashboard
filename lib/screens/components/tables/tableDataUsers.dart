import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:karhabtiapp_dashboard_admin/model/userService.dart';

import '../../../constants/constants.dart';
import '../../functions/date.dart';

class TabledUser extends StatefulWidget {
  TabledUser(
      {super.key,
      required this.tableData,
      required this.space,
      required this.number});
  double space;
  final int number;
  List<Map<String, dynamic>> tableData;
  @override
  State<TabledUser> createState() => _TabledUserState();
}

class _TabledUserState extends State<TabledUser> {
  final UserController userController = Get.put(UserController());
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
              DataColumn(label: Text("Id", style: column)),
              DataColumn(label: Text('User ', style: column)),
              DataColumn(label: Text('Email', style: column)),
              DataColumn(label: Text('Phone', style: column)),
              DataColumn(label: Text('User Profile', style: column)),
              DataColumn(label: Text('Joining Date', style: column)),
              DataColumn(label: Text('Actions', style: column)),
            ],
            rows: List<DataRow>.generate(
                widget.number,
                (index) => DataRow(cells: [
                      DataCell(check(false)),
                      DataCell(Text(
                        " #KA${widget.tableData[index]['id']}",
                        style: column,
                      )),
                      DataCell(Text(
                        widget.tableData[index]['Username'],
                        style: column,
                      )),
                      DataCell(Text(
                        widget.tableData[index]['email'],
                        style: columnRO,
                      )),
                      DataCell(Text(
                        widget.tableData[index]['Phone'],
                        style: columnRO,
                      )),
                      DataCell(Text(
                        widget.tableData[index]['UserProfile'],
                        style: columnRO,
                      )),
                      DataCell(Text(
                        "${formatDateString(widget.tableData[index]['JoiningDate'])}",
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
                            onTap: () {
                              userController
                                  .deleteUser(widget.tableData[index]['id']);
                            },
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
