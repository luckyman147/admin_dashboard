import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants.dart';

class press extends StatefulWidget {
  const press({super.key});

  @override
  State<press> createState() => _pressState();
}

class _pressState extends State<press> {
  int num = 5;
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    "${num}",
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
                            setState(() {
                              num++;
                            });
                          },
                          child: SvgPicture.asset(
                            "assets/icons/arrow_top.svg",
                            width: 10,
                            height: 10,
                          )),
                      InkWell(
                          onTap: () {
                            setState(() {
                              num--;
                            });
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
    );
  }
}
