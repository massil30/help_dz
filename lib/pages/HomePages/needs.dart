import 'package:flutter/material.dart';
import 'package:help_dz/constant.dart';
import 'package:help_dz/data/wilaya.dart';
import 'package:help_dz/function.dart';
import 'package:help_dz/model/donationModel.dart';
import 'package:help_dz/pages/addNeeds.dart';
import 'package:help_dz/pages/adddonation.dart';
import 'package:help_dz/pages/donationdetails.dart';
import 'package:help_dz/pages/needdetails.dart';
import 'package:help_dz/services/donationservices.dart';

class Needs extends StatefulWidget {
  const Needs({Key? key}) : super(key: key);

  @override
  _NeedsState createState() => _NeedsState();
}

class _NeedsState extends State<Needs> {
  var wilaya;
  var type;
  DonationServices donationServices = DonationServices();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            color: Colors.green,
            height: AppBar().preferredSize.height,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset("images/helpdz.png"),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        "التبرعات",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return AddNeeds();
                      },
                    ));
                  },
                  child: Row(
                    children: [
                      VerticalDivider(
                        color: Colors.white,
                      ),
                      Text(
                        "اضافة احتياج",
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.add,
                        size: 30,
                        color: Colors.white,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 45,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: DropdownButton<String>(
                    //elevation: 5,
                    style: TextStyle(color: Colors.white),
                    iconEnabledColor: Colors.black,
                    focusColor: Colors.green,
                    items: algeriaWilayas
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                    hint: Text(
                      "الولاية",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    value: wilaya, alignment: Alignment.centerRight,
                    onChanged: (value) {
                      setState(() {
                        wilaya = value;
                      });
                      print(wilaya);
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 2, bottom: 2),
                  child: VerticalDivider(
                    color: Colors.grey[600],
                    width: 5,
                    thickness: 2,
                  ),
                ),
                Container(
                  child: DropdownButton<String>(
                    focusColor: Colors.white,
                    //elevation: 5,
                    style: TextStyle(color: Colors.white),
                    iconEnabledColor: Colors.black,

                    items:
                        donation.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                    hint: Text(
                      "صنف التبرع",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    value: type,
                    onChanged: (value) {
                      setState(() {
                        type = value;
                      });
                      print(type);
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
              height: MediaQuery.of(context).size.height -
                  45 -
                  (AppBar().preferredSize.height * 2),
              child: StreamBuilder(
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
                      if (wilaya != null) {
                        _donations = [...donations];
                        donations.clear();
                        donations = getByWilaya(wilaya, _donations);
                      } else if (type != null) {
                        _donations = [...donations];
                        donations.clear();
                        donations = getByType(type, _donations);
                      } else if (type != null && wilaya != null) {
                        _donations = [...donations];
                        donations.clear();
                        donations =
                            getByTypeAndWilaya(type, wilaya, _donations);
                      }
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
              ))
        ],
      )),
    );
  }
}

containerWidget(String donationNameK, String type, String wilaya, String name,
    context, arguments, navigator) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, navigator, arguments: arguments);
    },
    child: Container(
      margin: EdgeInsets.only(left: 8, right: 8, top: 5),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Color(0xFF656565).withOpacity(0.15),
          blurRadius: 4.0,
          spreadRadius: 1.0,
          //           offset: Offset(4.0, 10.0)
        )
      ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              margin: EdgeInsets.only(right: 4, left: 4),
              child: RichText(
                maxLines: 2,
                text: TextSpan(
                  style: TextStyle(color: Colors.grey[800], fontSize: 20),
                  text: donationNameK.length > 10
                      ? "${donationNameK.substring(0, 24)}..."
                      : donationNameK,
                ),
              )),
          RichText(
              maxLines: 2,
              text: TextSpan(style: TextStyle(color: Colors.black), children: [
                TextSpan(
                    text: "نوع التبرع: ",
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 17)),
                TextSpan(
                    text: type,
                    style:
                        TextStyle(fontWeight: FontWeight.w800, fontSize: 18)),
              ])),
          Row(
            children: [
              SizedBox(
                width: 4,
              ),
              Text("الولاية: "),
              Container(
                  child: Text(
                wilaya,
                style: TextStyle(fontWeight: FontWeight.w700),
              )),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 4,
              ),
              Text("المتبرع: "),
              Container(
                  child: Text(
                name.length > 18 ? "${name.substring(0, 10)}..." : name,
                style: TextStyle(fontWeight: FontWeight.w600),
              )),
            ],
          ),
        ],
      ),
    ),
  );
}

// xx() {
//   var donationServices = DonationServices();
//   return StreamBuilder(
//     stream: donationServices.readDonations(),
//     builder: (context, snapshot) {
//       if (snapshot.hasData) {
//         List<DonationModel> donations = [];

//         for (var doc in snapshot.data![0].docs) {
//           var data = doc.data();

//           donations.add(DonationModel(
//               donationName: data[donationName],
//               donationWilaya: data[donationWilaya],
//               donationDescription: data[donationDescription],
//               donationType: data[donationType],
//               donationImage1: data[donationImage1],
//               donationImage2: data[donationImage2],
//               donationImage3: data[donationImage3],
//               donationNumber: data[donationNumber]));
//         }
//         return GridView.builder(
//           itemCount: donations.length,
//           gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//               maxCrossAxisExtent: 200,
//               childAspectRatio: 3 / 2,
//               crossAxisSpacing: 20,
//               mainAxisSpacing: 20),
//           itemBuilder: (context, index) {
//             return containerWidget();
//           },
//         );
//       }
//       return const CircularProgressIndicator(
//         color: Colors.green,
//       );
//     },
//   );
// }
