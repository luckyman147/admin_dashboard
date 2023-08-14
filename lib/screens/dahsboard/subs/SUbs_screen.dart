import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:karhabtiapp_dashboard_admin/provider/table_Provider.dart';
import 'package:karhabtiapp_dashboard_admin/screens/components/tableData.dart';
import 'package:karhabtiapp_dashboard_admin/provider/boolStates.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../buttons/dropdownbutton.dart';
import '../../components/header.dart';
import '../../components/pres.dart';

class Subs_screen extends StatefulWidget {
  const Subs_screen({super.key});

  @override
  State<Subs_screen> createState() => _Subs_screenState();
}

class _Subs_screenState extends State<Subs_screen> {
  @override
  Widget build(BuildContext context) {
    final boolprovder = Provider.of<BooleanStatesProvider>(context);
    final tableprovder = Provider.of<TableStatesProvider>(context);
    final tableData = tableprovder.tableData;
    //  = tableprovder.filterByPayment("Paid");

    List<Map<String, dynamic>> filterByUserProfile(
        List<Map<String, dynamic>> inputList, String filter) {
      return inputList.where((map) => map['User Profile'] == filter).toList();
    }

    List<String> options = ['ALL', 'B2C', 'B2B'];
    int num = 5;

    return Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
          height: 600,
          decoration: box,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border:
                            Border(bottom: BorderSide(color: primaryColor))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          buttonBar(
                              "All Subscriptions", boolprovder.isFirstActive,
                              () {
                            boolprovder.activateFirst();

                            tableprovder.resetFilters();
                            // tableprovder.tabledata = tableData;

                            setState(() {});
                          }),
                          buttonBar("Paid", boolprovder.isSecondActive, () {
                            boolprovder.activateSecond();
                            tableprovder.filterByPayment("Paid");
                          }),
                          buttonBar("Unpaid", boolprovder.isThirdActive, () {
                            boolprovder.activateThird();
                            tableprovder.filterByPayment("Unpaid");
                          }),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Show",
                              style: row,
                            ),
                            press(),
                            Text(
                              "Rows",
                              style: row,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Container(
                                  height: 45,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: primaryColor)),
                                  child: DRopdownMethod(
                                      first: "ALL", list: options)),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 3.0),
                              child: Container(
                                  height: 45,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: primaryColor)),
                                  child: DRopdownMethod(
                                      first: "2022", list: ["2022", "2023"])),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Tabled(
                    tableData: tableData,
                    space: 90,
                    number: num,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        elevatedNE("Previous", () {}),
                        elevatedNUmber("1", () {}, true),
                        elevatedNUmber("2", () {}, false),
                        elevatedNE("Next", () {}),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
