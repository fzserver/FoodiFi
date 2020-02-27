import 'package:flutter/material.dart';
import 'package:foodifi/constants/FFRoutes.dart';
import 'package:foodifi/constants/FoodiFi.dart';
import 'package:foodifi/constants/colors.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class Phone extends StatefulWidget {
  @override
  _PhoneState createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              height: 800,
              child: RotatedBox(
                quarterTurns: 2,
                child: WaveWidget(
                  config: CustomConfig(
                    gradients: [
                      [FiColors.bgColor, Colors.greenAccent[400]],
                      [Colors.greenAccent[400], FiColors.bgColor],
                    ],
                    durations: [19440, 10800],
                    heightPercentages: [0.20, 0.25],
                    blur: MaskFilter.blur(BlurStyle.solid, 10),
                    gradientBegin: Alignment.bottomLeft,
                    gradientEnd: Alignment.topRight,
                  ),
                  waveAmplitude: 0,
                  size: Size(
                    double.infinity,
                    double.infinity,
                  ),
                ),
              ),
            ),
            ListView(
              children: <Widget>[
                Container(
                  height: 450,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Verify your Mobile",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 28.0,
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 60.0,
                            width: 50.0,
                            child: Card(
                              color: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: 10.0,
                                  right: 10.0,
                                ),
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  maxLength: 1,
                                  decoration: InputDecoration(
                                    hintText: "*",
                                    counterText: '',
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 60.0,
                            width: 50.0,
                            child: Card(
                              color: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: 10.0,
                                  right: 10.0,
                                ),
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  maxLength: 1,
                                  decoration: InputDecoration(
                                    hintText: "*",
                                    counterText: '',
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 60.0,
                            width: 50.0,
                            child: Card(
                              color: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: 10.0,
                                  right: 10.0,
                                ),
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  maxLength: 1,
                                  decoration: InputDecoration(
                                    hintText: "*",
                                    counterText: '',
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 60.0,
                            width: 50.0,
                            child: Card(
                              color: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: 10.0,
                                  right: 10.0,
                                ),
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  maxLength: 1,
                                  decoration: InputDecoration(
                                    hintText: "*",
                                    counterText: '',
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(30.0),
                        child: RaisedButton(
                          padding: EdgeInsets.symmetric(
                            vertical: 16.0,
                          ),
                          color: Colors.greenAccent,
                          onPressed: () =>
                              Navigator.pushNamed(context, FFRoutes.welcome),
                          elevation: 11,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                40.0,
                              ),
                            ),
                          ),
                          child: Text(
                            "Verify Now",
                            style: TextStyle(
                              color: FiColors.textColor,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "Terms & Conditions",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                // SizedBox(
                //   height: 100,
                // ),
                // Align(
                //   alignment: Alignment.bottomCenter,
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: <Widget>[
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: <Widget>[
                //           Text(
                //             "Have an account?",
                //           ),
                //           FlatButton(
                //             child: Text(
                //               "Login",
                //             ),
                //             textColor: FiColors.bgColor,
                //             onPressed: () =>
                //                 Navigator.pushNamed(context, FoodiFi.login),
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ],
        ),
      );
}
