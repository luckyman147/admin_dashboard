import 'package:flutter/material.dart';
// import 'package:karhabtiapp_dashboard_admin/screens/dahsboard/Complaint/Complaint_screen_week.dart';
import 'package:karhabtiapp_dashboard_admin/screens/dahsboard/email_screen.dart';
import 'package:karhabtiapp_dashboard_admin/screens/dahsboard/subs/users.dart';

import '../../constants/constants.dart';
import '../../responsive.dart';
import '../components/Draweer.dart';
import '../components/header.dart';
// import '../dahsboard/Complaint/Complaint_screen.dart';
import '../dahsboard/complaints_screen.dart';
import '../dahsboard/subs/SUbs_screen.dart';

class Complaint extends StatefulWidget {
  const Complaint({super.key});

  @override
  State<Complaint> createState() => _ComplaintState();
}

class _ComplaintState extends State<Complaint> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (Responsive.isDesktop(context))
          Expanded(
            child: Draweer(page: 6, isActive: 0),
          ),
        Expanded(
            flex: 5,
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Header(
                      text: 'Complaints',
                    ),
                    SizedBox(
                      height: defaultPadding,
                      child: Container(
                        color: primaryColor,
                      ),
                    ),
                    Complaints_screen(),
                  ],
                ),
              ),
            )),
      ],
    )));
  }
}
