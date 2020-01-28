import 'package:flutter/material.dart';
import 'package:foodifi/constants/FoodiFi.dart';
import 'package:foodifi/constants/colors.dart';
import 'package:foodifi/pages/home/homePage.dart';

class ConfigPage extends StatefulWidget {
  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: FoodiFi.appName,
        debugShowCheckedModeBanner: false,
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
        home: HomePage(),
        routes: {},
      );
}
// );
// }
