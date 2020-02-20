import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodifi/constants/sharedPreferences.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<dynamic> signInWithGoogle() async {
    try {
      final GoogleSignInAccount googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      final AuthResult authResult =
          await _auth.signInWithCredential(credential);
      final FirebaseUser user = authResult.user;
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);
      final FirebaseUser currentUser = await _auth.currentUser();
      assert(user.uid == currentUser.uid);
      // print(user);
      signOutGoogle();
      LocalStorageService().saveToDisk('fireuser', user.email);
      return user;
    } on Exception catch (e) {
      print(e);
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  void signOutGoogle() async {
    await _googleSignIn.signOut();
    print("User Sign Out");
  }

  // Future deleteAccount() async {
  //   final FirebaseUser currentUser = await FirebaseAuth.instance.currentUser();
  //   FirebaseDatabase.instance
  //       .reference()
  //       .child("Users")
  //       .child("${Constants.name} - ${Constants.uid}")
  //       .remove();
  //   currentUser.delete();
  //   print("User account deleted");
  // }
}
