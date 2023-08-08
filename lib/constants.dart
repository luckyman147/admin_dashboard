import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const bgColor = Colors.white;
const black = Colors.black;
const textColor = Color.fromRGBO(160, 160, 160, 1);
const secondaryColor = Color.fromRGBO(35, 64, 120, 1);
const primaryColor = Color.fromRGBO(236, 236, 249, 1);
const defaultPadding = 16.0;
const yellow = Color.fromRGBO(250, 186, 0, 1);
const thirdcolor = Color.fromRGBO(228, 225, 225, 1);
const pourcentage = Color.fromRGBO(0, 255, 148, 1);
const textgrey = Color.fromRGBO(117, 117, 117, 1);
final box = BoxDecoration(
  color: bgColor,
  borderRadius: BorderRadius.circular(20),
  boxShadow: [
    BoxShadow(
        color: Colors.grey.withOpacity(0.7),
        spreadRadius: 2,
        blurRadius: 7,
        offset: Offset(0, 6))
  ],
);
final styletext = GoogleFonts.plusJakartaSansTextTheme.toString();
