import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:karhabtiapp_dashboard_admin/screens/components/widgets/schedule.dart';
import 'package:karhabtiapp_dashboard_admin/screens/components/tables/tableDataEmail.dart';
import 'package:karhabtiapp_dashboard_admin/model/boolStates.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../constants/constants.dart';
import '../../../model/CalendarViewController.dart';

class Calendar_screen_month extends StatefulWidget {
  const Calendar_screen_month({
    super.key,
  });
  // final DateTime currentDate;

  @override
  State<Calendar_screen_month> createState() => _Calendar_screen_monthState();
}

class _Calendar_screen_monthState extends State<Calendar_screen_month> {
  // List<String> options = ['ALL', 'B2C', 'B2B'];

  @override
  Widget build(BuildContext context) {
    // final calendarViewProvider = Provider.of<CalendarViewProvider>(context);
    // final boolProvider = Provider.of<BooleanStatesProvider>(context);

    CalendarView currentview = CalendarView.week;
    // bool isToday = widget.currentDate.day == DateTime.now().day &&
    //     widget.currentDate.month == DateTime.now().month &&
    //     widget.currentDate.year == DateTime.now().year;
    final media = MediaQuery.sizeOf(context);
    initState() {
      super.initState();
      // calendarViewProvider.ChangeView(CalendarViewType.week);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: box,
                    width: 300,
                    height: 300,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CalendBar("Month", true, () {
                            // boolProvider.activateFirst();
                            // calendarViewProvider.ChangeView(
                            //     CalendarViewType.month);
                            // setState(() {});
                          }),
                          CalendBar("Week", false, () {
                            // boolProvider.activateSecond();
                            // calendarViewProvider.ChangeView(
                            //     CalendarViewType.week);
                            // setState(() {});
                          }),
                          CalendBar("Day", false, () {
                            // boolProvider.activateThird();
                            // calendarViewProvider.ChangeView(
                            //     CalendarViewType.day);
                            // setState(() {});
                          }),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Container(
                      decoration: box,
                      width: 300,
                      height: media.height * .478,
                      child: Schedule(),
                    ),
                  ),
                ],
              )),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: media.height * 0.8,
                  decoration: box,
                  child: Padding(
                    padding: const EdgeInsets.all(22.0),
                    child: SfCalendar(
                      headerHeight: 70,

                      todayHighlightColor: yellow,
                      monthViewSettings: MonthViewSettings(
                        appointmentDisplayCount: 3,
                        dayFormat: "EEE",
                        appointmentDisplayMode:
                            MonthAppointmentDisplayMode.appointment,
                      ),
                      appointmentBuilder:
                          (context, calendarAppointmentDetails) {
                        final Appointment meeting =
                            calendarAppointmentDetails.appointments.first;
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3.0),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: meeting.color,
                                borderRadius: BorderRadius.circular(22)),
                          ),
                        );
                      },
                      viewHeaderHeight: 79,
                      // allowAppointmentResize: true,
                      viewHeaderStyle: const ViewHeaderStyle(
                        dayTextStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      headerStyle: const CalendarHeaderStyle(
                        backgroundColor: Colors.white,
                        textAlign: TextAlign.start,
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      appointmentTextStyle: TextStyle(color: black),
                      dataSource: _getCalendarDataSource(yellow),
                      // view: calendarViewProvider.currentView ==
                      //         CalendarViewType.month
                      //     ? CalendarView.month
                      //     : calendarViewProvider.currentView ==
                      //             CalendarViewType.week
                      //         ? CalendarView.week
                      //         : CalendarView.day,
                      view: CalendarView.month,
                      showNavigationArrow: true,
                      cellBorderColor: textColor,
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }

  _AppointmentDataSource _getCalendarDataSource(Color color) {
    List<Appointment> appointments = <Appointment>[];
    appointments.add(Appointment(
      startTime: DateTime(2023, 8, 1),
      endTime: DateTime(2023, 8, 1).add(Duration(days: 10)),
      // subject: 'Meeting',
      color: color,
    ));
    appointments.add(Appointment(
      startTime: DateTime(2023, 8, 5),
      endTime: DateTime(2023, 8, 1).add(Duration(days: 1)),
      // subject: 'Meeting',
      color: red,
    ));

    return _AppointmentDataSource(appointments);
  }
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}
