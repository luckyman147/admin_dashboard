import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants.dart';

class Header extends StatelessWidget {
  final String text;
  Header({required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(0),
      color: bgColor,
      width: double.infinity,
      height: 100,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 31,
                  fontWeight: FontWeight.w500,
                  fontFamily: GoogleFonts.poppinsTextTheme.toString()),
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          Expanded(child: Container(width: 20, child: SearchField())),
          SizedBox(
            width: 10,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: bgColor),
            padding: EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: defaultPadding / 2),
            margin: EdgeInsets.only(left: defaultPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icons/18165.jpg",
                        fit: BoxFit.fitHeight,
                        height: 24,
                        width: 39,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset("assets/icons/arrow.svg"))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SvgPicture.asset(
                    "assets/icons/menu_notification.svg",
                    width: 25,
                    height: 23,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: thirdcolor,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  TextField SearchField() {
    return TextField(
      decoration: InputDecoration(
          fillColor: Color.fromRGBO(219, 219, 219, .4),
          filled: true,
          label: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text("Search anything...")),
          labelStyle: TextStyle(
              fontSize: 13,
              fontFamily: GoogleFonts.plusJakartaSans.toString(),
              color: Color.fromARGB(255, 104, 104, 104),
              fontWeight: FontWeight.w400),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          suffixIcon: InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(defaultPadding * .75),
              margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
              decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(15)),
              child: SvgPicture.asset(
                "assets/icons/Search.svg",
                fit: BoxFit.fitHeight,
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ),
          )),
    );
  }
}
