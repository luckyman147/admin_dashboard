import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
// import 'package:karhabtiapp_dashboard_admin/model/transaction.dart';

class UserController extends GetxController {
  final RxList<Map<String, dynamic>> Users = <Map<String, dynamic>>[].obs;
  final isLoading = false.obs;
  final RxList<Map<String, dynamic>> filteredUsers =
      <Map<String, dynamic>>[].obs;
  final searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    SelectUserData();
    // searchByName(searchController.text);
  }

  Future<bool> editUser(int UserId, Map<String, dynamic> UserData) async {
    try {
      final response = await http.patch(
        Uri.parse('http://localhost:3000/User/${UserId}'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(UserData),
      );
      if (response.statusCode == 200) {
        // Successfully edited, update the transaction list
        await SelectUserData();
        print('User edited successfully');
        print("TransData ${UserData}");
        return true;
      } else {
        print('Failed to edit User');
        print(response.body);
        print("${response.statusCode}");
        return false;
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to edit User');
    }
  }

  void updateSearchText(String text) {
    searchController.text = text;
  }

  Future<bool> addUser(Map<String, dynamic> userData) async {
    try {
      final response = await http.post(
        Uri.parse('http://localhost:3000/AddUser'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(userData),
      );
      if (response.statusCode == 200) {
        // Successfully added user, update the user list
        await SelectUserData();
        print('User added successfully');
        return true;
      } else {
        print(response.body);
        print("${response.statusCode}");
        return false;
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to add user');
    }
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
        filteredUsers.assignAll(Users);
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
        filteredUsers.assignAll(Users);

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

  int filterByYear(String selectedDate) {
    if (selectedDate == "ALL") {
      // No filtering required, show all users
      filteredUsers.assignAll(Users);
      return filteredUsers.length;
    } else {
      // Filter users based on year
      filteredUsers.assignAll(Users.where((user) {
        final userJoiningDate = DateTime.parse(user['JoiningDate']);
        return userJoiningDate.year.toString() == selectedDate;
      }));
      return filteredUsers.length; // Return the count of filtered users
    }
  }

  int filterByUserProfile(String userProfile) {
    if (userProfile == 'ALL') {
      // No filtering required, show all transactions
      filteredUsers.assignAll(Users);
      return filteredUsers.length;
    } else {
      // Filter transactions based on UserProfile
      filteredUsers
          .assignAll(Users.where((User) => User['UserProfile'] == userProfile));
      return filteredUsers.length;
    }
  }

  Future<bool> deleteUser(int userId) async {
    try {
      final response = await http.delete(
        Uri.parse('http://localhost:3000/User/${userId}'),
      );
      if (response.statusCode == 204) {
        // Successfully deleted, update the user list
        await SelectUserData();
        print('User deleted successfully');
        return true;
      } else {
        print('Failed to delete user');
        print(response.body);
        print("${response.statusCode}");
        return false;
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to delete user');
    }
  }
}
