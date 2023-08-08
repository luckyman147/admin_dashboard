import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:karhabtiapp_dashboard_admin/screens/main/mainScreen.dart';
import 'constants.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin dashboard',
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: primaryColor,
          canvasColor: primaryColor,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.white)),
      home: MainScreen(),
    );
  }
}
