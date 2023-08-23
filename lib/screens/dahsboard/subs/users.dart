import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:karhabtiapp_dashboard_admin/model/Get/counter.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:karhabtiapp_dashboard_admin/screens/buttons/dropdownbutton.dart';
import 'package:karhabtiapp_dashboard_admin/screens/components/dialogue/dialogueAddWidget.dart';
// import 'package:karhabtiapp_dashboard_admin/screens/components/tableData.dart';

import '../../../constants/constants.dart';
// import '../../buttons/dropdownbutton.dart';
// import '../../components/header.dart';
import '../../../model/Get/listController.dart';
import '../../../model/services/userService.dart';
import '../../buttons/dropdownbuttonProfile.dart';
// import '../../components/header.dart';
import '../../components/widgets/pres.dart';
import '../../components/tables/tableDataUsers.dart';

class User_screen extends StatefulWidget {
  const User_screen({super.key});

  @override
  State<User_screen> createState() => _User_screenState();
}

class _User_screenState extends State<User_screen> {
  final DropdownController dropdownController = Get.put(DropdownController());
  final CounterController counter = Get.put(CounterController());

  @override
  void initState() {
    if (userController.Users.isEmpty) {
      userController.SelectUserData();
    }
    super.initState();
  }

  final UserController userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.sizeOf(context);
    // bool active = true;
    // bool active2 = false;
    List<String> options = ['ALL', 'B2C', 'B2B'];

    // bool active3 = false;
    return Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
          height: 600,
          decoration: box,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17.0),
                  child: Row(
                    children: [
                      addThing("Add User", "assets/icons/plus.svg", () {
                        showDialog(
                            context: context, builder: (context) => MyDialog());
                      })
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Show",
                            style: row,
                          ),
                          press(),
                          Text(
                            "Rows",
                            style: row,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                    border: Border.all(color: primaryColor)),
                                child: Obx(() => DRopdownPROFILMethod(
                                    first: dropdownController.firstcopy.value,
                                    list: options))),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 3.0),
                            child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                    border: Border.all(color: primaryColor)),
                                child: Obx(() => DRopdownYearMethod(
                                    first: dropdownController.year.value,
                                    list: dropdownController.years))),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () {
                      return Future.delayed(Duration(seconds: 1), () {
                        setState(() {});
                      });
                    },
                    child: FutureBuilder<void>(
                      future: userController.SelectUserData(),
                      builder: (context, snapshot) {
                        // print(snapshot);
                        if (snapshot.connectionState == ConnectionState.done) {
                          return Obx(() {
                            if (userController.Users.isNotEmpty)
                              return TabledUser(
                                tableData: userController.filteredUsers,
                                space: MediaQuery.sizeOf(context).width * .057,
                                number: counter.count.value >
                                        userController.filteredUsers.length
                                    ? userController.filteredUsers.length
                                    : counter.count.value,
                              );
                            else
                              return Center(
                                  child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 50.0),
                                child: Text("No Users Found",
                                    style:
                                        TextStyle(color: black, fontSize: 22)),
                              ));
                          });
                        }

                        // print(UserController.searchController);
                        else if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else {
                          return Obx(() {
                            if (userController.isLoading.value) {
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
                ),
                Obx(() {
                  if (userController.Users.isNotEmpty)
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          elevatedNE("Previous", () {}),
                          elevatedNUmber("1", () {}, true),
                          elevatedNUmber("2", () {}, false),
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
}
