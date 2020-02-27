import 'package:foodifi/constants/FoodiFi.dart';
import 'package:shared_preferences/shared_preferences.dart';

checkUserLoggedIn() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String uid = prefs.get('uid');
  String name = prefs.get('name');
  print(uid);
  var bool = uid == null ? false : true;
  if (bool) {
    FoodiFi.name = name;
    FoodiFi.uid = uid;
  }
  return bool;
}
