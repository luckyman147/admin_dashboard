import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
// import 'package:karhabtiapp_dashboard_admin/model/transaction.dart';

class EmailController extends GetxController {
  final RxList<Map<String, dynamic>> Emails = <Map<String, dynamic>>[].obs;
  final isLoading = false.obs;
  final RxList<Map<String, dynamic>> filteredEmails =
      <Map<String, dynamic>>[].obs;
  final searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    SelectEmailData();
    // searchByName(searchController.text);
  }

  Future<bool> editEmail(int EmailId, Map<String, dynamic> EmailData) async {
    try {
      final response = await http.patch(
        Uri.parse('http://localhost:3000/Email/${EmailId}'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(EmailData),
      );
      if (response.statusCode == 200) {
        // Successfully edited, update the transaction list
        await SelectEmailData();
        print('Email edited successfully');
        print("TransData ${EmailData}");
        return true;
      } else {
        print('Failed to edit Email');
        print(response.body);
        print("${response.statusCode}");
        return false;
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to edit Email');
    }
  }

  Future<void> SelectEmailData() async {
    isLoading.value = true;
    try {
      final response =
          await http.get(Uri.parse('http://localhost:3000/Emails'));
      if (response.statusCode == 200) {
        final List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(
            (json.decode(response.body) as List)
                .map((item) => Map<String, dynamic>.from(item)));

        Emails.value = extractDataList(data);
        filteredEmails.assignAll(Emails);
        print(Emails.value);
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

      extractedDataList.add(extractedData);
    }

    return extractedDataList;
  }

  Future<bool> deleteEmail(int EmailId) async {
    try {
      final response = await http.delete(
        Uri.parse('http://localhost:3000/Email/${EmailId}'),
      );
      if (response.statusCode == 204) {
        // Successfully deleted, update the Email list
        await SelectEmailData();
        print('Email deleted successfully');
        return true;
      } else {
        print('Failed to delete Email');
        print(response.body);
        print("${response.statusCode}");
        return false;
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to delete Email');
    }
  }
}
