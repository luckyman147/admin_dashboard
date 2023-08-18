import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

const bgColor = Colors.white;
const black = Colors.black;
const textColor = Color.fromRGBO(160, 160, 160, 1);
const BABABA = Color.fromRGBO(186, 186, 186, 1);
const checkColor = Color.fromRGBO(132, 116, 116, 1);
const secondaryColor = Color.fromRGBO(35, 64, 120, 1);
const primaryColor = Color.fromRGBO(236, 236, 249, 1);
const defaultPadding = 16.0;
const red = Color.fromRGBO(255, 30, 30, 1);
const rox = Color.fromRGBO(223, 223, 223, 1);
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

Padding elevatedNE(String text, VoidCallback action) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4.0),
    child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: Size(88, 36),
            shadowColor: bgColor,
            elevation: 1,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            backgroundColor: bgColor),
        onPressed: action,
        child: Text(
          text,
          style: TextStyle(
              fontFamily: GoogleFonts.plusJakartaSansTextTheme.toString(),
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: BABABA),
        )),
  );
}

ElevatedButton addThing(String text, String svg, VoidCallback press) {
  return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(15),
          backgroundColor: Color.fromRGBO(27, 157, 134, 1),
          // elevation: 1,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      onPressed: press,
      icon: SvgPicture.asset(svg),
      label: Text(
        text,
        style: TextStyle(
            fontFamily: styletextP0P,
            fontSize: 21,
            fontWeight: FontWeight.w600),
      ));
}

Container buttonBar(String text, bool active, VoidCallback press) {
  return Container(
    decoration: BoxDecoration(
      border: Border(
        left: active
            ? BorderSide(color: Colors.black, width: 10)
            : BorderSide(color: Colors.white), // Add left border
      ),
    ),
    child: TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      onPressed: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14.0),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontFamily: GoogleFonts.poppinsTextTheme.toString(),
                fontSize: 17,
                color: active ? Colors.black : textColor,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    ),
  );
}

Container CalendBar(String text, bool active, VoidCallback press) {
  return Container(
    decoration: BoxDecoration(
      border: Border(
        left: active
            ? BorderSide(color: secondaryColor, width: 9)
            : BorderSide(color: Colors.white), // Add left border
      ),
    ),
    child: TextButton(
      style: TextButton.styleFrom(
        maximumSize: Size(170, 100),
        elevation: 0,
        backgroundColor: (Colors.white),
      ),
      onPressed: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 14),
        child: Text(
          text,
          style: TextStyle(
              fontFamily: GoogleFonts.plusJakartaSansTextTheme.toString(),
              fontSize: 27,
              color: active ? Colors.black : textColor,
              fontWeight: FontWeight.w600),
        ),
      ),
    ),
  );
}

Padding elevatedNUmber(String text, VoidCallback action, bool isActtive) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4.0),
    child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: Size(40, 36),
            shadowColor: bgColor,
            elevation: 1,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            backgroundColor: isActtive ? secondaryColor : bgColor),
        onPressed: action,
        child: Text(
          text,
          style: TextStyle(
              fontFamily: GoogleFonts.plusJakartaSansTextTheme.toString(),
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: BABABA),
        )),
  );
}

final styletext = GoogleFonts.plusJakartaSansTextTheme.toString();
final styletextP0P = GoogleFonts.poppinsTextTheme.toString();
final column = TextStyle(
    fontFamily: GoogleFonts.poppins.toString(),
    fontSize: 19,
    fontWeight: FontWeight.w600,
    color: black);
TextStyle colu(double size, FontWeight weight, Color color) {
  return TextStyle(
      fontFamily: GoogleFonts.poppins.toString(),
      fontSize: size,
      fontWeight: weight,
      color: color);
}

final row = TextStyle(
    fontFamily: GoogleFonts.poppins.toString(),
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: textColor);
final columnRO = TextStyle(
    fontFamily: GoogleFonts.poppins.toString(),
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: black);