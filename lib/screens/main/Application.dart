import 'package:flutter/material.dart';
import 'package:karhabtiapp_dashboard_admin/screens/dahsboard/users.dart';

import '../../constants.dart';
import '../../responsive.dart';
import '../components/Draweer.dart';
import '../components/header.dart';
import '../dahsboard/subs/SUbs_screen.dart';

class Subs extends StatefulWidget {
  const Subs({required this.isActive, super.key});
  final bool isActive;
  @override
  State<Subs> createState() => _SubsState();
}

class _SubsState extends State<Subs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (Responsive.isDesktop(context))
          Expanded(
            child: Draweer(page: 2, isActive: widget.isActive),
          ),
        Expanded(
            flex: 5,
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Header(
                      text: widget.isActive ? "Subscriptions" : "Users",
                    ),
                    SizedBox(
                        height: defaultPadding,
                        child: Container(
                          color: primaryColor,
                        )),
                    widget.isActive ? Subs_screen() : User_screen(),
                  ],
                ),
              ),
            )),
      ],
    )));
  }
}
