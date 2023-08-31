import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:karhabtiapp_dashboard_admin/model/Get/Table_complainController.dart';
import 'package:karhabtiapp_dashboard_admin/model/Get/counter.dart';
import 'package:karhabtiapp_dashboard_admin/model/services/ReceiveEmailService.dart';
import 'package:karhabtiapp_dashboard_admin/model/services/complaint_service.dart';
import 'package:karhabtiapp_dashboard_admin/screens/components/dialogue/dialogueAddEmailWidget.dart';
import 'package:karhabtiapp_dashboard_admin/screens/components/dialogue/dialogueEmailInfoWidget.dart';
import 'package:karhabtiapp_dashboard_admin/screens/functions/para.dart';

import '../../../constants/constants.dart';
import '../../../model/Get/Table_EmailController.dart';
import '../../functions/date.dart';
import '../dialogue/dialoguecomplaintInfoWidget.dart';

class TableComplaince extends StatefulWidget {
  TableComplaince(
      {required this.tableData, required this.space, required this.number});
  double space;
  double number;
  List<Map<String, dynamic>> tableData;
  @override
  State<TableComplaince> createState() => _TableComplainceState();
}

class _TableComplainceState extends State<TableComplaince> {
  @override
  Widget build(BuildContext context) {
    final counter = Get.put(CounterController());
    final complaincontroller = Get.put(ComplainController());
    final tableController =
        Get.put(TableComplainceStatesController(widget.tableData.length));
    var textStyle =
        TextStyle(fontSize: 20, color: black, fontWeight: FontWeight.bold);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 1),
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            // dataRowHeight: widget.number,
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
              DataColumn(
                  label: Obx(() => Row(
                        children: [
                          checkAll(tableController),
                        ],
                      ))),
              DataColumn(label: Text("UserName", style: textStyle)),
              DataColumn(
                  label: Text(
                "Subject",
                style: textStyle,
              )),
              DataColumn(
                  label: Text(
                "Date",
                style: textStyle,
              )),
              DataColumn(
                  label: Text(
                "Actions",
                style: textStyle,
              )),
            ],
            rows: List<DataRow>.generate(
                widget.number > 5 ? 5 : widget.number.toInt(),
                (index) => DataRow(
                        onLongPress: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  ComplaintInfoAlertDialog(
                                    Username: widget.tableData[index]
                                        ['UserIName'],
                                    date: formatDateString(
                                        widget.tableData[index]['Date']),
                                    subject: widget.tableData[index]['Subject'],
                                    contenu: widget.tableData[index]['contenu'],
                                  ));
                        },
                        // color: MaterialStateColor.resolveWith((states) {
                        //   if (states.contains(MaterialState.selected)) {
                        //     return secondaryColor;
                        //   }
                        //   if (widget.tableData[index]['read'] == true) {
                        //     return Color.fromRGBO(228, 225, 225,
                        //         1); // Change this to the color you want for true
                        //   }
                        //   return Colors.white;
                        // }),
                        cells: [
                          DataCell(Obx(() => Row(
                                children: [
                                  check(index, tableController),
                                ],
                              ))),
                          // DataCell(check(false)),
                          DataCell(Text(
                            widget.tableData[index]['UserIName'],
                            style: colu(24, FontWeight.bold, black),
                          )),
                          DataCell(Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.tableData[index]['Subject'],
                                style: colu(27, FontWeight.w400, black),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  limitParagraphLength(
                                      widget.tableData[index]['contenu'], 50),
                                  style: colu(27, FontWeight.w100, textColor),
                                ),
                              ),
                            ],
                          )),
                          DataCell(Text(
                            formatDateString(widget.tableData[index]['Date']),
                            style: colu(22, FontWeight.w400, black),
                          )),

                          DataCell(Obx(() {
                            if (!tableController.activationList[index].value) {
                              return InkWell(
                                  onTap: () {},
                                  child: Text(
                                    "Reply",
                                    style: TextStyle(
                                        color: secondaryColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: styletext,
                                        decoration: TextDecoration.underline),
                                  ));
                            } else {
                              return InkWell(
                                  onTap: () async {
                                    final sucess =
                                        await complaincontroller.deleteComplain(
                                            widget.tableData[index]['id']);
                                    counter.decrement();
                                    showCustomSnackbar(
                                        sucess, "deleted", "complaint");
                                  },
                                  child: Text(
                                    "Delete",
                                    style: TextStyle(
                                      color: red,
                                      fontSize: 19,
                                      fontFamily: styletext,
                                    ),
                                  ));
                            }
                          }))
                        ])),
          ),
        ),
      ),
    );
  }

  IconButton Favorite(int index, TableComplainceStatesController controller) {
    return IconButton(
      focusColor: bgColor,
      splashColor: bgColor,
      splashRadius: 1,
      hoverColor: bgColor,
      onPressed: () {
        if (controller.favorite[index].value) {
          controller.deactivatefav(index);
        } else {
          controller.activatedFav(index);
        }
      },
      icon: controller.favorite[index].value
          ? Icon(
              Icons.star,
              color: secondaryColor,
            )
          : Icon(
              Icons.star_border,
              color: secondaryColor,
            ),
    );
  }

  IconButton FavoriteAll(TableComplainceStatesController controller) {
    return IconButton(
      focusColor: bgColor,
      splashColor: bgColor,
      splashRadius: 1,
      hoverColor: bgColor,
      onPressed: () {
        if (controller.favoriteall.value) {
          controller.deactivateFavAll();
        } else {
          controller.activateFavAll();
        }
      },
      icon: controller.favoriteall.value
          ? Icon(
              Icons.star,
              color: secondaryColor,
            )
          : Icon(
              Icons.star_border,
              color: secondaryColor,
            ),
    );
  }

  Checkbox check(int index, TableComplainceStatesController controller) {
    print("Index: $index, Activation List: ${controller.activationList}");
    return Checkbox(
      activeColor: secondaryColor,
      fillColor: MaterialStateColor.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return secondaryColor;
        }
        return Colors.white;
      }),
      value: controller.activationList[index].value,
      onChanged: (value) {
        if (controller.activationList[index].value) {
          controller.deactivate(index);
        } else {
          controller.activate(index);
        }
      },
      splashRadius: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      side: BorderSide(color: checkColor),
    );
  }

  Checkbox checkAll(TableComplainceStatesController controller) {
    return Checkbox(
      activeColor: secondaryColor,
      fillColor: MaterialStateColor.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return secondaryColor;
        }
        return Colors.white;
      }),
      value: controller.checkall.value,
      onChanged: (value) {
        if (controller.checkall.value) {
          controller.deactivateAll();
        } else {
          controller.activateAll();
        }
      },
      splashRadius: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      side: BorderSide(color: checkColor),
    );
  }
}
