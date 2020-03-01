import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  List<String> accInfos = [
    'Orders',
    'Subcriptions',
    'Manage Addresses',
    'Payments',
    'Help & Support',
    'Logout'
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Parth Aggarwal'),
        ),
        body: Container(
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) => ListTile(
              title: Text(accInfos[index]),

            ),
            separatorBuilder: (BuildContext context, int i) => Divider(),
            itemCount: accInfos.length,
          ),
        ),
      );
}
