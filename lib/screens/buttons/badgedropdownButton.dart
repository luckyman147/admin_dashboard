import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_svg/svg.dart';
import 'package:karhabtiapp_dashboard_admin/constants/constants.dart';

class ProfileButtonWithBadge extends StatelessWidget {
  final int itemCount;
  final bool show;

  ProfileButtonWithBadge({required this.itemCount, required this.show});

  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      child: SvgPicture.asset("assets/icons/menu_notification.svg"),
      showBadge: show,
      position: badges.BadgePosition.topEnd(top: -10, end: -10),
      badgeContent: Text(
        "${itemCount}",
        style: TextStyle(fontSize: 12, fontFamily: styletext),
      ),
      badgeStyle:
          badges.BadgeStyle(badgeColor: red, padding: EdgeInsets.all(6)),
    );
  }
}
