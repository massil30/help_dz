import 'package:flutter/material.dart';
import 'package:help_dz/constant.dart';
import 'package:help_dz/function.dart';
import 'package:help_dz/model/usermodel.dart';
import 'package:help_dz/services/userservices.dart';
import 'package:help_dz/widgets/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  UserServices userServices = UserServices();
  String? nName = "";
  String? methode;
  getPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      nName = prefs.getString('name');
      methode = prefs.getString('methode');
      print(methode);
    });
  }

  @override
  void initState() {
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    return nName == ""
        ? const Center(
            child: CircularProgressIndicator(
              color: Colors.green,
            ),
          )
        : setting();
  }

  setting() {
    return nName == null
        ? login(context)
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.green,
              title: Text(
                "الاعدادات",
                style: TextStyle(color: Colors.white),
              ),
            ),
            body: StreamBuilder(
              stream: userServices.readUser(),
              builder: (context, AsyncSnapshot snapshot) {
                List<UserModel> users = [];
                List<UserModel> user = [];

                if (snapshot.hasData) {
                  for (var doc in snapshot.data!.docs) {
                    var data = doc.data();

                    users.add(
                        UserModel(name: data["Name"], methode: data["Method"]));
                  }
                  user = [...users];
                  users.clear;
                  users = getUsertByNameAndMethode(nName!, methode, users);
                  return ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ListTile(
                            title: Text("الاسم:   ${users[0].name}"),
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            child: Divider(
                              color: Colors.black,
                            ),
                          ),
                          ListTile(
                            title: Text(
                                "طريقة تسحيل الدخول:   ${users[0].methode}"),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            child: Divider(
                              color: Colors.black,
                            ),
                          ),
                          ListTile(
                            title: Text(" تسجيل الخروج "),
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            child: Divider(
                              color: Colors.black,
                            ),
                          )
                        ],
                      );
                    },
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ));
  }
}
