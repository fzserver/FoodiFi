import 'package:flutter/material.dart';
import 'package:foodifi/providers/userRepository.dart';
import 'package:foodifi/utils/SharedPrefs.dart';
import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';

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

  String _username ;

  UserProfile() {
    SharedPrefs.getUserName().then((val) =>
        setState(() {
      _username = val;
    }));
  }


  @override
  Widget build(BuildContext context) {
    //final userRepository = Provider.of<UserRepository>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(_username!=null? _username:"" ),
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
                case 2:break;
                case 3:
                  break;case 4:
                break;
                case 5:
                  SharedPrefs.removeValues();
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
}
