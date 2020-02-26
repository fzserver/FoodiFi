import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _buildSearchBox();
  }

  Widget _buildSearchBox() {
    return new Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, right: 10, left: 10),


      child: new Container(
        height: 40,
        decoration: new BoxDecoration (
            border: Border.all(color: Colors.black38),
            borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
            color: Colors.transparent
        ),
        /*padding: new EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),*/
        child: Row(
          children: <Widget>[
            new Padding(
              padding: new EdgeInsets.all(8.0),
              child: Icon(
                  Icons.search, color: Colors.black38,
              ),
            ),

            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search for Restaurants",
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.black38),
                ),
                style: TextStyle(color: Colors.black38, fontSize: 16.0),



              ),
            )

          ],
        )/*new ListTile(
          leading: new Icon(Icons.search),
          title: new TextField(
           // controller: controller,
            //onChanged: onSearchTextChanged,
          ),
          trailing: new IconButton(
            icon: new Icon(Icons.cancel),
            onPressed: () {
             *//* controller.clear();
              onSearchTextChanged('');*//*
            },
          ),
        ),*/
      ),
    );
  }


}