import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:karhabtiapp_dashboard_admin/screens/components/tableDataEmail.dart';

import '../../constants.dart';
import '../buttons/dropdownbutton.dart';
import '../components/Earning.dart';
import '../components/Revenue_Ana.dart';
import '../components/leftside.dart';
import '../components/pres.dart';
import '../components/tableDataUsers.dart';

class Calendar_screen extends StatefulWidget {
  const Calendar_screen({super.key});

  @override
  State<Calendar_screen> createState() => _Calendar_screenState();
}

class _Calendar_screenState extends State<Calendar_screen> {
  // List<String> options = ['ALL', 'B2C', 'B2B'];
//
  @override
  Widget build(BuildContext context) {
    bool active = true;
    bool active2 = false;
    bool active3 = false;

    final media = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 19),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: box,
                    width: 268,
                    height: media.height * .289,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CalendBar("Month", active, () {}),
                          CalendBar("Week", active2, () {}),
                          CalendBar("Day", active3, () {}),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Container(
                      decoration: box,
                      width: 268,
                      height: media.height * .478,
                    ),
                  ),
                ],
              )),
          const SizedBox(
            width: 20,
          ),
          Expanded(
              flex: 5,
              child: Container(
                height: media.height * 0.8,
                decoration: box,
              )),
        ],
      ),
    );
  }
}
