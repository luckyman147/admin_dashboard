import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
// import 'package:karhabtiapp_dashboard_admin/model/transaction.dart';

class AppoitmentController extends GetxController {
  final RxList<Map<String, dynamic>> Appoitments = <Map<String, dynamic>>[].obs;
  final isLoading = false.obs;
  final RxList<Map<String, dynamic>> filteredAppoitments =
      <Map<String, dynamic>>[].obs;
  final searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    SelectAppoitmentData();
    // searchByName(searchController.text);
  }

  Future<bool> editAppoitment(
      int AppoitmentId, Map<String, dynamic> AppoitmentData) async {
    try {
      final response = await http.patch(
        Uri.parse('http://localhost:3000/Appoitment/${AppoitmentId}'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(AppoitmentData),
      );
      if (response.statusCode == 200) {
        // Successfully edited, update the transaction list
        await SelectAppoitmentData();
        print('Appoitment edited successfully');
        print("TransData ${AppoitmentData}");
        return true;
      } else {
        print('Failed to edit Appoitment');
        print(response.body);
        print("${response.statusCode}");
        return false;
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to edit Appoitment');
    }
  }

  void updateSearchText(String text) {
    searchController.text = text;
  }

  Future<bool> addAppoitment(Map<String, dynamic> AppoitmentData) async {
    try {
      final response = await http.post(
        Uri.parse('http://localhost:3000/addAppoitement'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(AppoitmentData),
      );
      if (response.statusCode == 200) {
        // Successfully added Appoitment, update the Appoitment list
        await SelectAppoitmentData();
        print('Appoitment added successfully');

        return true;
      } else {
        print(response.body);
        print("${response.statusCode}");
        return false;
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to add Appoitment');
    }
  }

  Future<void> SelectAppoitmentData() async {
    isLoading.value = true;
    try {
      final response =
          await http.get(Uri.parse('http://localhost:3000/Appoitments'));
      if (response.statusCode == 200) {
        final List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(
            (json.decode(response.body) as List)
                .map((item) => Map<String, dynamic>.from(item)));

        Appoitments.value = extractDataList(data);
        filteredAppoitments.assignAll(Appoitments);
        print(Appoitments.value);
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to load data');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> searchByName(String name) async {
    isLoading.value = true;
    try {
      final response = await http
          .get(Uri.parse('http://localhost:3000/SearchAppoitment?name=$name'));
      if (response.statusCode == 200) {
        final List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(
            (json.decode(response.body) as List)
                .map((item) => Map<String, dynamic>.from(item)));

        Appoitments.value = extractDataList(data);
        filteredAppoitments.assignAll(Appoitments);

        print(Appoitments.value);
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

  Future<bool> deleteAppoitment(int AppoitmentId) async {
    try {
      final response = await http.delete(
        Uri.parse('http://localhost:3000/Appoitment/${AppoitmentId}'),
      );
      if (response.statusCode == 204) {
        // Successfully deleted, update the Appoitment list
        await SelectAppoitmentData();
        print('Appoitment deleted successfully');
        return true;
      } else {
        print('Failed to delete Appoitment');
        print(response.body);
        print("${response.statusCode}");
        return false;
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to delete Appoitment');
    }
  }
}
