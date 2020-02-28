import 'package:flutter/material.dart';
import 'package:foodifi/widgets/subsMenu/subMenuModel.dart';

class MenuItem extends StatelessWidget {
  final SubMenu menu;
  MenuItem({this.menu});
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Container(
      height: deviceSize.height * 0.09,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0xFFBFF7CF),
            blurRadius: 20.0, // has the effect of softening the shadow
            spreadRadius: 5.0, // has the effect of extending the shadow
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          20.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Container(
                //   padding: EdgeInsets.all(8.0),
                //   decoration: BoxDecoration(
                //     shape: BoxShape.circle,
                //     color: menu.iconColor,
                //   ),
                //   child: Icon(
                //     menu.icon,
                //     color: Colors.white,
                //   ),
                // ),
                Container(
                  margin: EdgeInsets.only(left: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        menu.title,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        menu.subTitle,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: profile_item_color,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            // Icon(
            //   Icons.chevron_right,
            //   color: profile_item_color,
            // )
            MaterialButton(
              onPressed: () {},
              child: Text(
                'Choose',
              ),
              color: Colors.greenAccent,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  50.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const Color profile_info_address = Color(0xFF8D7AEE);
const Color profile_info_privacy = Color(0xFFF369B7);
const Color profile_info_general = Color(0xFFFFC85B);
const Color profile_info_notification = Color(0xFF5DD1D3);
const Color profile_item_color = Color(0xFFC4C5C9);
