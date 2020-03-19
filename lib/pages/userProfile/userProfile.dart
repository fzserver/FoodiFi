import 'package:flutter/material.dart';
import 'package:foodifi/providers/userRepository.dart';
import 'package:foodifi/utils/SharedPrefs.dart';
import 'package:provider/provider.dart';

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

  var _username;
  SharedPrefs prefs;

  @override
  void initState() {
    super.initState();
  }

  foo(userid) {
    UserRepository.instance().setUserName(userid).then(
      (val) {
        String user = val;
        if (user != null) {
          _username = user;
          print(user);
          return _username;
        } else {
          print("no user");
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //final userRepository = Provider.of<UserRepository>(context);
    return Consumer(builder: (context, UserRepository user, _) {
      String user_id = user.user.uid;
      String displayName = user.user.displayName;
      if (user_id != null) {
        if (displayName != null && displayName.isNotEmpty) {
          _username = displayName;
        } else {
          _username = foo(user_id);
          print(_username);
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(_username != null ? _username : ""),
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
                      //  SharedPrefs.removeValues();
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
    });
  }
}
