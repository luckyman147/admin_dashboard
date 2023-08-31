import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karhabtiapp_dashboard_admin/constants/constants.dart';
import 'package:karhabtiapp_dashboard_admin/constants/utils.dart';

class ComplaintInfoAlertDialog extends StatefulWidget {
  // final String Name;
  final String Username;
  final String subject;
  final String contenu;
  final String date;

  const ComplaintInfoAlertDialog(
      {super.key,
      required this.Username,
      required this.subject,
      required this.contenu,
      required this.date});
  @override
  _ComplaintInfoAlertDialogState createState() =>
      _ComplaintInfoAlertDialogState();
}

class _ComplaintInfoAlertDialogState extends State<ComplaintInfoAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        " Complain Informations",
        style: TextStyle(
            color: black,
            fontFamily: styletext,
            fontSize: 20,
            fontWeight: FontWeight.w600),
      ),
      content: Container(
        width: 500,
        height: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 19.0),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: secondaryColor,
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              "Subject : ",
                              style: TextStyle(
                                  color: black,
                                  fontFamily: styletext,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              widget.subject,
                              style: TextStyle(
                                  color: black,
                                  fontFamily: styletext,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.date,
                          style: TextStyle(color: black),
                        ),
                      ),
                    ],
                  )),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: secondaryColor,
                  )),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "From : ",
                      style: TextStyle(
                          color: black,
                          fontFamily: styletext,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      widget.Username,
                      style: TextStyle(color: black),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 19.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: secondaryColor)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "contenu : ",
                        style: TextStyle(
                            color: black,
                            fontFamily: styletext,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        widget.contenu,
                        style: TextStyle(color: black, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            // Perform action or close the dialog
            Navigator.of(context).pop();
          },
          child: Text(
            'Cancel',
            style: TextStyle(color: textgrey),
          ),
        ),
        TextButton(
          onPressed: () {
            // Perform action or close the dialog
            Navigator.of(context).pop();
          },
          child: Text(
            "reply",
            style: TextStyle(
              color: secondaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
