/*import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodifi/constants/sharedPreferences.dart';
import 'package:foodifi/pages/config/configPage.dart';
import 'package:foodifi/services/connectionStatus.dart';*/

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants/sharedPreferences.dart';
import 'pages/config/configPage.dart';
import 'services/connectionStatus.dart';

void main() {
  ConnectionStatus connectionStatus = ConnectionStatus.getInstance();
  connectionStatus.initialize();
  // initilizeLocalDB();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  //* Forcing only portrait orientation
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  // * Get Shared Preference Instance for whole app
  LocalStorageService.getInstance();

  // Set `enableInDevMode` to true to see reports while in debug mode
  // This is only to be used for confirming that reports are being
  // submitted as expected. It is not intended to be used for everyday
  // development.
  Crashlytics.instance.enableInDevMode = true;

  // Pass all uncaught errors from the framework to Crashlytics.
  FlutterError.onError = Crashlytics.instance.recordFlutterError;

  runApp(ConfigPage());
}

// initilizeLocalDB() async {
//   DBManager db = DBManager.internal();
//   await db.initDb();
// }
