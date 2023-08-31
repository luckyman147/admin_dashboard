import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:karhabtiapp_dashboard_admin/responsive.dart';

import '../../../constants/constants.dart';
import '../../components/Draweer.dart';
import '../../components/header.dart';
import 'dashboard_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  final isActive = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (Responsive.isDesktop(context))
          Expanded(
            child: Draweer(page: 1, isActive: 0),
          ),
        Expanded(
            flex: 5,
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Header(
                      text: 'Dashboard',
                    ),
                    SizedBox(
                        height: defaultPadding,
                        child: Container(
                          color: primaryColor,
                        )),
                    Dashboard_screen(),
                  ],
                ),
              ),
            )),
      ],
    )));
  }
}
