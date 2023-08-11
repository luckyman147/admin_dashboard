import 'package:flutter/material.dart';
import 'package:karhabtiapp_dashboard_admin/screens/dahsboard/email_screen.dart';
import 'package:karhabtiapp_dashboard_admin/screens/dahsboard/users.dart';

import '../../constants.dart';
import '../../responsive.dart';
import '../components/Draweer.dart';
import '../components/header.dart';
import '../dahsboard/subs/SUbs_screen.dart';

class Email extends StatefulWidget {
  const Email({super.key});

  @override
  State<Email> createState() => _EmailState();
}

class _EmailState extends State<Email> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (Responsive.isDesktop(context))
          Expanded(
            child: Draweer(page: 3, isActive: false),
          ),
        Expanded(
            flex: 5,
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Header(
                text: 'Email',
              ),
              SizedBox(
                height: defaultPadding,
                child: Container(
                  color: primaryColor,
                ),
              ),
                    Email_screen(),
                  ],
                ),
              ),
            )),
      ],
    )));
  }
}
