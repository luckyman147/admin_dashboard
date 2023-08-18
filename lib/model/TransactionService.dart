import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:karhabtiapp_dashboard_admin/constants/utils.dart';
import 'package:karhabtiapp_dashboard_admin/model/transaction.dart';

class TransactionController extends GetxController {
  final RxList<Map<String, dynamic>> transactions =
      <Map<String, dynamic>>[].obs;
  final isLoading = false.obs;
  final RxList<Map<String, dynamic>> filteredTransactions =
      <Map<String, dynamic>>[].obs;
  final searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    SelectTransactionData();
    // searchByName(searchController.text);
  }

  void updateSearchText(String text) {
    searchController.text = text;
  }

//reset search text
  void resetSearchText() {
    searchController.text = '';
  }

  Future<void> SelectTransactionData() async {
    isLoading.value = true;
    try {
      final response =
          await http.get(Uri.parse('http://localhost:3000/Transactions'));
      if (response.statusCode == 200) {
        final List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(
            (json.decode(response.body) as List)
                .map((item) => Map<String, dynamic>.from(item)));

        transactions.value = extractDataList(data);
        print(transactions.value);
      }
    } catch (e) {
      print(e);

      throw Exception('Failed to load data');
    } finally {
      isLoading.value = false;
    }
  }

  void filterByPaymentStatus(String paymentStatus) {
    if (paymentStatus == 'ALL') {
      filteredTransactions.assignAll(transactions);
    } else {
      // SelectTransactionData();
      filteredTransactions.assignAll(transactions
          .where((transaction) => transaction['PaymentStatus'] == paymentStatus)
          .toList());
    }
  }

  void filterByYear(String selectedDate) {
    if (selectedDate == "ALL") {
      // No filtering required, show all transactions
      filteredTransactions.assignAll(transactions);
    } else {
      // Filter transactions based on year

      filteredTransactions.assignAll(transactions.where((transaction) {
        final transactionDate = DateTime.parse(transaction['Date']);
        return transactionDate.year.toString() == selectedDate;
      }));
    }
  }

  void filterByUserProfile(String userProfile) {
    if (userProfile == 'ALL') {
      // No filtering required, show all transactions
      filteredTransactions.assignAll(transactions);
    } else {
      // Filter transactions based on UserProfile
      filteredTransactions.assignAll(transactions
          .where((transaction) => transaction['UserProfile'] == userProfile));
    }
  }

  Future<void> searchByName(String name) async {
    isLoading.value = true;
    try {
      final response = await http.get(
          Uri.parse('http://localhost:3000/SearchTransactions?name=$name'));
      if (response.statusCode == 200) {
        final List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(
            (json.decode(response.body) as List)
                .map((item) => Map<String, dynamic>.from(item)));

        transactions.value = extractDataList(data);
        print(transactions.value);
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to load data');
    } finally {
      isLoading.value = false;
    }
  }

  List<Map<String, dynamic>> extractDataList(
      List<Map<String, dynamic>> dataList) {
    List<Map<String, dynamic>> extractedDataList = [];

    for (var data in dataList) {
      Map<String, dynamic> extractedData = Map.from(data)
        ..remove('createdAt')
        ..remove('updatedAt');

      if (extractedData.containsKey('User')) {
        Map<String, dynamic> user = Map.from(extractedData['User']);
        extractedData['UserIName'] = user['Username'];
        extractedData['UserProfile'] = user['UserProfile'];
        extractedData.remove('User');
      }

      extractedDataList.add(extractedData);
    }

    return extractedDataList;
  }

  Future<void> deleteTransaction(int transactionId) async {
    try {
      final response = await http.delete(
        Uri.parse('http://localhost:3000/transaction/${transactionId}'),
      );
      if (response.statusCode == 204) {
        // Successfully deleted, update the user list
        await SelectTransactionData();
        print('Transaction deleted successfully');
      } else {
        print('Failed to delete Transaction');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to delete user');
    }
  }

  void resetData() {
    transactions.clear();
    isLoading.value = false;
    // searchController.clear();
    // Call the method to fetch the initial data again
    SelectTransactionData();
  }
}
