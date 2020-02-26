// import 'dart:async';
// import 'dart:io';

// import 'package:digital_cultivation/core/constants/constants.dart';
// import 'package:digital_cultivation/core/constants/route_constants.dart';
// import 'package:digital_cultivation/core/services/connectivity_services.dart';
// import 'package:digital_cultivation/core/services/google_services.dart';
// import 'package:digital_cultivation/core/utils/themes.dart';
// import 'package:digital_cultivation/ui/widgets/dialog_widget.dart';
// import 'package:digital_cultivation/ui/widgets/forgot_password_email_verify_widget.dart';
// import 'package:digital_cultivation/ui/widgets/forgot_password_new_password_widget.dart';
// import 'package:digital_cultivation/ui/widgets/login_widget.dart';
// import 'package:digital_cultivation/ui/widgets/signup_widget.dart';
// import 'package:digital_cultivation/ui/widgets/svg_widget.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:oktoast/oktoast.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class EntryView extends StatefulWidget {
//   @override
//   _EntryViewState createState() => _EntryViewState();
// }

// // TickerProviderStateMixin for control Animation
// class _EntryViewState extends State<EntryView> with TickerProviderStateMixin {
//   final PageController controller = PageController();
//   AnimationController _animationController;
//   Animation<double> _animation;
//   GoogleServices googleServices = GoogleServices();
//   final StreamController loadScreenController = StreamController<bool>();
//   Stream get loadScreenStream => loadScreenController.stream;

//   @override
//   void initState() {
//     _animationController = AnimationController(
//         duration: Duration(seconds: 1), vsync: this); // animation controller
//     _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
//     super.initState();
//     Future.delayed(Duration(seconds: 2), () {
//       checkUserLoggedIn();
//     });
//   }

//   @override
//   void dispose() {
//     loadScreenController.close();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         physics: Platform.isAndroid ? null : BouncingScrollPhysics(),
//         child: Container(
//           height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               fit: BoxFit.cover,
//               image: AssetImage(
//                   "assets/backgroundimage.png"), //Background   image path form assets
//               colorFilter: ColorFilter.mode(
//                   Colors.black.withOpacity(0.4), BlendMode.overlay),
//             ),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Expanded(
//                 flex: 1,
//                 child: SafeArea(
//                   child: TweenAnimationBuilder(
//                     tween: Tween(begin: 1.0, end: 1.0),
//                     duration: Duration(seconds: 2),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         SvgWidget(
//                           assetName: "assets/logo.svg",
//                           fit: BoxFit.contain,
//                         ),
//                         SizedBox(
//                           height: 5,
//                         ),
//                         FittedBox(
//                           child: Text(
//                             "DIGITAL\nCULTIVATION",
//                             style: buildAppTextTheme(context)
//                                 .headline
//                                 .copyWith(fontSize: 28),
//                             textAlign: TextAlign.center,
//                           ),
//                         )
//                       ],
//                     ),
//                     builder: (BuildContext context, double val, Widget child) {
//                       return Opacity(
//                         opacity: val,
//                         child: child,
//                       );
//                     },
//                   ),
//                 ),
//               ),
//               AnimatedBuilder(
//                 animation: _animationController,
//                 child: GestureDetector(
//                   child: Container(
//                     // color: Colors.white,
//                     color: Colors.transparent,
//                     child: SafeArea(
//                       left: false,
//                       bottom: true,
//                       top: false,
//                       right: false,
//                       child: Container(
//                         height: 350,
//                         // color: Colors.white,
//                         color: Colors.transparent,
//                         width: double.infinity,
//                         // child: PageView(
//                         //   controller: controller,
//                         //   children: <Widget>[
//                         //     LoginWidget(updatePageView: updatePageView),
//                         //     SignUpWidget(updatePageView: updatePageView),
//                         //     ForgotPasswordEmailVerifyWidget(updatePageView: updatePageView),
//                         //     ForgotPasswordNewPasswordWidget(updatePageView: updatePageView)
//                         //   ],
//                         // ),
//                         child: Center(
//                           child: SizedBox(
//                             width: 250,
//                             child: RaisedButton(
//                               color: Colors.blue,
//                               child: StreamBuilder<bool>(
//                                   stream: loadScreenStream,
//                                   initialData: true,
//                                   builder: (context, snapshot) {
//                                     if (snapshot.data) {
//                                       return Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceAround,
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.center,
//                                         children: <Widget>[
//                                           SizedBox(
//                                             height: 30,
//                                             width: 30,
//                                             child: SvgWidget(
//                                               assetName:
//                                                   "assets/googleIcon.svg",
//                                               fit: BoxFit.contain,
//                                             ),
//                                           ),
//                                           Text(
//                                             "Sign in with Google ",
//                                             style: TextStyle(
//                                                 color: Colors.white,
//                                                 fontSize: 16),
//                                           ),
//                                         ],
//                                       );
//                                     } else {
//                                       return SizedBox(
//                                           height: 20,
//                                           width: 20,
//                                           child: CircularProgressIndicator(
//                                             backgroundColor: Colors.white,
//                                           ));
//                                     }
//                                   }),
//                               onPressed: () async {
//                                 loadScreenController.sink.add(false);
//                                 ConnectivityServices connectivityServices =
//                                     ConnectivityServices();
//                                 connectivityServices.checkConnectivity().then(
//                                   (result) {
//                                     if (result) {
//                                       googleServices
//                                           .signInWithGoogle()
//                                           .then((val) async {
//                                         print(val);
//                                         if (val != false) {
//                                           FirebaseUser user = val;
//                                           print(user.uid);
//                                           SharedPreferences prefs =
//                                               await SharedPreferences
//                                                   .getInstance();
//                                           prefs.setString("uid", user.uid);
//                                           prefs.setString(
//                                               "name", user.displayName);
//                                           Constants.name = user.displayName;
//                                           Constants.uid = user.uid;
//                                           loadScreenController.sink.add(true);

