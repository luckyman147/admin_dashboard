import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:karhabtiapp_dashboard_admin/model/Get/calenderController/CalendarViewController.dart';
import 'package:karhabtiapp_dashboard_admin/model/services/appoitementService.dart';
import 'package:karhabtiapp_dashboard_admin/screens/components/widgets/schedule.dart';
import 'package:karhabtiapp_dashboard_admin/screens/functions/color.dart';
import 'package:karhabtiapp_dashboard_admin/screens/functions/para.dart';
// import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../constants/constants.dart';
import '../../components/dialogue/dialogueAddAppoitement.dart';

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
  final calendercontroller = Get.put(CalendarViewController());
  @override
  Widget build(BuildContext context) {
    final appoitementController = Get.put(AppoitmentController());
    CalendarView currentview = CalendarView.week;

    final media = MediaQuery.sizeOf(context);
    initState() {
      super.initState();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: Expanded(
          child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 6.0, horizontal: 20),
              child: Container(
                height: media.height * 0.858,
                decoration: box,
                child: Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: Flex(
                    direction: Axis.vertical,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(15),
                                backgroundColor:
                                    Color.fromRGBO(27, 157, 134, 1),
                                // elevation: 1,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (builder) =>
                                      showAddAppointmentDialog());
                            },
                            child: Text(
                              "Create New event",
                              style: TextStyle(
                                  fontFamily: styletextP0P,
                                  fontSize: 21,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        fit: FlexFit.tight,
                        child: Obx(
                          () => SfCalendar(
                            key: UniqueKey(),
                            controller: calendercontroller.calendarController,

                            headerHeight: 80,
                            allowedViews: [
                              CalendarView.month,
                              CalendarView.week,
                              CalendarView.day
                            ],
                            allowViewNavigation: true,
                            viewNavigationMode: ViewNavigationMode.snap,
                            todayHighlightColor: yellow,
                            dragAndDropSettings: DragAndDropSettings(),
                            allowDragAndDrop: true,
                            headerDateFormat: "MMM,yyy",
                            timeSlotViewSettings: Timesettings(),
                            monthViewSettings: MonthviewSetting(),
                            appointmentBuilder:
                                (context, calendarAppointmentDetails) {
                              final Appointment meeting =
                                  calendarAppointmentDetails.appointments.first;
                              return appoitementBuilder(meeting);
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
                            headerStyle: Headerstyle(),
                            appointmentTextStyle: TextStyle(color: black),
                            allowAppointmentResize: true,
                            dataSource: _getCalendarDataSource(
                                appoitementController.filteredAppoitments),
                            //schedule
                            scheduleViewSettings: ScheduleViewSettings(
                              appointmentItemHeight: 70,
                              hideEmptyScheduleWeek: true,
                              monthHeaderSettings: MonthHeader(),
                              weekHeaderSettings: weekHeader(),
                            ),
                            view: calendercontroller.currentView,
                            showNavigationArrow: true,
                            cellBorderColor: textColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ))),
    );
  }

  MonthViewSettings MonthviewSetting() {
    return MonthViewSettings(
      appointmentDisplayCount: 2,
      agendaViewHeight: 100,
      agendaItemHeight: 70,
      dayFormat: "EEE",
      showAgenda: true,
      appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
    );
  }

  TimeSlotViewSettings Timesettings() {
    return TimeSlotViewSettings(
        timeRulerSize: 100,
        allDayPanelColor: primaryColor,
        timeIntervalHeight: 80,
        timelineAppointmentHeight: 10,
        timeIntervalWidth: 50,
        minimumAppointmentDuration: Duration(hours: 2),
        timeTextStyle: TextStyle(fontSize: 10));
  }

  Container appoitementBuilder(Appointment meeting) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
          color: meeting.color, borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0, bottom: 5, left: 6),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                capitalizeFirstLetter(meeting.subject),
              ),
              SizedBox(
                width: 6,
              ),
              Wrap(
                spacing: 10,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(DateFormat.jm().format(meeting.startTime)),
                  Text(DateFormat.jm().format(meeting.endTime)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  CalendarHeaderStyle Headerstyle() {
    return CalendarHeaderStyle(
      backgroundColor: Colors.white,
      textAlign: TextAlign.center,
      textStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  MonthHeaderSettings MonthHeader() {
    return MonthHeaderSettings(
        monthFormat: 'MMMM, yyyy',
        height: 100,
        textAlign: TextAlign.left,
        backgroundColor: secondaryColor,
        monthTextStyle: TextStyle(
            color: Colors.white, fontSize: 25, fontWeight: FontWeight.w400));
  }

  WeekHeaderSettings weekHeader() {
    return WeekHeaderSettings(
        height: 50,
        startDateFormat: 'dd MMM ',
        endDateFormat: 'dd MMM, yy',
        textAlign: TextAlign.center,
        weekTextStyle: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.w300,
          color: Colors.black,
        ));
  }

  _AppointmentDataSource _getCalendarDataSource(
      List<Map<String, dynamic>> apiAppointments) {
    List<Appointment> appointments = <Appointment>[];

    for (var apiAppointment in apiAppointments) {
      appointments.add(Appointment(
          startTime: DateTime.parse(apiAppointment['startTime']),
          endTime: DateTime.parse(apiAppointment['endTime']),
          subject: apiAppointment['subject'],
          color: hexToColor(
            apiAppointment['color'],
          ),
          isAllDay: apiAppointment['isAllDay']));
    }

    return _AppointmentDataSource(appointments);
  }
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
  String formatDateTime(String dateTimeString) {
    final dateTime = DateTime.parse(dateTimeString);
    final formattedTime = DateFormat('HH.mm').format(dateTime);
    return formattedTime;
  }
}
