import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:help_dz/pages/HomePages/needs.dart';
import 'package:help_dz/pages/HomePages/profile.dart';
import 'package:help_dz/pages/HomePages/settings.dart';
import 'package:help_dz/pages/HomePages/tabaro3at.dart';
import 'package:help_dz/pages/adddonation.dart';
import 'package:help_dz/pages/introduction.dart';
import 'package:help_dz/widgets/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    String x =
        "skal,am,smla,zmls,mfzkmlfa,zmld,azm,zdsqlqkqlkqmlskmlqkmlksmlqkmlsqkqmlkmmlaa,am";
    var tabs = [tabaro3at(), Needs(), Profile(), Settings()];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          bottomNavigationBar: BottomNavyBar(
            selectedIndex: _selectedIndex,
            onItemSelected: (index) async {
              setState(() {
                _selectedIndex = index;
              });
              SharedPreferences prefs = await SharedPreferences.getInstance();
            },
            items: [
              BottomNavyBarItem(
                textAlign: TextAlign.center,
                inactiveColor: Colors.black,
                icon: Icon(Icons.apps),
                title: Text(
                  'التبرعات',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                activeColor: Colors.green,
              ),
              BottomNavyBarItem(
                  textAlign: TextAlign.center,
                  inactiveColor: Colors.black,
                  icon: Icon(Icons.help),
                  title: Text('الاحتياجات',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  activeColor: Colors.green),
              BottomNavyBarItem(
                  textAlign: TextAlign.center,
                  inactiveColor: Colors.black,
                  icon: Icon(Icons.people),
                  title: Text('الحساب',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  activeColor: Colors.green),
              BottomNavyBarItem(
                  textAlign: TextAlign.center,
                  inactiveColor: Colors.black,
                  icon: Icon(Icons.settings),
                  title: Text('الاعدادات',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                  activeColor: Colors.green),
            ],
          ),
          body: tabs[_selectedIndex]),
    );
  }
}
