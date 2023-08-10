import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DRopdownMethod extends StatefulWidget {
  const DRopdownMethod({required this.first, required this.list, super.key});
  final String first;
  final List<String> list;
  @override
  State<DRopdownMethod> createState() => _DRopdownMethodState();
}

class _DRopdownMethodState extends State<DRopdownMethod> {
  @override
  Widget build(BuildContext context) {
    String firstcopy = widget.first;
    return DropdownButton(
      underline: Container(),
      style: TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontFamily: GoogleFonts.plusJakartaSans.toString(),
          fontWeight: FontWeight.w400),
      value: firstcopy,
      onChanged: (value) {
        setState(() {
          firstcopy = value.toString();
        });
      },
      borderRadius: BorderRadius.circular(20),
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
      icon: Icon(
        Icons.arrow_drop_down,
        color: Colors.black,
      ),
    );
  }
}
