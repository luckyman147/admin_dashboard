import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:karhabtiapp_dashboard_admin/model/Get/counter.dart';
import 'package:karhabtiapp_dashboard_admin/model/services/userService.dart';
import 'package:karhabtiapp_dashboard_admin/screens/components/dialogue/dialogueUserinfoWidget.dart';

import '../../../constants/constants.dart';
import '../../../model/Get/table_Usercontroller.dart';
import '../../functions/date.dart';
import '../dialogue/dialogueEditUserWidget .dart';

class TabledUser extends StatefulWidget {
  TabledUser(
      {super.key,
      required this.tableData,
      required this.space,
      required this.number});
  double space;
  final int number;
  List<Map<String, dynamic>> tableData;
  @override
  State<TabledUser> createState() => _TabledUserState();
}

class _TabledUserState extends State<TabledUser> {
  final UserController userController = Get.put(UserController());
  final counter = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    final tableController =
        Get.put(TableUserStatesController(widget.tableData.length));
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 1),
      child: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              border: TableBorder(
                  horizontalInside: BorderSide(
                      color: rox, style: BorderStyle.solid, width: 1)),
              showBottomBorder: true,
              // sortAscending: true,
              dataRowHeight: 100,
              columnSpacing: widget.space,
              dividerThickness: 3,
              showCheckboxColumn: false,
              horizontalMargin: 10,

              headingRowColor: MaterialStateColor.resolveWith((states) {
                if (states.contains(MaterialState.selected)) {
                  return secondaryColor;
                }
                return primaryColor;
              }),
              dataRowColor: MaterialStateColor.resolveWith((states) {
                if (states.contains(MaterialState.selected)) {
                  return secondaryColor;
                }
                return Colors.white;
              }),
              columns: [
                DataColumn(label: Obx(() => checkAll(tableController))),
                DataColumn(label: Text("User", style: column)),
                DataColumn(label: Text("Id", style: column)),
                DataColumn(label: Text('User ', style: column)),
                DataColumn(label: Text('Email', style: column)),
                DataColumn(label: Text('Phone', style: column)),
                DataColumn(label: Text('User Profile', style: column)),
                DataColumn(label: Text('Joining Date', style: column)),
                DataColumn(label: Text('Actions', style: column)),
              ],
              rows: List<DataRow>.generate(
                  widget.number > 5 ? 5 : widget.number,
                  (index) => DataRow(
                          onLongPress: () {
                            showDialog(
                                context: context,
                                builder: (builder) => userInfoAlertDialog(
                                    email: widget.tableData[index]['email'],
                                    phone: widget.tableData[index]['Phone'],
                                    UserProfile: widget.tableData[index]
                                        ['UserProfile'],
                                    JoiningDate: widget.tableData[index]
                                        ['JoiningDate'],
                                    BirthDate: widget.tableData[index]
                                        ['BirthDate'],
                                    UserImage: widget.tableData[index]
                                            ['userImage'] ??
                                        "https://thumbs.dreamstime.com/b/mossy-little-waterfall-9482554.jpg",
                                    Genre: widget.tableData[index]['Genre'],
                                    sex: widget.tableData[index]['Sex'],
                                    Adress: widget.tableData[index]['Adress'],
                                    Name: widget.tableData[index]['Username']));
                          },
                          cells: [
                            DataCell(Obx(() => check(index, tableController))),
                            DataCell(Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: yellow, width: 3),
                              ),
                              child: CircleAvatar(
                                radius: 20,
                                backgroundImage: NetworkImage(
                                    "${widget.tableData[index]['userImage'] ?? "https://thumbs.dreamstime.com/b/mossy-little-waterfall-9482554.jpg"}"),
                              ),
                            )),
                            DataCell(Text(
                              " #KA${widget.tableData[index]['id']}",
                              style: column,
                            )),
                            DataCell(Text(
                              widget.tableData[index]['Username'],
                              style: column,
                            )),
                            DataCell(Text(
                              widget.tableData[index]['email'],
                              style: columnRO,
                            )),
                            DataCell(Text(
                              widget.tableData[index]['Phone'],
                              style: columnRO,
                            )),
                            DataCell(Text(
                              widget.tableData[index]['UserProfile'],
                              style: columnRO,
                            )),
                            DataCell(Text(
                              "${formatDateString(widget.tableData[index]['JoiningDate'])}",
                              style: columnRO,
                            )),
                            DataCell(Obx(() {
                              return Visibility(
                                visible:
                                    tableController.activationList[index].value,
                                maintainSize: false,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (buider) =>
                                                MyEditUserDialog(
                                                  id: widget.tableData[index]
                                                      ['id'],
                                                  userName:
                                                      widget.tableData[index]
                                                          ['Username'],
                                                  Phone: widget.tableData[index]
                                                      ['Phone'],
                                                  Genre: widget.tableData[index]
                                                      ['Genre'],
                                                  ImageUrl:
                                                      widget.tableData[index]
                                                          ['userImage'],
                                                  adresse:
                                                      widget.tableData[index]
                                                          ['Adress'],
                                                  password:
                                                      widget.tableData[index]
                                                          ['password'],
                                                ));
                                      },
                                      child: SvgPicture.asset(
                                        "assets/icons/modify.svg",
                                        // colorFilter:
                                        //     ColorFilter.mode(
                                        //         black,
                                        //         BlendMode
                                        //             .srcIn),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        bool success =
                                            await userController.deleteUser(
                                                widget.tableData[index]['id']);
                                        counter.decrement();
                                        showCustomSnackbar(
                                            success, "deleted", "User");
                                      },
                                      child: SvgPicture.asset(
                                        "assets/icons/delete.svg",
                                        // colorFilter:
                                        //     ColorFilter.mode(
                                        //         black,
                                        //         BlendMode
                                        //             .srcIn),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }))
                          ])),
            ),
          ),
        ),
      ),
    );
  }

  Checkbox checkAll(TableUserStatesController controller) {
    return Checkbox(
      activeColor: secondaryColor,
      fillColor: MaterialStateColor.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return secondaryColor;
        }
        return Colors.white;
      }),
      value: controller.checkall.value,
      onChanged: (value) {
        if (controller.checkall.value) {
          controller.deactivateAll();
        } else {
          controller.activateAll();
        }
      },
      splashRadius: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      side: BorderSide(color: checkColor),
    );
  }

  Checkbox check(int index, TableUserStatesController controller) {
    print("Index: $index, Activation List: ${controller.activationList}");
    return Checkbox(
      activeColor: secondaryColor,
      fillColor: MaterialStateColor.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return secondaryColor;
        }
        return Colors.white;
      }),
      value: controller.activationList[index].value,
      onChanged: (value) {
        if (controller.activationList[index].value) {
          controller.deactivate(index);
        } else {
          controller.activate(index);
        }
      },
      splashRadius: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      side: BorderSide(color: checkColor),
    );
  }
}
