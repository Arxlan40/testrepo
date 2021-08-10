import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connect_hockey/Connect_hockey_app/User.dart';
import 'package:connect_hockey/Connect_hockey_app/screens/CHHomePageScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'Connect_hockey_app/screens/CHLoginScreen.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;
  final fDb = FirebaseFirestore.instance;

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthenticationService(this._firebaseAuth);

  Stream<User> get authStateChange => _firebaseAuth.authStateChanges();

  // GET CURRENT USER
  Future getCurrentUser() async {
    return _firebaseAuth.currentUser;
  }

  Future signInAnonymously() {
    return _firebaseAuth.signInAnonymously();
  }

  // User Sign Out
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  // Email and Password Sign In
  Future<String> signIn({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Signed In";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // Email and Password Sign Up
  Future<String> signUp({String email, String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Signed Up";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      showDialog<void>(
          context: Get.context, // THIS WAS MISSING
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return Center(
                child: Theme(
                    data: Theme.of(context).copyWith(accentColor: Colors.white),
                    child: CircularProgressIndicator()));
          });
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final User user = (await _auth.signInWithCredential(credential)).user;
      print("signed in " + user.displayName);
      bool newUser = await isNewUser(user);
      if (newUser) {
        await UserFirestore()
            .adduser(user.displayName, user.displayName, [], user.email);
        Get.offAll(() => CHHomePageScreen());
      } else {
        Get.offAll(() => CHHomePageScreen());
      }
    } catch (e) {
      Get.back();
      Get.snackbar("Error", "Login Failed");

      print(e);
    }
  }

  Future<UserCredential> signInWithFacebook() async {
    try {
      // Trigger the sign-in flow
      final LoginResult result = await FacebookAuth.instance.login();
      print(result.status);
      if (result.status == LoginStatus.success) {
        showDialog<void>(
            context: Get.context, // THIS WAS MISSING
            barrierDismissible: false, // user must tap button!
            builder: (BuildContext context) {
              return Center(
                  child: Theme(
                      data:
                          Theme.of(context).copyWith(accentColor: Colors.white),
                      child: CircularProgressIndicator()));
            });
        // Create a credential from the access token
        final OAuthCredential credential =
            FacebookAuthProvider.credential(result.accessToken.token);

        final User user = (await _auth.signInWithCredential(credential)).user;
        bool newUser = await isNewUser(user);
        print(user.email);
        if (newUser) {
          await UserFirestore()
              .adduser(user.displayName, user.displayName, [], user.email);
          Get.offAll(() => CHHomePageScreen());
        } else {
          Get.offAll(() => CHHomePageScreen());
        }
      } else {
        Get.snackbar("Error", "Login Failed");
      }
    } catch (e) {
      Get.back();
      Get.snackbar("Error", "Login Failed");

      print(e);
    }
  }

  Future<bool> isNewUser(User user) async {
    QuerySnapshot result = await fDb
        .collection("users")
        .where("email", isEqualTo: user.email)
        .get();
    final List<DocumentSnapshot> docs = result.docs;
    return docs.length == 0 ? true : false;
  }

  Future<bool> validatePassword(String password) async {
    var firebaseUser = _auth.currentUser;
    print(firebaseUser.email);
    var authCredentials = EmailAuthProvider.credential(
        email: firebaseUser.email, password: password);
    try {
      var authResult =
          await firebaseUser.reauthenticateWithCredential(authCredentials);
      return authResult.user != null;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> updatePassword(String password) async {
    var firebaseUser = _auth.currentUser;
    firebaseUser.updatePassword(password);
  }
}
