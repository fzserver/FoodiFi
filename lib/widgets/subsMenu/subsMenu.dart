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
            title: '3 Days',
            subTitle: '\u20B9 50/meal',
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        MenuItem(
          menu: SubMenu(
            title: '7 Days',
            subTitle: '\u20B9 60/meal',
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        MenuItem(
          menu: SubMenu(
            title: '14 Days',
            subTitle: '\u20B9 70/meal',
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        MenuItem(
          menu: SubMenu(
            title: '28 Days',
            subTitle: '\u20B9 80/meal',
          ),
        ),
      ],
    );
  }
}
