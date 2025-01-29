import 'package:flutter/material.dart';
import 'package:help_dz/signIn/enterpage.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'HomePages/home.dart';

class Introduction extends StatefulWidget {
  const Introduction({Key? key}) : super(key: key);

  @override
  _IntroductionState createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: pages,
        showSkipButton: true,
        skip: Text("تخطي",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 19)),
        next: Text("التالي",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 19)),
        done: Icon(
          Icons.arrow_back_ios_new,
          color: Colors.white,
          size: 20,
        ),
        onDone: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return Home();
          },
        )),
        globalBackgroundColor: Colors.green,
      ),
    );
  }
}

var pages = [
  PageViewModel(
    titleWidget: Text("تطبيق عاون",
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        )),
    bodyWidget: Text(
      " تطبيق عاون هو تطبيق وسيط بين المحتاجين و الجمعيات و المتبرعين ",
      style: TextStyle(color: Colors.grey[300], fontWeight: FontWeight.bold),
    ),
    image: Container(
      margin: EdgeInsets.only(top: 50),
      child: Center(
        child: Image.asset("images/helpdz.png", height: 175.0),
      ),
    ),
  ),
  PageViewModel(
    titleWidget: Text(" الهدف",
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        )),
    bodyWidget: Text(
      "الهدف من التطبيق نشر التعاون و المساعدات الانسانية و انقاذاكبر عدد من الارواح",
      style: TextStyle(color: Colors.grey[300], fontWeight: FontWeight.bold),
    ),
    image: Container(
      margin: EdgeInsets.only(top: 50),
      child: Center(
        child: Image.asset("images/goal.png", height: 175.0),
      ),
    ),
  ),
  PageViewModel(
    titleWidget: Text("الجمعيات",
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        )),
    bodyWidget: Text(
      " يتوفر في التطبيق  مواقع و ارقام تواصل عدة جمعيات في مناطق الوطن",
      style: TextStyle(color: Colors.grey[300], fontWeight: FontWeight.bold),
    ),
    image: Container(
      margin: EdgeInsets.only(top: 50),
      child: Center(
        child: Image.asset("images/charity.png", height: 175.0),
      ),
    ),
  ),
  PageViewModel(
    titleWidget: Text("الاحتياجات",
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        )),
    bodyWidget: Text(
      "يمكن للناس طلب المساعدة و وضع احتياجاتهم في التطبيق",
      style: TextStyle(color: Colors.grey[300], fontWeight: FontWeight.bold),
    ),
    image: Container(
      margin: EdgeInsets.only(top: 50),
      child: Center(
        child: Image.asset("images/helpme.png", height: 175.0),
      ),
    ),
  )
];
