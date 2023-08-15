import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:karhabtiapp_dashboard_admin/provider/CalendarViewProvider.dart';
import 'package:karhabtiapp_dashboard_admin/provider/NumberProvider.dart';
import 'package:karhabtiapp_dashboard_admin/provider/boolStates.dart';
import 'package:karhabtiapp_dashboard_admin/provider/table_Provider.dart';
import 'package:karhabtiapp_dashboard_admin/screens/main/Application.dart';
import 'package:karhabtiapp_dashboard_admin/screens/main/Email.dart';
// import 'package:karhabtiapp_dashboard_admin/screens/main/Application.dart';
// import 'package:karhabtiapp_dashboard_admin/screens/main/Email.dart';
import 'package:karhabtiapp_dashboard_admin/screens/main/calendar.dart';
import 'package:karhabtiapp_dashboard_admin/screens/main/mainScreen.dart';
// import 'package:karhabtiapp_dashboard_admin/screens/main/mainScreen.dart';
import 'package:provider/provider.dart';
import 'constants.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: BooleanStatesProvider()),
        ChangeNotifierProvider.value(value: CalendarViewProvider()),
        ChangeNotifierProvider.value(value: TableStatesProvider()),
        ChangeNotifierProvider.value(value: NumberProvider()),
      ],
      child: Consumer(
          builder: (BuildContext context, value, Widget? child) => MaterialApp(
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
              home: MainScreen())),
    );
  }
}
