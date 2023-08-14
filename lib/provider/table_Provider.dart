import 'package:flutter/material.dart';

class TableStatesProvider with ChangeNotifier {
  List<Map<String, dynamic>> _tableData = [
    {
      'index': false,
      'OrderID': "#KA5631",
      "Date": "04 September 2023",
      "User Name": "Nelson Mandela",
      "User Profile": "B2B",
      "Total": "2000",
      "Payment Status": "Paid",
    },
    {
      'index': true,
      'OrderID': "#KA5771",
      "Date": "04 october 2023",
      "User Name": "Bob Marley",
      "User Profile": "B2C",
      "Total": "200",
      "Payment Status": "Unpaid",
    },
    {
      'index': true,
      'OrderID': "#KA5971",
      "Date": "04 Juillet 2023",
      "User Name": "Micheal Jackson",
      "User Profile": "B2B",
      "Total": "100",
      "Payment Status": "Change Back",
    },
    {
      'index': false,
      'OrderID': "#KA5631",
      "Date": "04 September 2023",
      "User Name": "Nelson Mandela",
      "User Profile": "B2B",
      "Total": "2000",
      "Payment Status": "Paid",
    },
    // {
    //   'index': false,
    //   'OrderID': "#KA5631",
    //   "Date": "04 September 2023",
    //   "User Name": "Nelson Mandela",
    //   "User Profile": "B2B",
    //   "Total": "2000",
    //   "Payment Status": "Paid",
    // }
  ];
  List<Map<String, dynamic>> _filteredData = [];

  TableStatesProvider() {
    _filteredData =
        List.from(_tableData); // Initialize filteredData with _tableData
  }
  void resetFilters() {
    _filteredData =
        List.from(_tableData); // Reset filteredData to original _tableData
    notifyListeners();
  }

  List<Map<String, dynamic>> get tableData =>
      _filteredData; // Return filteredData

  void filterByUserProfile(String filter) {
    _filteredData =
        _tableData.where((map) => map['User Profile'] == filter).toList();
    notifyListeners();
  }

  void filterByPayment(String filter) {
    _filteredData =
        _tableData.where((map) => map['Payment Status'] == filter).toList();
    notifyListeners();
  }
}
