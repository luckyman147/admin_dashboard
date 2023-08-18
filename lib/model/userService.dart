import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:karhabtiapp_dashboard_admin/model/transaction.dart';

class UserController extends GetxController {
  final RxList<Map<String, dynamic>> Users = <Map<String, dynamic>>[].obs;
  final isLoading = false.obs;

  final searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    SelectUserData();
    // searchByName(searchController.text);
  }

  void updateSearchText(String text) {
    searchController.text = text;
  }

  Future<void> SelectUserData() async {
    isLoading.value = true;
    try {
      final response = await http.get(Uri.parse('http://localhost:3000/Users'));
      if (response.statusCode == 200) {
        final List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(
            (json.decode(response.body) as List)
                .map((item) => Map<String, dynamic>.from(item)));

        Users.value = extractDataList(data);
        print(Users.value);
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
          .get(Uri.parse('http://localhost:3000/SearchUser?name=$name'));
      if (response.statusCode == 200) {
        final List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(
            (json.decode(response.body) as List)
                .map((item) => Map<String, dynamic>.from(item)));

        Users.value = extractDataList(data);
        print(Users.value);
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

  Future<void> deleteUser(int userId) async {
    try {
      final response = await http.delete(
        Uri.parse('http://localhost:3000/User/${userId}'),
      );
      if (response.statusCode == 204) {
        // Successfully deleted, update the user list
        await SelectUserData();
        print('User deleted successfully');
      } else {
        print('Failed to delete user');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to delete user');
    }
  }
}
