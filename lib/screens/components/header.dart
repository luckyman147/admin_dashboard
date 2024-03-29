import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:karhabtiapp_dashboard_admin/screens/buttons/badgedropdownButton.dart';

import '../../constants/constants.dart';

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
                  child: DropdownButton<String>(
                    value: "English",
                    items: [],
                    onChanged: (Object? value) {},
                    icon: Image.asset(
                      "assets/icons/18165.jpg",
                      fit: BoxFit.fitHeight,
                      height: 24,
                      width: 39,
                    ),
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    barrierColor: primaryColor.withOpacity(.2),
                    // dropdownColor: Colors.white,
                    // alignment: Alignment.bottomRight,
                    items: [
                      DropdownMenuItem(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Notification",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: black),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              "View All",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: secondaryColor),
                            ),
                          )
                        ],
                      )),
                      DropdownMenuItem(
                        child: Row(
                          children: [
                            CircleAvatar(),
                            SizedBox(
                              width: 10,
                            ),
                            SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "James lamrin",
                                    style: TextStyle(
                                        color: black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "brfueberibfiebffr",
                                    style: TextStyle(
                                        color: primaryColor,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        value: "English",
                      ),
                      DropdownMenuItem(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.arrow_circle_right_outlined,
                                color: secondaryColor),
                            InkWell(
                                onTap: () {
                                  Get.toNamed("/Complaints");
                                },
                                child: Text(
                                  "See More",
                                  style: TextStyle(
                                      color: secondaryColor,
                                      fontSize: 14,
                                      decoration: TextDecoration.underline),
                                ))
                          ],
                        ),
                        value: "value",
                      )
                    ],
                    onChanged: (Object? value) {},
                    dropdownStyleData: DropdownStyleData(
                      width: 260,
                      maxHeight: 400,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white,
                      ),
                    ),
                    menuItemStyleData: MenuItemStyleData(
                        // overlayColor:MaterialStateProperty,
                        padding: EdgeInsets.all(8)),
                    customButton: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                        ),
                        child: ProfileButtonWithBadge(
                          itemCount: 5,
                          show: true,
                        )),
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
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: primaryColor)),
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
