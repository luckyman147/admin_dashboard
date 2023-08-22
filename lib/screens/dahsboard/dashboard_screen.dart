// import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:karhabtiapp_dashboard_admin/constants/utils.dart';
import 'package:karhabtiapp_dashboard_admin/screens/components/widgets/Revenue_Ana.dart';
import 'package:karhabtiapp_dashboard_admin/screens/components/tables/tableData.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import '../components/barchar.dart';
// import 'package:google_fonts/google_fonts.dart';

import '../../constants/constants.dart';
import '../../model/TransactionService.dart';
import '../../model/listController.dart';
import '../../model/userService.dart';
import '../buttons/dropdownbutton.dart';
import '../buttons/dropdownbuttonProfile.dart';
import '../components/tables/tablesConfig.dart';
import '../components/widgets/Earning.dart';
import '../components/header.dart';
import '../components/widgets/leftside.dart';

class Dashboard_screen extends StatefulWidget {
  const Dashboard_screen({super.key});

  @override
  State<Dashboard_screen> createState() => _Dashboard_screenState();
}

class _Dashboard_screenState extends State<Dashboard_screen> {
  String Selected = 'ALL';
  String first = 'Aug';
  final DropdownController dropdownController = Get.put(DropdownController());
  List<String> options = ['ALL', 'B2C', 'B2B'];
  List<String> monthNames = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sept',
    'Oct',
    'Nov',
    'Dec'
  ];

  final TransactionController transactionController =
      Get.put(TransactionController());
  @override
  void initState() {
    if (transactionController.transactions.isEmpty) {
      transactionController.SelectTransactionData();
    }
    transactionController.SelectTransactionData();

    // transactionController.resetSearchText();

    super.initState();
  }

  List<String> year = ['Today', "Week", "Month", "Year"];
  @override
  Widget build(BuildContext context) {
    // TextEditingController searchController = TextEditingController();
    final media = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 2, child: LeftSide()),
          const SizedBox(
            width: 20,
          ),
          Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(flex: 3, child: Revenue()),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: Container(
                              height: 500,
                              decoration: box,
                              child: const Earn()))
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: defaultPadding),
                    child: Container(
                        height: 430,
                        decoration: box,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 18.0, horizontal: 10),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Recent Transactions",
                                        style: TextStyle(
                                            fontFamily: styletext,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                            color: black),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 3.0),
                                            child: Container(
                                                width: 120,
                                                height: 45,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: primaryColor)),
                                                child: NewTextField()),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: Container(
                                                height: 45,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: primaryColor)),
                                                child: Obx(() =>
                                                    DRopdownPROFILMethod(
                                                        first:
                                                            dropdownController
                                                                .firstcopy
                                                                .value,
                                                        list: options))),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 3.0),
                                            child: Container(
                                                height: 45,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: primaryColor)),
                                                child: Obx(() =>
                                                    DRopdownYearMethod(
                                                        first:
                                                            dropdownController
                                                                .year.value,
                                                        list: dropdownController
                                                            .years))),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                RefreshIndicator(
                                  onRefresh: () {
                                    return Future.delayed(Duration(seconds: 1),
                                        () {
                                      setState(() {});
                                    });
                                  },
                                  child: TableConfigWidget(
                                      sized: media.width * .021),
                                ),
                                Obx(() {
                                  if (transactionController
                                      .transactions.isNotEmpty)
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
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
                                })
                              ],
                            ),
                          ),
                        )),
                  )
                ],
              ))
        ],
      ),
    );
  }

  Row searchline() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3.0),
          child: Container(
              width: 120,
              height: 45,
              decoration:
                  BoxDecoration(border: Border.all(color: primaryColor)),
              child: NewTextField()),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
              height: 45,
              decoration:
                  BoxDecoration(border: Border.all(color: primaryColor)),
              child: Obx(() => DRopdownPROFILMethod(
                  first: dropdownController.firstcopy.value, list: options))),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3.0),
          child: Container(
              height: 45,
              decoration:
                  BoxDecoration(border: Border.all(color: primaryColor)),
              child: Obx(() => DRopdownYearMethod(
                  first: dropdownController.year.value,
                  list: dropdownController.years))),
        ),
      ],
    );
  }

  Container NewTextField() {
    return Container(
      width: 399,
      child: TextField(
        onSubmitted: (value) {
          transactionController.updateSearchText(value);
        },
        style: TextStyle(
            color: black, fontSize: 12, fontWeight: FontWeight.normal),
        decoration: InputDecoration(
            label: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text("Search ")),
            labelStyle: TextStyle(
                fontSize: 10,
                fontFamily: GoogleFonts.plusJakartaSans.toString(),
                color: black,
                fontWeight: FontWeight.w400),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: textColor),
            ),
            prefixIcon: InkWell(
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (transactionController.searchController.text.isNotEmpty)
                  transactionController.updateSearchText(
                      transactionController.searchController.text);
              },
              child: SvgPicture.asset(
                "assets/icons/Search.svg",
                height: 5,
                fit: BoxFit.fitHeight,
                colorFilter: ColorFilter.mode(textgrey, BlendMode.srcIn),
              ),
            )),
      ),
    );
  }
}
