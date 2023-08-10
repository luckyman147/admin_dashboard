import 'package:flutter/material.dart';
import 'package:karhabtiapp_dashboard_admin/screens/dahsboard/users.dart';

import '../../responsive.dart';
import '../components/Draweer.dart';
import '../dahsboard/subs/SUbs_screen.dart';

class Subs extends StatefulWidget {
  const Subs({super.key});

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
            child: Draweer(page: 2, isActive: false),
          ),
        Expanded(flex: 5, child: User_screen()),
      ],
    )));
  }
}
