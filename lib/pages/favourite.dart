import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/favouritewidget.dart';

class Favourite extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(
          'Favourites',
          style: TextStyle(color: Colors.black,fontStyle: FontStyle.normal),
        )),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: <Widget>[
          favouritewidget(),
          favouritewidget(),
          favouritewidget(),
          favouritewidget(),
          favouritewidget(),
        ],
      ),
    );
  }


}