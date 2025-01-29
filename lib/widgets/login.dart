import 'package:flutter/material.dart';
import 'package:help_dz/constant.dart';
import 'package:help_dz/signIn/signinservices.dart';

login(
  context,
) {
  return Scaffold(
    body: Center(
      child: Container(
        color: Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "تسجيل الدخول",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                alignment: Alignment.topRight,
                child: Text(
                  " عن طريق :     ",
                  style: TextStyle(color: Colors.white),
                )),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                facebookLogin(context);
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                width: MediaQuery.of(context).size.width / 2 - 20,
                child: Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Image.asset("images/facebook.png"),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Facebook",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                signInWithGoogle(context);
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                width: MediaQuery.of(context).size.width / 2 - 20,
                child: Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Image.asset("images/Google.png"),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Gmail",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
