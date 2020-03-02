 import 'package:flutter/material.dart';

class ValidationUtils {

  static String emailValidator(String value) {
    if (value.isEmpty) {
      // The form is empty
      return "Email can\'t be empty";
    }
    // This is just a regular expression for email addresses
    String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
        "\\@" +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
        "(" +
        "\\." +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
        ")+";
    RegExp regExp = new RegExp(p);

    if (regExp.hasMatch(value)) {
      // So, the email is valid
      return null;
    }

    // The pattern of the email didn't match the regex above.
    return 'Email is not valid';
  }

 static String passwordValidator(String password){
    if(password.isEmpty){
      return 'Password can\'t be empty';
    }else if(password.length < 6){
      return 'Password should be minimum 6 charactes';
    }
    return null;
  }

 static  void createSnackBar(BuildContext context,String message) {
    final snackBar = new SnackBar(content: new Text(message),
        backgroundColor: Colors.red);

    // Find the Scaffold in the Widget tree and use it to show a SnackBar!
    Scaffold.of(context).showSnackBar(snackBar);
  }
 }
