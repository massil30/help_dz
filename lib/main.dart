import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:help_dz/data/change.dart';
import 'package:help_dz/pages/HomePages/home.dart';
import 'package:help_dz/pages/donationdetails.dart';
import 'package:help_dz/pages/needdetails.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var nName = prefs.getString('name');
  print(nName);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Change>(create: (context) => Change()),
      ],
      child: MaterialApp(
          routes: {
            Tabaro3Details.id: (context) => Tabaro3Details(),
            NeedDetails.id: (context) => NeedDetails(),
          },
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: "Cairo"),
          home:
              Directionality(textDirection: TextDirection.rtl, child: Home())),
    );
  }
}
