import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karhabtiapp_dashboard_admin/model/Get/counter.dart';
import 'package:karhabtiapp_dashboard_admin/screens/components/tables/tableData.dart';

import '../../../constants/constants.dart';
import '../../../model/services/TransactionService.dart';

class TableConfigWidget extends StatefulWidget {
  final double sized;

  TableConfigWidget({required this.sized});

  @override
  _TableConfigWidgetState createState() => _TableConfigWidgetState();
}

class _TableConfigWidgetState extends State<TableConfigWidget> {
  final TransactionController transactionController =
      Get.put(TransactionController());
  final counter = Get.put(CounterController());

  @override
  void initState() {
    super.initState();
    transactionController.SelectTransactionData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: transactionController.SelectTransactionData(),
      builder: (context, snapshot) {
        print(snapshot);
        print(
            'Transaction Data: ${transactionController.filteredTransactions}');
        print('Counter Value: ${counter.count.value}');
// print('Selected Date: ${.selectedDate.value}');
        if (snapshot.connectionState == ConnectionState.done) {
          return Obx(() {
            if (transactionController.transactions.isNotEmpty) {
              return Tabled(
                tableData: transactionController.filteredTransactions,
                space: widget.sized,
                number: counter.count.value >
                        transactionController.filteredTransactions.length
                    ? transactionController.filteredTransactions.length
                    : counter.count.value,
              );
            } else {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50.0),
                  child: Text(
                    "No Transactions Found",
                    style: TextStyle(color: black, fontSize: 22),
                  ),
                ),
              );
            }
          });
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return Obx(() {
            if (transactionController.isLoading.value) {
              return CircularProgressIndicator();
            } else {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50.0),
                  child: Text(
                    "No DATA Found",
                    style: TextStyle(color: black, fontSize: 22),
                  ),
                ),
              );
            }
          });
        }
      },
    );
  }
}
