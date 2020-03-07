import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodifi/constants/sharedPreferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPrefs _instance;
  static SharedPreferences _preferences;
  static const String KEY = 'value';

  static Future<SharedPrefs> getInstance() async {
    if (_instance == null) {
      _instance = SharedPrefs();
    }

    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }

    return _instance;
  }

  static setUserName(String uid) async {
    String name;
    DocumentReference documentReference =
        Firestore.instance.collection("Users").document(uid);
    documentReference.get().then((datasnapshot) {
      if (datasnapshot.exists) {
        print(datasnapshot.data['user_name'].toString());
        name = datasnapshot.data['user_name'].toString();
        print(name);
        setPrefsUserName(name);
      } else {
        print("No such user");
      }
    });
  }

  static getUserName() async {
    String name = _preferences.getString('user_name');
    return name;
  }

  static removeValues() async {
    _preferences.remove("user_name");
  }

  static  setPrefsUserName(String name) async {
    _preferences.setString('user_name', name);
  }
}
