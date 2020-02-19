import 'package:flutter/material.dart';
import 'package:foodifi/constants/FoodiFi.dart';
import 'package:foodifi/constants/colors.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacementNamed(FoodiFi.login);
  }

  @override
  Widget build(BuildContext context) => IntroductionScreen(
        pages: [
          PageViewModel(
            title: "Quick Search",
            body: "Location",
            image: FlutterLogo(
              size: 10.0,
            ),
            decoration: PageDecoration(
              titleTextStyle: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.w700,
                color: FiColors.textColor,
              ),
              bodyTextStyle: TextStyle(
                fontSize: 19.0,
                color: FiColors.textColor,
              ),
              descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
              pageColor: FiColors.bgColor,
              imagePadding: const EdgeInsets.only(top: 20.0),
            ),
          ),
          PageViewModel(
            title: "Variety of Food",
            body: "Location",
            image: FlutterLogo(
              size: 10.0,
            ),
            decoration: PageDecoration(
              titleTextStyle: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.w700,
                color: FiColors.textColor,
              ),
              bodyTextStyle: TextStyle(
                fontSize: 19.0,
                color: FiColors.textColor,
              ),
              descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
              pageColor: FiColors.bgColor,
              imagePadding: const EdgeInsets.only(top: 20.0),
            ),
          ),
          PageViewModel(
            title: "Search for a place",
            body: "Location",
            image: FlutterLogo(
              size: 10.0,
            ),
            decoration: PageDecoration(
              titleTextStyle: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.w700,
                color: FiColors.textColor,
              ),
              bodyTextStyle: TextStyle(
                fontSize: 19.0,
                color: FiColors.textColor,
              ),
              descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
              pageColor: FiColors.bgColor,
              imagePadding: const EdgeInsets.only(top: 20.0),
            ),
          ),
          PageViewModel(
            title: "Fast Shipping",
            body: "Location",
            image: FlutterLogo(
              size: 10.0,
            ),
            decoration: PageDecoration(
              titleTextStyle: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.w700,
                color: FiColors.textColor,
              ),
              bodyTextStyle: TextStyle(
                fontSize: 19.0,
                color: FiColors.textColor,
              ),
              descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
              pageColor: FiColors.bgColor,
              imagePadding: const EdgeInsets.only(top: 20.0),
            ),
          ),
        ],
        onDone: () => _onIntroEnd(context),
        //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
        showSkipButton: true,
        skipFlex: 0,
        nextFlex: 0,
        skip: const Text(
          'Skip',
          style: TextStyle(
            color: FiColors.textColor,
          ),
        ),
        next: const Icon(
          Icons.arrow_forward,
          color: FiColors.textColor,
        ),
        done: const Text(
          'Done',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: FiColors.textColor,
          ),
        ),
        dotsDecorator: const DotsDecorator(
          size: Size(10.0, 10.0),
          color: FiColors.inActiveDotColor,
          activeColor: FiColors.activeDotColor,
          activeSize: Size(22.0, 10.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                25.0,
              ),
            ),
          ),
        ),
      );
}
