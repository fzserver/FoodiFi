import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs{

 static setUserName(String uid) async {
   String name;
   DocumentReference documentReference = Firestore.instance.collection("Users").document(uid);
   documentReference.get().then((datasnapshot) {
     if (datasnapshot.exists) {
       print(datasnapshot.data['user_name'].toString());
      name = datasnapshot.data['user_name'].toString();
       print(name);
       setPrefsUserName(name);
     }
     else {
       print("No such user");
     }
   });
  }

 static getUserName() async{
   SharedPreferences prefs = await SharedPreferences.getInstance();
   String name = prefs.getString('user_name');
   return name;
 }

 static removeValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("user_name");
  }

  static void setPrefsUserName(String name) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user_name', name);

  }
}