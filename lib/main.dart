import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:karhabtiapp_dashboard_admin/model/Get/calenderController/CalendarViewController.dart';
import 'package:karhabtiapp_dashboard_admin/model/Get/countcontroller/NumberController.dart';
import 'package:karhabtiapp_dashboard_admin/model/services/TransactionService.dart';
import 'package:karhabtiapp_dashboard_admin/model/Get/countcontroller/boolStates.dart';
import 'package:karhabtiapp_dashboard_admin/model/Get/countcontroller/counter.dart';
import 'package:karhabtiapp_dashboard_admin/model/services/complaint_service.dart';

import 'package:karhabtiapp_dashboard_admin/model/services/userService.dart';
import 'package:karhabtiapp_dashboard_admin/screens/screens/subs/Application.dart';
import 'package:karhabtiapp_dashboard_admin/screens/screens/complain/Complaint.dart';
import 'package:karhabtiapp_dashboard_admin/screens/screens/email/Email.dart';
// import 'package:karhabtiapp_dashboard_admin/screens/main/Application.dart';
// import 'package:karhabtiapp_dashboard_admin/screens/main/Email.dart';
import 'package:karhabtiapp_dashboard_admin/screens/screens/calendar/calendar.dart';
import 'package:karhabtiapp_dashboard_admin/screens/screens/main/mainScreen.dart';
// import 'package:karhabtiapp_dashboard_admin/screens/main/mainScreen.dart';

import 'constants/constants.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
    // transactionController.SelectTransactionData();
  }

  @override
  Widget build(BuildContext context) {
    return
        //
        GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Admin dashboard',
            initialRoute: '/',
            routes: {
              '/calendar': (context) => Calendar(),
              '/Subs': (context) => Subs(
                    isActive: 1,
                  ),
              '/users': (context) => Subs(isActive: 2),
              '/email': (context) => Email(),
              '/Complaints': (context) => Complaint(),
            },
            theme: ThemeData.light().copyWith(
                scaffoldBackgroundColor: primaryColor,
                canvasColor: primaryColor,
                primaryColorDark: secondaryColor,
                textTheme:
                    GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
                        .apply(bodyColor: Colors.white)),
            initialBinding: BindingsBuilder(() {
              Get.put(NumberController());
              Get.put(BooleanStatesController());
              Get.put(CalendarViewController());
              // Get.put(TableStatesController());
              Get.put(TransactionController());
              Get.put(UserController());
              Get.put(ComplainController());
              Get.put(CounterController());
            }),
            home: MainScreen());

    // ),
    // );
  }
}
