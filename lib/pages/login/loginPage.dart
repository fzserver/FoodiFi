import 'package:flutter/material.dart';
import 'package:foodifi/constants/FoodiFi.dart';
import 'package:foodifi/constants/colors.dart';
import 'package:foodifi/firebase/google.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // TextEditingController _email;
  // TextEditingController _password;
  // final _formKey = GlobalKey<FormState>();
  // final _key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // _email = TextEditingController(text: "");
    // _password = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 650,
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
              height: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Login",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 28.0,
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.only(
                      left: 30,
                      right: 30,
                      top: 30,
                    ),
                    elevation: 11,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          40,
                        ),
                      ),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.black26,
                        ),
                        suffixIcon: Icon(
                          Icons.check_circle,
                          color: Colors.black26,
                        ),
                        hintText: "Username",
                        hintStyle: TextStyle(color: Colors.black26),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              40.0,
                            ),
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 16.0,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.only(
                      left: 30,
                      right: 30,
                      top: 20,
                    ),
                    elevation: 11,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          40,
                        ),
                      ),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.black26,
                        ),
                        hintText: "Password",
                        hintStyle: TextStyle(
                          color: Colors.black26,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              40.0,
                            ),
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 16.0,
                        ),
                      ),
                    ),
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
                          Navigator.pushNamed(context, FoodiFi.welcome),
                      elevation: 11,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            40.0,
                          ),
                        ),
                      ),
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: FiColors.textColor,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Forgot your password?",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text("or connect with"),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                        child: RaisedButton(
                          child: Text("Facebook"),
                          textColor: FiColors.textColor,
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                40,
                              ),
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: RaisedButton(
                          child: Text("Google"),
                          textColor: FiColors.textColor,
                          color: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                40,
                              ),
                            ),
                          ),
                          onPressed: () =>
                              GoogleServices().signInWithGoogle().whenComplete(
                                    () => Navigator.pushNamed(
                                      context,
                                      FoodiFi.userhome,
                                    ),
                                  ),
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Dont have an account?",
                      ),
                      FlatButton(
                        child: Text(
                          "Sign up",
                        ),
                        textColor: FiColors.bgColor,
                        onPressed: () =>
                            Navigator.pushNamed(context, FoodiFi.welcome),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
