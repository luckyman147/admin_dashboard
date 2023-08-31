import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:karhabtiapp_dashboard_admin/screens/components/dialogue/dialogueAddEmailWidget.dart';
import 'package:karhabtiapp_dashboard_admin/screens/components/tables/tableDataEmail.dart';

import '../../../constants/constants.dart';
import '../../../model/Get/countcontroller/boolStates.dart';
import '../../../model/services/ReceiveEmailService.dart';
import '../../../model/Get/countcontroller/counter.dart';
import '../../../model/Get/listController.dart';
// import '../buttons/dropdownbutton.dart';
// import '../buttons/dropdownbuttonProfile.dart';
import '../../../model/services/SenderEmailService.dart';
import '../../components/tables/tableDataSendEmail.dart';
import '../../components/widgets/pres.dart';
// import '../components/tables/tableDataUsers.dart';

class Email_screen extends StatefulWidget {
  const Email_screen({super.key});

  @override
  State<Email_screen> createState() => _Email_screenState();
}

class _Email_screenState extends State<Email_screen> {
  final EmailController emailcontroller = Get.put(EmailController());
  final SendEmailController Sendemailcontroller =
      Get.put(SendEmailController());
  final DropdownController dropdownController = Get.put(DropdownController());
  final CounterController counter = Get.put(CounterController());
  final BooleanStatesController bools = Get.put(BooleanStatesController());

  @override
  Widget build(BuildContext context) {
    // final media = MediaQuery.sizeOf(context);
    // var Email = EMail();
    return Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
          height: 750,
          decoration: box,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: primaryColor))),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Obx(() => buttonBar("Inbox", bools.isFirstActive, () {
                            bools.activateFirst();
                          })),
                      Obx(() => buttonBar("Sent", bools.isSecondActive, () {
                            bools.activateSecond();
                          })),
                      Obx(() => buttonBar("Favorites", bools.isThirdActive, () {
                            bools.activateThird();
                          })),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Show",
                            style: row,
                          ),
                          const press(),
                          Text(
                            "Rows",
                            style: row,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 40.0),
                            child: addThing(
                                "New Message", "assets/icons/Edit.svg", () {
                              showDialog(
                                  context: context,
                                  builder: (_) => EmailAlertDialog());
                            }),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Obx(() =>
                    Visibility(visible: bools.isFirstActive, child: EMail())),
                Obx(() => Visibility(
                    visible: bools.isSecondActive, child: SendEMail())),
                Obx(() {
                  if (emailcontroller.Emails.isNotEmpty ||
                      Sendemailcontroller.SendEmails.isNotEmpty)
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 70),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          elevatedNE("Previous", () {}),
                          elevatedNUmber("1", () {}, true),
                          elevatedNUmber("2", () {}, false),
                          elevatedNUmber("3", () {}, false),
                          elevatedNE("Next", () {}),
                        ],
                      ),
                    );
                  else
                    return Container();
                }),
              ],
            ),
          ),
        ));
  }

  Expanded EMail() {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () {
          return Future.delayed(Duration(seconds: 1), () {
            setState(() {});
          });
        },
        child: FutureBuilder<void>(
          future: emailcontroller.SelectEmailData(),
          builder: (context, snapshot) {
            // print(snapshot);
            if (snapshot.connectionState == ConnectionState.done) {
              return Obx(() {
                if (emailcontroller.Emails.isNotEmpty) {
                  return TableEmail(
                    tableData: emailcontroller.filteredEmails,
                    space: MediaQuery.sizeOf(context).width * .087,
                    number: counter.count.value >
                            emailcontroller.filteredEmails.length
                        ? emailcontroller.filteredEmails.length * 1
                        : counter.count.value * 1,
                  );
                } else {
                  return Center(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50.0),
                    child: Text("No Emails Found",
                        style: TextStyle(color: black, fontSize: 22)),
                  ));
                }
              });
            }

            // print(EmailController.searchController);
            else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return Obx(() {
                if (emailcontroller.isLoading.value) {
                  return CircularProgressIndicator();
                } else {
                  return Center(
                    child: Text(
                      "No Data found ",
                      style: TextStyle(color: black, fontSize: 22),
                    ),
                  );
                }
              });
            }
          },
        ),
      ),
    );
  }

  Expanded SendEMail() {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () {
          return Future.delayed(Duration(seconds: 1), () {
            setState(() {});
          });
        },
        child: FutureBuilder<void>(
          future: Sendemailcontroller.SelectSendEmailData(),
          builder: (context, snapshot) {
            // print(snapshot);
            if (snapshot.connectionState == ConnectionState.done) {
              return Obx(() {
                if (Sendemailcontroller.SendEmails.isNotEmpty) {
                  return TableSendEmail(
                    tableData: Sendemailcontroller.filteredSendEmails,
                    space: MediaQuery.sizeOf(context).width * .08,
                    number: counter.count.value >
                            Sendemailcontroller.SendEmails.length
                        ? Sendemailcontroller.SendEmails.length * 1
                        : counter.count.value * 1,
                  );
                } else {
                  return Center(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50.0),
                    child: Text("No Emails Found",
                        style: TextStyle(color: black, fontSize: 22)),
                  ));
                }
              });
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return Obx(() {
                if (Sendemailcontroller.isLoading.value) {
                  return CircularProgressIndicator();
                } else {
                  return Center(
                    child: Text(
                      "No Data found ",
                      style: TextStyle(color: black, fontSize: 22),
                    ),
                  );
                }
              });
            }
          },
        ),
      ),
    );
  }
}
