import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:karhabtiapp_dashboard_admin/provider/NumberProvider.dart';
import 'package:karhabtiapp_dashboard_admin/screens/main/Application.dart';
import 'package:karhabtiapp_dashboard_admin/screens/main/mainScreen.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../provider/boolStates.dart';
import '../main/Email.dart';
import '../main/calendar.dart';

enum SlideTransitionType {
  slideInRight,
  // Add more transition types here if needed
}

class Draweer extends StatefulWidget {
  const Draweer({required this.page, required this.isActive, super.key});
  final int isActive;
  final int page;
  @override
  State<Draweer> createState() => _DraweerState();
}

class _DraweerState extends State<Draweer> {
  @override
  Widget build(BuildContext context) {
    bool IsApp = false;
    final boolProvider = Provider.of<BooleanStatesProvider>(context);
    final numberprovider = Provider.of<NumberProvider>(context);

    final deviceSize = MediaQuery.of(context).size;

    return AnimatedContainer(
      height: deviceSize.height,
      duration: Duration(milliseconds: 300),
      child: Drawer(
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
              DrawerListTile(
                  title: "Dashboard",
                  numpage: 1,
                  svgsrc: "assets/icons/menu_dashboard.svg",
                  press: () {
                    Navigator.pushNamed(context, '/');
                  },
                  isactive: widget.page == 1),
              ListTilewithArrow(
                  title: "Application",
                  numpage: 2,
                  svgsrc: "assets/icons/app.svg",
                  press: () {
                    if (boolProvider.isActive == false) {
                      boolProvider.activate();
                    } else {
                      boolProvider.deactivate();
                    }
                    print(boolProvider.isActive);
                    print(numberprovider.number);
                  },
                  isactive: widget.page == 2),
              (boolProvider.isActive)
                  ? Card(
                      elevation: 0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          local(
                              text: "Subscriptions",
                              active: numberprovider.number == 2
                                  ? 0
                                  : numberprovider.number,
                              functio: () {
                                numberprovider.setTo1();
                                Navigator.pushNamed(context, "/Subs");
                              }),
                          local(
                              text: "Users",
                              active: numberprovider.number == 1
                                  ? 0
                                  : numberprovider.number,
                              functio: () {
                                numberprovider.setTo2();
                                Navigator.pushNamed(context, "/users");
                              })
                        ],
                      ),
                    )
                  : SizedBox(),
              DrawerListTile(
                  title: "Email",
                  numpage: 3,
                  svgsrc: "assets/icons/email.svg",
                  press: () {
                    if (boolProvider.isActive) {
                      numberprovider.resetTo0();
                      boolProvider.deactivate();
                    }
                    Navigator.pushNamed(context, "/email");
                  },
                  isactive: widget.page == 3),
              DrawerListTile(
                  title: "Calendar",
                  numpage: 4,
                  svgsrc: "assets/icons/calendar.svg",
                  press: () {
                    if (boolProvider.isActive) {
                      numberprovider.resetTo0();
                      boolProvider.deactivate();
                    }

                    Navigator.pushNamed(
                      context,
                      "/calendar",
                    );
                  },
                  isactive: widget.page == 4),
              Texted("Pages"),
              ListTilewithArrow(
                  title: "Authentication",
                  numpage: 5,
                  svgsrc: "assets/icons/user.svg",
                  press: () {},
                  isactive: widget.page == 5),
              ListTilewithArrow(
                  title: "Utility",
                  numpage: 6,
                  svgsrc: "assets/icons/utility.svg",
                  press: () {},
                  isactive: widget.page == 6),
              ListTilewithArrow(
                  title: "Tables",
                  numpage: 7,
                  svgsrc: "assets/icons/table.svg",
                  press: () {},
                  isactive: widget.page == 7),
              SizedBox(
                height: 100,
              ),
              DrawerListTile(
                  title: "Settings",
                  numpage: 8,
                  svgsrc: "assets/icons/menu_setting.svg",
                  press: () {},
                  isactive: widget.page == 8),
              DrawerListTile(
                  title: "Logout",
                  numpage: 9,
                  svgsrc: "assets/icons/logout.svg",
                  press: () {},
                  isactive: widget.page == 9),
            ],
          ),
        ),
      ),
    );
  }

  Padding local(
      {required String text,
      required int active,
      required VoidCallback functio}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 5,
            height: 5,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (active == 1 || active == 2) ? black : textColor),
          ),
          TextButton(
              onPressed: functio,
              child: Text(
                text,
                style: TextStyle(
                    color: (active == 1 || active == 2) ? black : textColor,
                    fontFamily: GoogleFonts.poppinsTextTheme.toString(),
                    fontSize: 16,
                    fontWeight: (active == 1 || active == 2)
                        ? FontWeight.bold
                        : FontWeight.normal),
              )),
        ],
      ),
    );
  }

  PageRouteBuilder _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset(1.0, 2.0);
        const curve = Curves.easeInOut;
        final tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        final offsetAnimation = animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }

  AnimatedContainer ListTilewithArrow(
      {required String title,
      required int numpage,
      required String svgsrc,
      required VoidCallback press,
      bool isactive = false}) {
    return AnimatedContainer(
      // width: title.length * 30,
      padding: EdgeInsets.all(12.0),
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(21),
          color: widget.page == numpage ? secondaryColor : bgColor),
      duration: Duration.zero,
      child: ListTile(
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
                  fontSize: 14))),
    );
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

  AnimatedContainer DrawerListTile(
      {required String title,
      required int numpage,
      required String svgsrc,
      required VoidCallback press,
      bool isactive = false}) {
    return AnimatedContainer(
      width: title.length * 30,
      padding: EdgeInsets.all(12.0),
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(21),
          color: widget.page == numpage ? secondaryColor : bgColor),
      duration: Duration.zero,
      child: ListTile(
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
                  fontFamily: GoogleFonts.poppins.toString()))),
    );
  }
}
