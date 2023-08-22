import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:karhabtiapp_dashboard_admin/model/TransactionService.dart';
import 'package:karhabtiapp_dashboard_admin/model/boolStates.dart';
import 'package:karhabtiapp_dashboard_admin/model/table_controller.dart';
import 'package:karhabtiapp_dashboard_admin/screens/components/dialogueEditWidget.dart';
import 'package:provider/provider.dart';

import '../../../constants/constants.dart';
import '../../../model/counter.dart';

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
  void initState() {
    super.initState();
  }

  @override
  final TransactionController transactionController =
      Get.put(TransactionController());
  final counter = Get.put(CounterController());

  Widget build(BuildContext context) {
    final tableController =
        Get.put(TableStatesController(widget.tableData.length));
    // final boolProvider = Provider.of<BooleanStatesProvider>(context);
    // final tableProvider = Provider.of<TableStatesProvider>(context);
    if (widget.tableData.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 1),
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              border: TableBorder(
                  horizontalInside: BorderSide(
                      color: rox, style: BorderStyle.solid, width: 1)),
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
                DataColumn(label: Obx(() => checkAll(
                    // boolProvider.isCheckActive,
                    tableController
                    //tableProvider, boolProvider
                    ))),
                DataColumn(label: Text("OrderID", style: column)),
                DataColumn(label: Text('Date', style: column)),
                DataColumn(label: Text('User Name', style: column)),
                DataColumn(label: Text('User Profile', style: column)),
                DataColumn(label: Text('Total', style: column)),
                DataColumn(label: Text('Payment Status', style: column)),
                DataColumn(label: Text('Actions', style: column)),
              ],
              rows: List<DataRow>.generate(
                  widget.number > 5 ? 5 : widget.number,
                  (index) => DataRow(cells: [
                        DataCell(Obx(() => check(index, tableController))),
                        DataCell(Text(
                          '#Ka${widget.tableData[index]['id']}',
                          style: column,
                        )),
                        DataCell(Text(
                          " ${formatDateString(widget.tableData[index]['Date'])}",
                          style: columnRO,
                        )),
                        DataCell(Text(
                          widget.tableData[index]['UserIName'],
                          style: columnRO,
                        )),
                        DataCell(Text(
                          widget.tableData[index]['UserProfile'],
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
                                                  ['PaymentStatus'] ==
                                              "Paid"
                                          ? pourcentage
                                          : widget.tableData[index]
                                                      ['PaymentStatus'] ==
                                                  "Unpaid"
                                              ? yellow
                                              : Colors.red),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 3.0),
                                  child: Text(
                                    widget.tableData[index]['PaymentStatus'],
                                    style: columnRO,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                        DataCell(Obx(() => Visibility(
                              visible:
                                  tableController.activationList[index].value,
                              maintainSize: false,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (buider) => MyEditDialog(
                                                id: widget.tableData[index]
                                                    ['id'],
                                                date: formatDateString(widget
                                                    .tableData[index]['Date']),
                                                userName:
                                                    widget.tableData[index]
                                                        ['UserIName'],
                                                userProfil:
                                                    widget.tableData[index]
                                                        ['UserProfile'],
                                                total: widget.tableData[index]
                                                    ['Total'],
                                                paymentStatus:
                                                    widget.tableData[index]
                                                        ['PaymentStatus'],
                                                Userid: widget.tableData[index]
                                                    ['UserId'],
                                              ));
                                    },
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
                                    onTap: () async {
                                      final sucess = await transactionController
                                          .deleteTransaction(
                                              widget.tableData[index]['id']);
                                      counter.decrement();
                                      showCustomSnackbar(sucess, "deleted");
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
                              ),
                            ))),
                      ])),
            ),
          ),
        ),
      );
    }
    return Center(
      child: Text(
        "No Data",
        style: TextStyle(color: black, fontSize: 23),
      ),
    );
  }

  String formatDateString(String dateString) {
    List<String> months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sept",
      "Oct",
      "Nov",
      "Dec"
    ];

    List<String> dateParts = dateString.split('-');
    int year = int.parse(dateParts[0]);
    int month = int.parse(dateParts[1]);
    int day = int.parse(dateParts[2]);

    String monthName = months[month - 1];

    String formattedDate = "$day $monthName $year";
    return formattedDate;
  }

  Checkbox checkAll(TableStatesController controller) {
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

  Checkbox check(int index, TableStatesController controller) {
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
}
