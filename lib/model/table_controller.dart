import 'package:get/get.dart';

class TableStatesController extends GetxController {
  var _isCheckActive = false.obs;

  List<Map<String, dynamic>> _tableData = [
    {
      'OrderID': "#KA5631",
      "Date": "04 September 2023",
      "User Name": "Nelson Mandela",
      "User Profile": "B2B",
      "Total": "2000",
      "Payment Status": "Paid",
    },
    {
      'OrderID': "#KA5771",
      "Date": "04 october 2023",
      "User Name": "Bob Marley",
      "User Profile": "B2C",
      "Total": "200",
      "Payment Status": "Unpaid",
    },
    {
      'OrderID': "#KA5971",
      "Date": "04 Juillet 2023",
      "User Name": "Micheal Jackson",
      "User Profile": "B2B",
      "Total": "100",
      "Payment Status": "Change Back",
    },
    {
      "Date": "04 September 2023",
      "User Name": "Nelson Mandela",
      "User Profile": "B2B",
      "Total": "2000",
      "Payment Status": "Paid",
    },
  ];
  get isCheckActive => this._isCheckActive.value;

  List<Map<String, dynamic>> _filteredData = [];

  TableStatesController() {
    _filteredData =
        List.from(_tableData); // Initialize filteredData with _tableData
  }

  void updateValue(int index, String key, dynamic newValue) {
    if (index >= 0 && index < tableData.length) {
      if (_tableData[index].containsKey(key)) {
        _tableData[index][key] = newValue;
        update(); // Update the controller
      }
    }
  }

  void resetFilters() {
    _filteredData =
        List.from(_tableData); // Reset filteredData to original _tableData
    update(); // Update the controller
  }

  List<Map<String, dynamic>> get tableData =>
      _filteredData; // Return filteredData

  void filterByUserProfile(String filter) {
    _filteredData =
        _tableData.where((map) => map['User Profile'] == filter).toList();
    update(); // Update the controller
  }

  void filterByPayment(String filter) {
    _filteredData =
        _tableData.where((map) => map['Payment Status'] == filter).toList();
    update(); // Update the controller
  }

  void updateAllIndexes(bool newIndex) {
    for (var item in _tableData) {
      item['index'] = newIndex;
    }
    update(); // Update the controller
  }
}
