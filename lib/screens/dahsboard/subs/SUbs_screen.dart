import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:karhabtiapp_dashboard_admin/model/counter.dart';
// import 'package:karhabtiapp_dashboard_admin/model/table_controller.dart';
import 'package:karhabtiapp_dashboard_admin/screens/buttons/dropdownbuttonProfile.dart';
// import 'package:karhabtiapp_dashboard_admin/screens/components/tables/tableData.dart';
import 'package:karhabtiapp_dashboard_admin/model/boolStates.dart';
import 'package:karhabtiapp_dashboard_admin/screens/components/tables/tablesConfig.dart';

import '../../../constants/constants.dart';
import '../../../model/TransactionService.dart';
import '../../../model/listController.dart';
import '../../buttons/dropdownbutton.dart';
import '../../components/widgets/pres.dart';

class Subs_screen extends StatefulWidget {
  const Subs_screen({super.key});

  @override
  State<Subs_screen> createState() => _Subs_screenState();
}

class _Subs_screenState extends State<Subs_screen> {
  final TransactionController transactionController =
      Get.put(TransactionController());
  @override
  void initState() {
    if (transactionController.transactions.isEmpty) {
      print('object');
      transactionController.SelectTransactionData();
    }
    transactionController.SelectTransactionData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TransactionController transactionController =
        Get.put(TransactionController());
    final BooleanStatesController bools = Get.put(BooleanStatesController());
    final DropdownController dropdownController = Get.put(DropdownController());
    final counter = Get.put(CounterController());
    List<Map<String, dynamic>> filterByUserProfile(
        List<Map<String, dynamic>> inputList, String filter) {
      return inputList.where((map) => map['User Profile'] == filter).toList();
    }

    var media = MediaQuery.sizeOf(context);
    List<String> options = ['ALL', 'B2C', 'B2B'];

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
                          Obx(() => buttonBar(
                                  "All Subscriptions", bools.isFirstActive, () {
                                bools.activateFirst();
                                final len = transactionController
                                    .filterByPaymentStatus('ALL');
                                counter.set(len);

                                // tableprovder.resetFilters();
                                // tableprovder.tabledata = tableData;
                              })),
                          Obx(() => buttonBar("Paid", bools.isSecondActive, () {
                                bools.activateSecond();
                                if (transactionController
                                    .transactions.isEmpty) {
                                  transactionController.resetData();
                                }
                                final len = transactionController
                                    .filterByPaymentStatus("Paid");
                                counter.set(len);
                              })),
                          Obx(() =>
                              buttonBar("Unpaid", bools.isThirdActive, () {
                                bools.activateThird();
                                final len = transactionController
                                    .filterByPaymentStatus("Unpaid");
                                counter.set(len);
                                // tableprovder.filterByPayment("Unpaid");
                              })),
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
                                  child: Obx(() => DRopdownPROFILMethod(
                                      first: dropdownController.firstcopy.value,
                                      list: options))),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 3.0),
                              child: Container(
                                  height: 45,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: primaryColor)),
                                  child: Obx(() => DRopdownYearMethod(
                                      first: dropdownController.year.value,
                                      list: dropdownController.years))),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  RefreshIndicator(
                      onRefresh: () {
                        return Future.delayed(Duration(seconds: 1), () {
                          setState(() {});
                        });
                      },
                      child: TableConfigWidget(sized: media.width * .0502)),
                  Obx(() {
                    if (transactionController.transactions.isNotEmpty)
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            elevatedNE("Previous", () {}),
                            elevatedNUmber("1", () {}, true),
                            elevatedNUmber("2", () {}, false),
                            elevatedNE("Next", () {}),
                          ],
                        ),
                      );
                    else
                      return Container();
                  })
                ],
              ),
            ),
          ),
        ));
  }
}
