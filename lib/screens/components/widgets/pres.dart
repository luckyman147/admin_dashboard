import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:karhabtiapp_dashboard_admin/model/Get/countcontroller/counter.dart';

import '../../../constants/constants.dart';

class press extends StatefulWidget {
  const press({
    super.key,
  });

  @override
  State<press> createState() => _pressState();
}

class _pressState extends State<press> {
  final CounterController counter = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: 65,
        height: 47,
        decoration: BoxDecoration(border: Border.all(color: primaryColor)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "${counter.count}",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: styletext,
                          color: black,
                          fontWeight: FontWeight.w500),
                    )),
                Expanded(
                  child: ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        GestureDetector(
                            onTap: () {
                              if (counter.count < 5) counter.increment();
                            },
                            child: SvgPicture.asset(
                              "assets/icons/arrow_top.svg",
                              width: 10,
                              height: 10,
                            )),
                        InkWell(
                            onTap: () {
                              if (counter.count > 1) counter.decrement();
                            },
                            child: SvgPicture.asset(
                              "assets/icons/arrow_bottom.svg",
                              width: 10,
                              height: 10,
                            )),
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
