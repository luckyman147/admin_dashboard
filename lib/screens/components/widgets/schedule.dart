import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:karhabtiapp_dashboard_admin/model/services/appoitementService.dart';
import 'package:karhabtiapp_dashboard_admin/screens/components/dialogue/dialogueAddAppoitement.dart';
import 'package:karhabtiapp_dashboard_admin/screens/components/dialogue/dialogueAppoitementInfoWidget%20.dart';

import '../../../constants/constants.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  final appoitmentController = Get.put(AppoitmentController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: FutureBuilder<void>(
              future: appoitmentController.SelectAppoitmentData(),
              builder: (context, snapshot) {
                // print('Selected Date: ${.selectedDate.value}');
                if (snapshot.connectionState == ConnectionState.done) {
                  return Obx(() {
                    if (appoitmentController.Appoitments.isNotEmpty) {
                      print(hexToColor(appoitmentController
                          .filteredAppoitments[0]['color']));
                      return ListView.builder(
                          itemCount:
                              appoitmentController.filteredAppoitments.length,
                          itemBuilder: ((context, index) {
                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: schedule(
                                    appoitmentController
                                        .filteredAppoitments[index]['subject'],
                                    hexToColor(appoitmentController
                                        .filteredAppoitments[index]['color']),
                                    DateTime.parse(appoitmentController
                                            .filteredAppoitments[index]
                                        ["startTime"]),
                                    DateTime.parse(appoitmentController
                                            .filteredAppoitments[index]
                                        ["endTime"])),
                              ),
                            );
                          }));
                    } else {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 50.0),
                          child: Text(
                            "No Appoitments Found",
                            style: TextStyle(color: black, fontSize: 22),
                          ),
                        ),
                      );
                    }
                  });
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return Obx(() {
                    if (appoitmentController.isLoading.value) {
                      return CircularProgressIndicator();
                    } else {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 50.0),
                          child: Text(
                            "No DATA Found",
                            style: TextStyle(color: black, fontSize: 22),
                          ),
                        ),
                      );
                    }
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  TextButton schedule(
      String text, Color color, DateTime startDate, DateTime endDate) {
    //  DateTime startDate = DateTime.parse(startTime);
    // DateTime endDate = DateTime.parse(endTime);
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered)) {
              return Colors.white; // Change the background color when hovered
            }
            return Colors.transparent; // Default background color
          },
        ),
        overlayColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered)) {
              return Colors.white
                  .withOpacity(0.2); // Change the overlay color when hovered
            }
            return Colors.transparent; // Default overlay color
          },
        ),
        mouseCursor: MaterialStateMouseCursor.clickable, // Set cursor style
      ),
      onPressed: () {
        showDialog(
            context: context,
            builder: (_) => appoitmentInfoAlertDialog(
                subject: text,
                StartDate: startDate,
                EndDate: endDate,
                color: color));
      },
      child: Row(
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
      ),
    );
  }

  Color hexToColor(String hexColor) {
    hexColor = hexColor.replaceAll("#", ""); // Remove the leading '#'
    if (hexColor.length == 8) {
      // Check if the color string includes an alpha channel
      String alpha = hexColor.substring(0, 2);
      hexColor =
          hexColor.substring(2); // Remove the alpha channel from the string
      int colorValue = int.parse("0x$hexColor$alpha");
      return Color(colorValue);
    } else {
      // If no alpha channel, assume full opacity
      int colorValue = int.parse("0xFF$hexColor");
      return Color(colorValue);
    }
  }
}
