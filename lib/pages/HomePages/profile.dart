import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:help_dz/constant.dart';
import 'package:help_dz/data/wilaya.dart';
import 'package:help_dz/main.dart';
import 'package:help_dz/function.dart';
import 'package:help_dz/model/donationModel.dart';
import 'package:help_dz/pages/HomePages/home.dart';
import 'package:help_dz/pages/HomePages/needs.dart';
import 'package:help_dz/pages/donationdetails.dart';
import 'package:help_dz/pages/needdetails.dart';
import 'package:help_dz/services/donationservices.dart';
import 'package:help_dz/signIn/signinservices.dart';
import 'package:help_dz/widgets/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  DonationServices donationServices = DonationServices();
  String? x = "";
  getPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      x = prefs.getString('name');
    });
  }

  @override
  void initState() {
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    print("Hi");
    return x == ""
        ? Center(child: CircularProgressIndicator(color: Colors.green))
        : exeption(x, context);
  }
}

exeption(x, context) {
  DonationServices donationServices = DonationServices();
  if (x == null) {
    return login(context);
  } else {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () async {
                  SharedPreferences preferences =
                      await SharedPreferences.getInstance();
                  await preferences.clear();
                  final _auth = FirebaseAuth.instance;

                  await _auth.signOut();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                      ModalRoute.withName("/login"));
                },
                icon: Icon(Icons.logout))
          ],
          toolbarHeight: 50,
          centerTitle: true,
          backgroundColor: Colors.green,
          title: Text(
            x.toString(),
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w100),
          ),
        ),
        body: Column(
          children: [
            Container(
              height: 43,
              child: TabBar(
                  labelColor: Colors.green,
                  unselectedLabelColor: Colors.grey[600],
                  indicatorColor: Colors.green,
                  tabs: [Text("تبرعاتي"), Text("طلباتي"), Text("استشنم")]),
            ),
            Container(
              height: MediaQuery.of(context).size.height -
                  AppBar().preferredSize.height -
                  80 -
                  43,
              child: TabBarView(children: [
                StreamBuilder(
                  stream: donationServices.readDonations(),
                  builder: (context, AsyncSnapshot snapshot) {
                    List<DonationModel> donations = [];
                    List<DonationModel> _donations = [];

                    if (snapshot.hasData) {
                      for (var doc in snapshot.data!.docs) {
                        var data = doc.data();

                        donations.add(DonationModel(
                            donationName: data[donationName],
                            donationWilaya: data[donationWilaya],
                            donationDescription: data[donationDescription],
                            name: data[name],
                            donationType: data[donationType],
                            donationImage1: data[donationImage1],
                            donationImage2: data[donationImage2],
                            donationImage3: data[donationImage3],
                            donationNumber: data[donationNumber]));
                        _donations = [...donations];
                        donations.clear();
                        donations = getByName("Massil", _donations);
                      }
                      return GridView.builder(
                        itemCount: donations.length,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                        itemBuilder: (context, index) {
                          return containerWidget(
                              "skmsklmalkasmlasksmlkasmlskamlaskamlskamlazksmlkam",
                              donations[index].donationType,
                              donations[index].donationWilaya,
                              "Masskslamksamlkazmil",
                              context,
                              donations[index],
                              Tabaro3Details.id);
                        },
                      );
                    }
                    return const CircularProgressIndicator(
                      color: Colors.green,
                    );
                  },
                ),
                StreamBuilder(
                  stream: donationServices.readNeeds(),
                  builder: (context, AsyncSnapshot snapshot) {
                    List<DonationModel> donations = [];
                    List<DonationModel> _donations = [];

                    if (snapshot.hasData) {
                      for (var doc in snapshot.data!.docs) {
                        var data = doc.data();

                        donations.add(DonationModel(
                            donationName: data[donationName],
                            donationWilaya: data[donationWilaya],
                            donationDescription: data[donationDescription],
                            donationType: data[donationType],
                            name: data[name],
                            donationImage1: data[donationImage1],
                            donationImage2: data[donationImage2],
                            donationImage3: data[donationImage3],
                            donationNumber: data[donationNumber]));
                        _donations = [...donations];
                        donations.clear();
                        donations = getByName("Massil", _donations);
                      }
                      return GridView.builder(
                        itemCount: donations.length,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                        itemBuilder: (context, index) {
                          return containerWidget(
                              "skmsklmalkasmlasksmlkasmlskamlaskamlskamlazksmlkam",
                              donations[index].donationType,
                              donations[index].donationWilaya,
                              "Masskslamksamlkazmil",
                              context,
                              donations[index],
                              NeedDetails.id);
                        },
                      );
                    }
                    return const CircularProgressIndicator(
                      color: Colors.green,
                    );
                  },
                ),
                Text("s")
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
