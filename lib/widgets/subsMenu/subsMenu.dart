import 'package:flutter/material.dart';
import 'package:foodifi/widgets/subsMenu/menuItem.dart';
import 'package:foodifi/widgets/subsMenu/subMenuModel.dart';

class SubsMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        MenuItem(
          menu: SubMenu(
            title: 'Address',
            subTitle: 'Ensure your harvesting address',
            iconColor: profile_info_address,
            icon: Icons.location_on,
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        MenuItem(
          menu: SubMenu(
            title: 'Privacy',
            subTitle: 'System permission change',
            iconColor: profile_info_privacy,
            icon: Icons.lock,
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        MenuItem(
          menu: SubMenu(
            title: 'General',
            subTitle: 'Basic functional settings',
            iconColor: profile_info_general,
            icon: Icons.layers,
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        MenuItem(
          menu: SubMenu(
            title: 'Notification',
            subTitle: 'Take over the news in time',
            iconColor: profile_info_notification,
            icon: Icons.notifications,
          ),
        ),
      ],
    );
  }
}
