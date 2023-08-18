import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/TransactionService.dart';
import '../../model/listController.dart';

class DRopdownPROFILMethod extends StatefulWidget {
  const DRopdownPROFILMethod(
      {required this.first, required this.list, super.key});
  final String first;
  final List<String> list;
  @override
  State<DRopdownPROFILMethod> createState() => _DRopdownPROFILMethodState();
}

class _DRopdownPROFILMethodState extends State<DRopdownPROFILMethod> {
  @override
  Widget build(BuildContext context) {
    final TransactionController transactionController =
        Get.put(TransactionController());
    final dropdownController = Get.put(DropdownController());
    // String? firstcopy = widget.first;
    return DropdownButton2(
      underline: Container(),
      value: dropdownController.firstcopy.value,
      style: TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontFamily: GoogleFonts.plusJakartaSans.toString(),
          fontWeight: FontWeight.w400),
      onChanged: (value) {
        dropdownController.updateFirstCopy(value!);
        transactionController.filterByUserProfile(value);
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