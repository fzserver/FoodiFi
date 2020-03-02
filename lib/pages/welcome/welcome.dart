import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodifi/constants/FFRoutes.dart';
import 'package:foodifi/constants/FoodiFi.dart';
import 'package:foodifi/constants/colors.dart';
import 'package:foodifi/firebase/google.dart';
import 'package:foodifi/utils/ValidationUtil.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final _formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String _email;
  String _password;
  String _errorMessage;

  bool _isSigInForm, _isGmailform;
  bool _isLoading;
  String userId = "";

  bool validateAndSave() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  // Perform login or signup
  void validateAndSubmit() async {
    setState(() {
      _errorMessage = "";
      _isLoading = true;
    });
    if (validateAndSave()) {
      GoogleServices().signUp(_email, _password).then(
        (val) async {
          if (val != false) {
            Navigator.of(context).pushNamedAndRemoveUntil(
                FFRoutes.mainpage, (Route<dynamic> route) => false);
          } else {
            _scaffoldKey.currentState.showSnackBar(SnackBar(
              content: Text('Something went wrong'),
              duration: Duration(seconds: 3),
            ));
          }
        },
      );
      setState(() {
        _isLoading = false;
      });
    } else {
      _isLoading = false;
    }
  }

  @override
  void initState() {
    _errorMessage = "";
    _isLoading = false;
    _isSigInForm = true;
    super.initState();
  }

  void resetForm() {
    _formKey.currentState.reset();
    _errorMessage = "";
    _isLoading = false;
  }

  void toggleFormMode() {
    resetForm();
    setState(() {
      _isSigInForm = !_isSigInForm;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      key: _scaffoldKey,
      body: Form(
        key: _formKey,
        child: Stack(
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
                        "Welcome To FoodiFi",
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
                        child: TextFormField(
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
                          validator: (value) =>
                              ValidationUtils.emailValidator(value),
                          onSaved: (value) => _email = value.trim(),
                        ),
                      ),
                      /*  Card(
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
                                Icons.email,
                                color: Colors.black26,
                              ),
                              hintText: "Email",
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
                        ),*/
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
                        child: TextFormField(
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
                          validator: (value) =>
                              ValidationUtils.passwordValidator(value),
                          onSaved: (value) => _password = value.trim(),
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
                          onPressed: () => validateAndSubmit(),
                          elevation: 11,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                40.0,
                              ),
                            ),
                          ),
                          child: Text(
                            "Sign up",
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
                SizedBox(
                  height: 100,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Have an account?",
                          ),
                          FlatButton(
                            child: Text(
                              "Login",
                            ),
                            textColor: FiColors.bgColor,
                            onPressed: () =>
                                Navigator.pushNamed(context, FFRoutes.login),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ));
}
