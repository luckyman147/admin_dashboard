import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:karhabtiapp_dashboard_admin/model/Get/countcontroller/counter.dart';
import 'package:karhabtiapp_dashboard_admin/model/services/userService.dart';

import '../../model/services/TransactionService.dart';
import '../../model/Get/listController.dart';

class DRopdownYearMethod extends StatefulWidget {
  const DRopdownYearMethod(
      {required this.first, required this.list, super.key});
  final String first;
  final List<String> list;
  @override
  State<DRopdownYearMethod> createState() => _DRopdownYearMethodState();
}

class _DRopdownYearMethodState extends State<DRopdownYearMethod> {
  @override
  Widget build(BuildContext context) {
    final counter = Get.put(CounterController());
    final TransactionController transactionController =
        Get.put(TransactionController());
    final dropdownController = Get.put(DropdownController());
    final userController = Get.put(UserController());
    // String? firstcopy = widget.first;
    return DropdownButton2(
      underline: Container(),
      value: dropdownController.year.value,
      style: TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontFamily: GoogleFonts.plusJakartaSans.toString(),
          fontWeight: FontWeight.w400),
      onChanged: (value) {
        dropdownController.updated(value!);
        final len = transactionController.filterByYear(value);
        counter.set(len);

        final lenu = userController.filterByYear(value);
        counter.set(lenu);
      },
      // borderRadius: BorderRadius.circular(20),
      items: widget.list.map((e) {
        return DropdownMenuItem(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 9),
            child: Text(
              e,
              style: TextStyle(color: Colors.black),
            ),
          ),
          value: e,
        );
      }).toList(),
      // icon: Icon(
      //   Icons.arrow_drop_down,
      //   color: Colors.black,
      // ),
    );
  }
}
