import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubscriptionPage extends StatelessWidget {
  List names = ["3 Days", "4 Days", "5 Days", "5 Days", "7 Days"];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          "Subscriptions",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        itemCount: names.length,
        itemBuilder: (context, index) => Container(
            padding: const EdgeInsets.all(
              15.0,
            ),
            child: Container(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5.0),
                  topRight: Radius.circular(5.0),
                ),
                child: Text(
                  names[index],
                ),
              ),
            )),
      ),
    ));
  }
}
