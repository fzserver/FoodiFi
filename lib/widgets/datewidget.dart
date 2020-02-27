import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodifi/widgets/boxbubble.dart';
import 'package:intl/intl.dart';

class DateWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => DateWidgetState();
}

class DateWidgetState extends State<DateWidget> {
  var _itemCount =10;
  var indexChosen;

  List<String> photos = [
    'https://images.unsplash.com/photo-1498837167922-ddd27525d352?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80',
    'https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80',
    ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
          height: 60,
          child: ListView.builder(
            itemCount: _itemCount,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              DateTime _date = DateTime.now().add(Duration(days: index - 3));
              DateTime date = new DateTime(_date.year, _date.month, _date.day);

              return GestureDetector(
                child:
                    Container(
                      /* color: indexChosen != null && indexChosen == index
                  ? Colors.red
                  : Colors.white,*/
                      decoration: boxDecoration(index),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            /* Text(
                      DateFormat("MMM", Intl.defaultLocale)
                          .format(date)
                          .toUpperCase(), // Month
                    ),*/
                            Text(DateFormat("E", Intl.defaultLocale)
                                .format(date)
                                .toUpperCase(), // WeekDay
                            ),
                            Text(date.day.toString()),
                          ],
                        ),
                      ),
                    ),

                onTap: () {

                  if (index != indexChosen) {
                    setState(() {
                      indexChosen = index;

                    });
                  }

                },
              );
            },
          ),
        ),
        SizedBox(height: 10,),

              ],
    );
  }


  boxDecoration(int index) {
    return indexChosen != null && indexChosen == index ?  BoxDecoration(
      shape: BoxShape.rectangle,
      color: Colors.orange,
      border: (indexChosen != null && indexChosen == index)
          ? Border.all(width: 2.0, color: Colors.orange)
          : Border.all(color: Colors.white),
    ): null;
  }


}