import 'package:flutter/material.dart';
import 'package:foodifi/constants/FoodiFi.dart';
import 'package:foodifi/constants/colors.dart';
import 'package:foodifi/pages/home/homePage.dart';
import 'package:splashscreen/splashscreen.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) => SplashScreen(
        seconds: 4,
        navigateAfterSeconds: HomePage(),
        title: Text(
          "welcome to FoodiFi",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
          textAlign: TextAlign.center,
        ),
        image: Image.asset(
          'assets/images/logo.png',
          fit: BoxFit.fill,
          width: 200.0,
        ),
        backgroundColor: Colors.yellowAccent[300],
        photoSize: 220.0,
        loaderColor: Colors.red,
      );
}
