import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:karhabtiapp_dashboard_admin/constants/utils.dart';
// import 'package:karhabtiapp_dashboard_admin/model/SendEmail.dart';

class SendEmailController extends GetxController {
  final RxList<Map<String, dynamic>> SendEmails = <Map<String, dynamic>>[].obs;
  final isLoading = false.obs;
  final RxList<Map<String, dynamic>> filteredSendEmails =
      <Map<String, dynamic>>[].obs;
  final searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    SelectSendEmailData();
  }

//add email
  Future<bool> addSendEmail(Map<String, dynamic> SendEmailData) async {
    try {
      final response = await http.post(
        Uri.parse('http://localhost:3000/addSendEmail'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(SendEmailData),
      );
      if (response.statusCode == 200) {
        // Successfully added, update the SendEmail list
        await SelectSendEmailData();
        print('SendEmail added successfully');
        print("SendEmailData ${SendEmailData}");
        return true;
      } else {
        print('Failed to add SendEmail');
        print(response.body);
        print("${response.statusCode}");
        return false;
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to add SendEmail');
    }
  }

  Future<void> SelectSendEmailData() async {
    isLoading.value = true;
    try {
      final response =
          await http.get(Uri.parse('http://localhost:3000/SendEmails'));
      if (response.statusCode == 200) {
        final List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(
            (json.decode(response.body) as List)
                .map((item) => Map<String, dynamic>.from(item)));

        SendEmails.value = extractDataList(data);
        filteredSendEmails.value.assignAll(SendEmails);
        print(SendEmails.value);
      }
    } catch (e) {
      print(e);

      throw Exception('Failed to load data');
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> editSendEmail(
      int SendEmailId, Map<String, dynamic> TransData) async {
    try {
      final response = await http.patch(
        Uri.parse('http://localhost:3000/SendEmail/${SendEmailId}'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(TransData),
      );
      if (response.statusCode == 200) {
        // Successfully edited, update the SendEmail list
        await SelectSendEmailData();
        print('SendEmail edited successfully');
        print("TransData ${TransData}");
        return true;
      } else {
        print('Failed to edit SendEmail');
        print(response.body);
        print("${response.statusCode}");
        return false;
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to edit SendEmail');
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

  Future<bool> deleteSendEmail(int SendEmailId) async {
    try {
      final response = await http.delete(
        Uri.parse('http://localhost:3000/SendEmail/${SendEmailId}'),
      );
      if (response.statusCode == 204) {
        // Successfully deleted, update the user list
        await SelectSendEmailData();
        print('SendEmail deleted successfully');
        return true;
      } else {
        print('Failed to delete SendEmail');
        return false;
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to delete user');
    }
  }

  void resetData() {
    SendEmails.clear();
    isLoading.value = false;
    // searchController.clear();
    // Call the method to fetch the initial data again
    SelectSendEmailData();
  }
}
