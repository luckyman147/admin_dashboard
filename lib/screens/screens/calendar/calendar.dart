import 'package:flutter/material.dart';
// import 'package:karhabtiapp_dashboard_admin/screens/dahsboard/calendar/calendar_screen_week.dart';
import 'package:karhabtiapp_dashboard_admin/screens/screens/email/email_screen.dart';
import 'package:karhabtiapp_dashboard_admin/screens/screens/subs/users.dart';

import '../../../constants/constants.dart';
import '../../../responsive.dart';
import '../../components/Draweer.dart';
import '../../components/header.dart';
import 'calendar_screen.dart';
import '../subs/SUbs_screen.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (Responsive.isDesktop(context))
          Expanded(
            child: Draweer(page: 4, isActive: 0),
          ),
        Expanded(
            flex: 5,
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Header(
                      text: 'Calendar',
                    ),
                    SizedBox(
                      height: defaultPadding,
                      child: Container(
                        color: primaryColor,
                      ),
                    ),
                    Calendar_screen_month(),
                  ],
                ),
              ),
            )),
      ],
    )));
  }
}
