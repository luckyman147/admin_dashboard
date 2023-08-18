import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/constants.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          schedule("Meeting", yellow),
          schedule("Generating Reports", secondaryColor),
          schedule("Create New Theme ", red),
          schedule("New Event Plan", pourcentage),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(15),
                  backgroundColor: Color.fromRGBO(27, 157, 134, 1),
                  // elevation: 1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              onPressed: () {},
              child: Text(
                "Create New event",
                style: TextStyle(
                    fontFamily: styletextP0P,
                    fontSize: 21,
                    fontWeight: FontWeight.w600),
              ),
            ),
          )
        ],
      ),
    );
  }

  Row schedule(String text, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          height: 42,
          width: 29,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(58),
              color: color,
              shape: BoxShape.rectangle),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Text(text,
              style: TextStyle(
                color: black,
                fontSize: 17,
                fontFamily: GoogleFonts.poppinsTextTheme.toString(),
                fontWeight: FontWeight.w700,
              )),
        )
      ],
    );
  }
}
