import 'package:flutter/material.dart';
import 'package:foodifi/providers/userRepository.dart';

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
              onTap: () {
                switch (index) {
                  case 0:
                    break;
                  case 1:
                    break;
                  case 2:
                    break;
                  case 3:
                    break;
                  case 4:
                    break;
                  case 5:
                    UserRepository.instance().signOut();
                    break;
                }
              },
              title: Text(accInfos[index]),

            ),
            separatorBuilder: (BuildContext context, int i) => Divider(),
            itemCount: accInfos.length,
          ),
        ),
      );
}