//                                           Navigator.of(context)
//                                               .pushNamedAndRemoveUntil(
//                                                   RouteConstants.rootView,
//                                                   (Route<dynamic> route) =>
//                                                       false);
//                                         } else {
//                                           loadScreenController.sink.add(true);
//                                           showDialog(
//                                               context: context,
//                                               builder: (BuildContext context) {
//                                                 return DialogWidget(
//                                                     title: "Google Sign in",
//                                                     content: "Sign in failed",
//                                                     actions: [
//                                                       RaisedButton(
//                                                           textColor:
//                                                               Colors.white,
//                                                           child: Text("Ok"),
//                                                           onPressed: () {
//                                                             Navigator.pop(
//                                                                 context);
//                                                           })
//                                                     ]);
//                                               });
//                                         }
//                                       });
//                                     } else {
//                                       loadScreenController.sink.add(true);
//                                       showToast(
//                                           "Internet connection unavailable",
//                                           backgroundColor: Colors.red);
//                                     }
//                                   },
//                                 );
//                               },
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   onTap: () {
//                     FocusScope.of(context).requestFocus(FocusNode());
//                   },
//                 ),
//                 builder: (BuildContext context, Widget child) {
//                   return SizeTransition(
//                     sizeFactor: _animation,
//                     child: child,
//                   );
//                 },
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   checkUserLoggedIn() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String uid = prefs.get("uid");
//     String name = prefs.get("name");
//     print(uid);
//     if (uid == null) {
//       _animationController.forward();
//     } else {
//       Constants.name = name;
//       Constants.uid = uid;
//       Navigator.of(context).pushNamedAndRemoveUntil(
//           RouteConstants.rootView, (Route<dynamic> route) => false);
//     }
//   }

//   void updatePageView(int index) {
//     controller.animateToPage(
//       index,
//       curve: Curves.easeIn,
//       duration: Duration(milliseconds: 400),
//     );
//   }
// }
