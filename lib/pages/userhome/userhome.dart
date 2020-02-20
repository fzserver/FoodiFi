import 'package:flutter/material.dart';
import 'package:foodifi/constants/sharedPreferences.dart';

class UserHomePage extends StatefulWidget {
  @override
  _UserHomePageState createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  // var fireEmail = LocalStorageService().getFromDisk('fireuser');
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
        ),
        body: Center(
          child: Text('Home User'),
        ),
      );
}
