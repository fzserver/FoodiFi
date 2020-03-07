import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodifi/constants/FFRoutes.dart';
import 'package:foodifi/constants/FoodiFi.dart';
import 'package:foodifi/constants/colors.dart';
import 'package:foodifi/firebase/google.dart';
import 'package:foodifi/providers/userRepository.dart';
import 'package:foodifi/utils/SharedPrefs.dart';
import 'package:foodifi/utils/ValidationUtil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final _formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String _email,_password, _fullname,_errorMessage;
  FirebaseAuth _auth;

  bool _isSigInForm, _isGmailform;
  bool _isLoading;
  String userId = "";

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  // Perform signup
  void validateAndSubmit() async {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    setState(() {
      _errorMessage = "";
      _isLoading = true;
    });
    final valid = await GoogleServices().checkEmailExist(_email);
    if (!valid) {
      _isLoading = false;

      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('User Already Exist'),
        duration: Duration(seconds: 3),
      ));
    } else {
      if (validateAndSave()) {
        UserRepository.instance().signUp(_fullname,_email, _password).then(
              (val) async {
                FirebaseUser user = val;
            if (user != null && user.uid!=null) {
              SharedPrefs.setUserName( user.uid).
              setState(() {
                _errorMessage = "";
                _isLoading = false;
              });
              Navigator.of(context).pushNamedAndRemoveUntil(
                  FFRoutes.mainpage, (Route<dynamic> route) => false);
            } else {
              setState(() {
                _errorMessage = "";
                _isLoading = false;
              });
              _scaffoldKey.currentState.showSnackBar(SnackBar(
                content: Text('Something went wrong'),
                duration: Duration(seconds: 3),
              ));
            }
          },
        );

      } else {

      }
    }
  }

  @override
  void initState() {
    _isLoading = false;
    _errorMessage = "";
    _isSigInForm = true;
    super.initState();
  }

  void resetForm() {
    _formKey.currentState.reset();
    _errorMessage = "";
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
                            hintText: "Full Name",
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
                              ValidationUtils.validateName(value),
                          onSaved: (value) => _fullname = value.trim(),
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
                          child: TextFormField(
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
                            validator: (value) =>
                                ValidationUtils.emailValidator(value),
                            onSaved: (value) => _email = value.trim(),
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
            ValidationUtils.showCircularProgress(_isLoading),
          ],
        ),
      ));
}
