import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodifi/utils/SharedPrefs.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class UserRepository with ChangeNotifier {
  final Firestore _firestore = Firestore.instance;
  FirebaseAuth _auth;
  FirebaseUser _user;
  GoogleSignIn _googleSignIn;
  String name;
  Status _status = Status.Uninitialized;
  bool loginSkipped = false;
  String error = '';
  var result ;

  UserRepository.instance()
      : _auth = FirebaseAuth.instance, _googleSignIn = GoogleSignIn() {
    _auth.onAuthStateChanged.listen(_onAuthStateChanged);
    _checkIsLoginSkipped();
  }

  Status get status => _status;
  FirebaseUser get user => _user;

  String get userName => name;

  bool get isAuthenticated {
    return _user != null;

  }

  void _checkIsLoginSkipped() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    loginSkipped = prefs.getBool('login_skipped') ?? false;
    //  prefs.setString("user_name", value);
    notifyListeners();
  }

  Future<FirebaseUser> signIn(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      _user = result.user;
      _status = Status.Authenticated;
      notifyListeners();
      return _user;
    } on Exception catch (e) {
      print(e);
      return null;
    } catch (e) {
      _status = Status.Unauthenticated;
      print(e);
      return null;
    }
  }

  Future<FirebaseUser> signUp(String _fullname,String email, String password) async {
    try {

      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      _user = result.user;
      addToFirestore(_user,_fullname);
      notifyListeners();
      _status = Status.Authenticated;
      return _user;
    } on Exception catch (e) {
      print(e);
      return null;
    } catch (e) {
      _status = Status.Unauthenticated;
      print(e);
      return null;
    }
  }

  Future<dynamic> signInWithGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(accessToken: googleAuth.accessToken, idToken: googleAuth.idToken,);
      final AuthResult result  = await _auth.signInWithCredential(credential);
      _user = result.user;
      assert(user.email != null);
      assert(user.displayName != null);
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      addToFirestore(user,null);
      _status = Status.Authenticated;
      notifyListeners();
      return _user;
    } catch (e) {
      print(e);
      _status = Status.Unauthenticated;
      error = e.message;
      return null;
    }
  }
  Future<void> signOut() async {

    try {
      await _auth.signOut();
      await _googleSignIn.signOut();
      _status = Status.Unauthenticated;
      notifyListeners();
    } catch (e) {
      print(e);
    }
    // return Future.delayed(Duration.zero);
  }

  Future<void> _onAuthStateChanged(FirebaseUser firebaseUser) async {
    if (firebaseUser == null) {
      _status = Status.Unauthenticated;
    } else {
      _user = firebaseUser;
      _status = Status.Authenticated;
    }
    notifyListeners();
  }

  Future<void> addToFirestore(FirebaseUser user, String fullname) async {
    String user_name = fullname!=null? fullname: user.displayName;
    await _firestore.collection("Users").document(user.uid).setData({"user_name": user_name,
      "user_id":user.uid, "email":user.email,});
  }

  Future<String> setUserName(String uid) async{
    try{
    //  DocumentReference documentReference = await  Firestore.instance.collection("Users").document(uid);
      await await  Firestore.instance.collection("Users").document(uid).get().then((datasnapshot) {
        if (datasnapshot.exists) {
          print(datasnapshot.data['user_name'].toString());
          name = datasnapshot.data['user_name'].toString();
          print(name);
          notifyListeners();
          return Future.delayed(Duration(seconds: 2), () => name);
        } else {
          print("No such user");
        }
      });
    }catch(e){

    }
    return name;

  }

}

