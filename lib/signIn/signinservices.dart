import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:help_dz/pages/HomePages/home.dart';
import 'package:help_dz/services/userservices.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

void facebookLogin(context) async {
  var userServices = UserServices();
  FirebaseAuth _auth = FirebaseAuth.instance;
  final facebookLogin = FacebookLogin();
  final result = await facebookLogin.logIn(['email']);
  final token = result.accessToken.token;
  final graphResponse = await http.get(Uri.parse(
      "https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${token}"));
  if (result.status == FacebookLoginStatus.loggedIn) {
    final credential = FacebookAuthProvider.credential(token);
    var x = await _auth.signInWithCredential(credential);
    var responsebody = jsonDecode(graphResponse.body);
    final valid = await userServices.facebookCheck(responsebody["name"]);
    if (valid) {
      print("ADD USER");
      userServices.addUser(
        responsebody["name"].toString(),
        "Facebook",
      );
    } else {
      print("deja vu");
    }
    if (responsebody["name"] != null) {
      SharedPreferences.setMockInitialValues({});

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('name', responsebody["name"]);
      prefs.setString('methode', "Facebook");

      print(responsebody["name"]);

      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return Home();
        },
      ));
    }
  }
}

signInWithGoogle(context) async {
  final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  var credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  var userServices = UserServices();
  var x = await FirebaseAuth.instance.signInWithCredential(credential);
  final valid =
      await userServices.gmailCheck(googleUser.displayName.toString());

  if (googleUser.displayName != null) {
    userServices.addUser(googleUser.displayName.toString(), "Gmail");
    if (valid) {
      print("i see this before");
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return Home();
      },
    ));
  }
  return x;
}
