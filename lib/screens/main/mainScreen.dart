import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants.dart';
import '../dahsboard/dashboard_screen.dart';

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
        Expanded(
          child: Draawer(),
        ),
        Expanded(flex: 5, child: Dashboard_screen()),
      ],
    )));
  }

  Drawer Draawer() {
    return Drawer(
      backgroundColor: bgColor,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              margin: EdgeInsets.all(23),
              padding: EdgeInsets.symmetric(horizontal: 1, vertical: 4),
              child: Center(
                child: Image.asset(
                  "assets/img/karhaba.png",
                  fit: BoxFit.contain,
                  height: 100,
                  width: 100,
                ),
              ),
            ),
            Texted("Menu"),
            AnimatedContainer(
              padding: EdgeInsets.all(8.0),
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(21),
                  color: secondaryColor),
              duration: Duration.zero,
              child: DrawerListTile(
                  title: "Dashboard",
                  svgsrc: "assets/icons/menu_dashboard.svg",
                  press: () {},
                  isactive: isActive),
            ),
            ListTilewithArrow(
                title: "Application",
                svgsrc: "assets/icons/app.svg",
                press: () {}),
            DrawerListTile(
              title: "Email",
              svgsrc: "assets/icons/email.svg",
              press: () {},
            ),
            DrawerListTile(
                title: "Calendar",
                svgsrc: "assets/icons/calendar.svg",
                press: () {}),
            Texted("Pages"),
            ListTilewithArrow(
              title: "Authentication",
              svgsrc: "assets/icons/user.svg",
              press: () {},
            ),
            ListTilewithArrow(
                title: "Utility",
                svgsrc: "assets/icons/utility.svg",
                press: () {}),
            ListTilewithArrow(
                title: "Tables",
                svgsrc: "assets/icons/table.svg",
                press: () {}),
            SizedBox(
              height: 100,
            ),
            DrawerListTile(
              title: "Settings",
              svgsrc: "assets/icons/menu_setting.svg",
              press: () {},
            ),
            DrawerListTile(
                title: "Logout",
                svgsrc: "assets/icons/logout.svg",
                press: () {})
          ],
        ),
      ),
    );
  }

  ListTile ListTilewithArrow(
      {required String title,
      required String svgsrc,
      required VoidCallback press,
      bool isactive = false}) {
    return ListTile(
        onTap: press,
        horizontalTitleGap: 0.0,
        leading: SvgPicture.asset(
          svgsrc,
          height: 30,
          width: 30,
          colorFilter: isactive
              ? ColorFilter.mode(bgColor, BlendMode.srcIn)
              : ColorFilter.mode(textColor, BlendMode.srcIn),
        ),
        trailing: SvgPicture.asset(
          "assets/icons/arrow.svg",
          height: 20,
          colorFilter: isactive
              ? ColorFilter.mode(bgColor, BlendMode.srcIn)
              : ColorFilter.mode(textColor, BlendMode.srcIn),
        ),
        title: Text(title,
            style: TextStyle(
                color: isactive ? bgColor : textColor,
                fontWeight: FontWeight.w600,
                fontFamily: GoogleFonts.poppins.toString(),
                fontSize: 14)));
  }

  Padding Texted(String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Text(
        textAlign: TextAlign.start,
        name,
        style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
            fontFamily: GoogleFonts.poppinsTextTheme.toString()),
      ),
    );
  }

  ListTile DrawerListTile(
      {required String title,
      required String svgsrc,
      required VoidCallback press,
      bool isactive = false}) {
    return ListTile(
        onTap: press,
        horizontalTitleGap: 0.0,
        leading: SvgPicture.asset(
          svgsrc,
          height: 30,
          width: 30,
          // colorFilter: ColorFilter.mode(textColor, BlendMode.srcIn),
          colorFilter: isactive
              ? ColorFilter.mode(bgColor, BlendMode.srcIn)
              : ColorFilter.mode(textColor, BlendMode.srcIn),
        ),
        title: Text(title,
            style: TextStyle(
                color: isactive ? bgColor : textColor,
                fontWeight: FontWeight.w600,
                fontSize: 14,
                fontFamily: GoogleFonts.poppins.toString())));
  }
}
