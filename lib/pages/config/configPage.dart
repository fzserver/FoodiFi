import 'package:flutter/material.dart';
import 'package:foodifi/constants/FFRoutes.dart';
import 'package:foodifi/constants/FoodiFi.dart';
import 'package:foodifi/constants/colors.dart';
import 'package:foodifi/pages/favourite.dart';
import 'package:foodifi/pages/home/homePage.dart';
import 'package:foodifi/pages/subscriptions/subscriptions.dart';
import 'package:foodifi/pages/userhome/mainpage.dart';
import 'package:foodifi/pages/onboarding/onboarding.dart';
import 'package:foodifi/pages/phone/phone.dart';
import 'package:foodifi/pages/restaurantMenu/restaurantMenu.dart';
import 'package:foodifi/pages/restaurantProfile/restProfile.dart';
import 'package:foodifi/pages/userhome/userhome.dart';
import 'package:foodifi/pages/welcome/welcome.dart';
import 'package:foodifi/providers/userRepository.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/FoodiFi.dart';

class ConfigPage extends StatefulWidget {
  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  SharedPreferences prefs;
  bool loggedIn = false;

  @override
  void initState() {
    setPrefs();
    super.initState();
  }

  void setPrefs() async {
    prefs = await SharedPreferences.getInstance();
    loggedIn = prefs.containsKey('fireuid');
    print(loggedIn.toString());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (_) => UserRepository.instance(),
        child: Consumer<UserRepository>(
          builder: (_, user, __) => StreamProvider.value(
            value: null,
            // user != null && user.user != null ? prefs.get('fireuid') : null,
            child: MaterialApp(
              title: FoodiFi.appName,
              debugShowCheckedModeBanner: false,
              // debugShowMaterialGrid: true,
              // showSemanticsDebugger: true,
              // showPerformanceOverlay: true,
              // checkerboardOffscreenLayers: true,
              // checkerboardRasterCacheImages: true,
              theme: ThemeData(
                fontFamily: FoodiFi.googleFamily,
                primarySwatch: Colors.red,
                primaryColor: FiColors.appColor,
                canvasColor: FiColors.canvasColor,
                primaryIconTheme: IconThemeData(
                  color: FiColors.iconColor,
                ),
                disabledColor: Colors.grey,
                primaryTextTheme: Theme.of(context).textTheme.apply(
                      fontFamily: 'foodifi',
                      bodyColor: FiColors.textColor,
                      displayColor: FiColors.textColor,
                    ),
                brightness: Brightness.light,
              ),
              initialRoute: loggedIn ? FFRoutes.userhome : FFRoutes.login,
              routes: {
                FFRoutes.mainpage: (BuildContext context) => MainPage(),
                FFRoutes.onboard: (BuildContext context) => Onboarding(),
                FFRoutes.login: (BuildContext context) => HomePage(),
                FFRoutes.welcome: (BuildContext context) => Welcome(),
                FFRoutes.phone: (BuildContext context) => Phone(),
                FFRoutes.userhome: (BuildContext context) => UserHomePage(),
                FFRoutes.restaurant: (BuildContext context) => Restaurant(),
                FFRoutes.restaurantMenu: (BuildContext context) =>
                    RestaurantMenu(),
                FFRoutes.subscriptions: (BuildContext context) =>
                    Subscriptions(),
              },
            ),
          ),
        ),
      );

  // checkUserLoggedIn() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String uid = prefs.get('fireuid');
  //   String name = prefs.get('firename');
  //   print(uid);
  //   var bool = uid == null ? false : true;
  //   if (bool) {
  //     FoodiFi.name = name;
  //     FoodiFi.uid = uid;
  //     // Navigator.of(context).pushNamedAndRemoveUntil(
  //     //     FFRoutes.userhome, (Route<dynamic> route) => false);
  //     return true;
  //   }
  //   return false;
  // }
}
