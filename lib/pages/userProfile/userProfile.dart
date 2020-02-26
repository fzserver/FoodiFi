import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Parth Aggarwal'),
        ),
        body: Container(
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) => ListTile(
              title: Text('12'),
            ),
            separatorBuilder: (BuildContext context, int i) => Divider(),
            itemCount: 5,
          ),
        ),
      );
}
