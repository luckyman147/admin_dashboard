import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karhabtiapp_dashboard_admin/screens/components/tables/tableCompliance.dart';

import '../../../constants/constants.dart';
import '../../../model/Get/countcontroller/counter.dart';
import '../../../model/services/complaint_service.dart';
import '../../components/widgets/pres.dart';

class Complaints_screen extends StatefulWidget {
  const Complaints_screen({super.key});

  @override
  State<Complaints_screen> createState() => _Complaints_screenState();
}

class _Complaints_screenState extends State<Complaints_screen> {
  final complaincontroller = Get.put(ComplainController());
  final CounterController counter = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
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
                      future: complaincontroller.SelectComplainData(),
                      builder: (context, snapshot) {
                        // print(snapshot);
                        if (snapshot.connectionState == ConnectionState.done) {
                          return Obx(() {
                            if (complaincontroller.Complains.isNotEmpty) {
                              return TableComplaince(
                                tableData: complaincontroller.filteredComplains,
                                space: MediaQuery.sizeOf(context).width * .1,
                                number: counter.count.value >
                                        complaincontroller
                                                .filteredComplains.length *
                                            1
                                    ? complaincontroller
                                            .filteredComplains.length *
                                        1
                                    : counter.count.value * 1,
                              );
                            } else
                              return Center(
                                  child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 50.0),
                                child: Text("No Complaint Found",
                                    style:
                                        TextStyle(color: black, fontSize: 22)),
                              ));
                          });
                        }

                        // print(complaincontroller.searchController);
                        else if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else {
                          return Obx(() {
                            if (complaincontroller.isLoading.value) {
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
                  if (complaincontroller.Complains.isNotEmpty)
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
