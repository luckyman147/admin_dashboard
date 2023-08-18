import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:karhabtiapp_dashboard_admin/model/CalendarViewController.dart';
import 'package:karhabtiapp_dashboard_admin/model/NumberController.dart';
import 'package:karhabtiapp_dashboard_admin/model/boolStates.dart';
import 'package:karhabtiapp_dashboard_admin/model/table_controller.dart';
import 'package:karhabtiapp_dashboard_admin/screens/main/Application.dart';
import 'package:karhabtiapp_dashboard_admin/screens/main/Email.dart';
// import 'package:karhabtiapp_dashboard_admin/screens/main/Application.dart';
// import 'package:karhabtiapp_dashboard_admin/screens/main/Email.dart';
import 'package:karhabtiapp_dashboard_admin/screens/main/calendar.dart';
import 'package:karhabtiapp_dashboard_admin/screens/main/mainScreen.dart';
// import 'package:karhabtiapp_dashboard_admin/screens/main/mainScreen.dart';
import 'package:provider/provider.dart';
import 'constants/constants.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return
        // MultiProvider(
        //   providers: [
        //     ChangeNotifierProvider.value(value: BooleanStatesProvider()),
        //     ChangeNotifierProvider.value(value: CalendarViewProvider()),
        //     ChangeNotifierProvider.value(value: TableStatesProvider()),
        //     ChangeNotifierProvider.value(value: NumberProvider()),
        //   ],
        //   child: Consumer(
        //       builder: (BuildContext context, value, Widget? child) =>
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
              Get.put(TableStatesController());
            }),
            home: MainScreen());

    // ),
    // );
  }
}
