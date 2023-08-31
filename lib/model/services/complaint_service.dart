import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ComplainController extends GetxController {
  final RxList<Map<String, dynamic>> Complains = <Map<String, dynamic>>[].obs;
  final isLoading = false.obs;
  final RxList<Map<String, dynamic>> filteredComplains =
      <Map<String, dynamic>>[].obs;
  final searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    SelectComplainData();
    // searchByName(searchController.text);
  }

  void updateSearchText(String text) {
    searchController.text = text;
  }

//reset search text
  void resetSearchText() {
    searchController.text = '';
  }

  Future<void> SelectComplainData() async {
    isLoading.value = true;
    try {
      final response =
          await http.get(Uri.parse('http://localhost:3000/Complaints'));
      if (response.statusCode == 200) {
        final List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(
            (json.decode(response.body) as List)
                .map((item) => Map<String, dynamic>.from(item)));

        Complains.value = extractDataList(data);
        filteredComplains.value.assignAll(Complains);
        print(Complains.value);
      }
    } catch (e) {
      print(e);

      throw Exception('Failed to load data');
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> editComplainPaymentStatus(
      int ComplainId, Map<String, dynamic> TransData) async {
    try {
      final response = await http.patch(
        Uri.parse('http://localhost:3000/Complain/${ComplainId}'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(TransData),
      );
      if (response.statusCode == 200) {
        // Successfully edited, update the Complain list
        await SelectComplainData();
        print('Complain edited successfully');
        print("TransData ${TransData}");
        return true;
      } else {
        print('Failed to edit Complain');
        print(response.body);
        print("${response.statusCode}");
        return false;
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to edit Complain');
    }
  }

  Future<void> searchByName(String name) async {
    isLoading.value = true;
    try {
      final response = await http
          .get(Uri.parse('http://localhost:3000/SearchComplains?name=$name'));
      if (response.statusCode == 200) {
        final List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(
            (json.decode(response.body) as List)
                .map((item) => Map<String, dynamic>.from(item)));

        Complains.value = extractDataList(data);
        print(Complains.value);
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

        extractedData['UserId'] = user['id'];
        extractedData['UserIName'] = user['Username'];
        extractedData['UserEmail'] = user['email'];

        extractedData.remove('User');
      }

      extractedDataList.add(extractedData);
    }

    return extractedDataList;
  }

  Future<bool> deleteComplain(int ComplainId) async {
    try {
      final response = await http.delete(
        Uri.parse('http://localhost:3000/Complain/${ComplainId}'),
      );
      if (response.statusCode == 204) {
        // Successfully deleted, update the user list
        await SelectComplainData();
        print('Complain deleted successfully');
        return true;
      } else {
        print('Failed to delete Complain');
        return false;
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to delete user');
    }
  }

  void resetData() {
    Complains.clear();
    isLoading.value = false;
    // searchController.clear();
    // Call the method to fetch the initial data again
    SelectComplainData();
  }
}
