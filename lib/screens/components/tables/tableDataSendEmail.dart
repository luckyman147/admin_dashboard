import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:karhabtiapp_dashboard_admin/model/services/SenderEmailService.dart';

import '../../../constants/constants.dart';
// import '../../../model/Get/Table_EmailController.dart';
import '../../../model/Get/Table_SendEmailController.dart';
import '../../../model/Get/counter.dart';
import '../../functions/date.dart';
import '../../functions/para.dart';
import '../dialogue/dialogueAddEmailWidget.dart';
import '../dialogue/dialogueEmailInfoWidget.dart';

class TableSendEmail extends StatefulWidget {
  TableSendEmail(
      {required this.tableData, required this.space, required this.number});
  double space;
  double number;
  List<Map<String, dynamic>> tableData;
  @override
  State<TableSendEmail> createState() => _TableSendEmailState();
}

final SendEmailController sendcontroller = Get.put(SendEmailController());

class _TableSendEmailState extends State<TableSendEmail> {
  @override
  Widget build(BuildContext context) {
    final counter = Get.put(CounterController());

    final tableController =
        Get.put(TableSendEmailStatesController(widget.tableData.length));
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
            showCheckboxColumn: true,
            horizontalMargin: 12,

            dataRowColor: MaterialStateColor.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return primaryColor;
              }

              return Colors.white;
            }),
            columns: [
              DataColumn(
                  label: Obx(() => Row(
                        children: [
                          checkAll(tableController),
                          FavoriteAll(tableController)
                        ],
                      ))),
              // DataColumn(label: Text("")),
              DataColumn(label: Text("")),
              DataColumn(label: Text("")),
              DataColumn(label: Text("")),
              // DataColumn(label: Text("")),
              DataColumn(label: Text("")),
            ],
            rows: List<DataRow>.generate(
                widget.number > 5 ? 5 : widget.number.toInt(),
                (index) => DataRow(
                        onLongPress: () {
                          showDialog(
                              context: context,
                              builder: (_) => EmailInfoAlertDialog(
                                    email: widget.tableData[index]['email'],
                                    subject: widget.tableData[index]
                                        ['SendSubject'],
                                    description: widget.tableData[index]
                                        ['SendEmailDescription'],
                                    date: formatDateString(
                                        widget.tableData[index]['Date']),
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
                                  Favorite(index, tableController)
                                ],
                              ))),
                          // DataCell(Obx(() => Favorite(index, tableController))),
                          DataCell(Text(
                            extractUsername(widget.tableData[index]['email']),
                            style: colu(24, FontWeight.bold, black),
                          )),
                          DataCell(Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.tableData[index]['SendSubject'],
                                style: colu(27, FontWeight.w400, black),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  limitParagraphLength(
                                      widget.tableData[index]
                                          ['SendEmailDescription'],
                                      50),
                                  style: colu(27, FontWeight.w100, textColor),
                                ),
                              ),
                            ],
                          )),
                          DataCell(Text(
                            "${formatDateString(widget.tableData[index]['Date'])}",
                            style: colu(22, FontWeight.w400, black),
                          )),
                          DataCell(Obx(() {
                            if (!tableController.activationList[index].value) {
                              return InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (_) => EmailAlertDialog());
                                },
                                child: SvgPicture.asset(
                                  "assets/icons/sent.svg",
                                ),
                              );
                            } else {
                              return InkWell(
                                onTap: () async {
                                  final sucess =
                                      await sendcontroller.deleteSendEmail(
                                          widget.tableData[index]['id']);
                                  counter.decrement();
                                  showCustomSnackbar(sucess, "deleted");
                                },
                                child: SvgPicture.asset(
                                  "assets/icons/delete.svg",
                                ),
                              );
                            }
                          }))
                        ])),
          ),
        ),
      ),
    );
  }

  IconButton Favorite(int index, TableSendEmailStatesController controller) {
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

  IconButton FavoriteAll(TableSendEmailStatesController controller) {
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

  Checkbox check(int index, TableSendEmailStatesController controller) {
    print("Index: $index, Activation List: ${controller.activationList}");
    print("Index: $index, favorite List: ${controller.favorite}");
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

  Checkbox checkAll(TableSendEmailStatesController controller) {
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
