import 'package:flutter/material.dart';
import 'package:help_dz/model/donationModel.dart';
import 'package:help_dz/widgets/login.dart';

class Tabaro3Details extends StatefulWidget {
  static String id = "Tabaro3 Donations";

  const Tabaro3Details({Key? key}) : super(key: key);

  @override
  _Tabaro3DetailsState createState() => _Tabaro3DetailsState();
}

class _Tabaro3DetailsState extends State<Tabaro3Details> {
  var initialindex = 0;
  List? x;
  @override
  Widget build(BuildContext context) {
    DonationModel? donation =
        ModalRoute.of(context)!.settings.arguments as DonationModel?;
    x = [
      donation!.donationImage1,
      donation.donationImage2,
      donation.donationImage3
    ];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color(0xffEDEBEF),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    donation.donationName,
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 3.3,
                    child: Center(
                        child: InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Image.network(x![initialindex]),
                                  );
                                },
                              );
                            },
                            child: Image.network(x![initialindex]))),
                  ),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      if (x![1] == null && x![2] == null) {
                        return SizedBox();
                      }
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                initialindex = 0;
                                print(initialindex);
                              });
                            },
                            child: Container(
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Color(0xffe4ffe3),
                                    border: Border.all(
                                        color: initialindex == 0
                                            ? Colors.lightGreen
                                            : Colors.white,
                                        width: 5),
                                    borderRadius: BorderRadius.circular(10)),
                                width: 80,
                                height: 80,
                                child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(x![0]))),
                                  margin: EdgeInsets.all(2.5),
                                )),
                          ),
                          donation.donationImage2 == null
                              ? SizedBox()
                              : GestureDetector(
                                  onTap: () {
                                    print(initialindex);
                                    setState(() {
                                      initialindex = 1;
                                      print(initialindex);
                                    });
                                  },
                                  child: Container(
                                      margin: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          color: Color(0xffe4ffe3),
                                          border: Border.all(
                                              color: initialindex == 1
                                                  ? Colors.lightGreen
                                                  : Colors.white,
                                              width: 5),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      width: 80,
                                      height: 80,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(x![1])),
                                        ),
                                        margin: EdgeInsets.all(4),
                                      )),
                                ),
                          donation.donationImage3 == null
                              ? Container()
                              : Container(
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: Color(0xffe4ffe3),
                                      border: Border.all(
                                          color: initialindex == 0
                                              ? Colors.lightGreen
                                              : Colors.white,
                                          width: 5),
                                      borderRadius: BorderRadius.circular(10)),
                                  height: 80,
                                  width: 80,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(x![2]))),
                                    margin: EdgeInsets.all(10),
                                  ))
                        ],
                      );
                    },
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 5),
                    alignment: Alignment.centerRight,
                    child: Text("الوصف :",
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(right: 5, left: 5),
                    child: Text(
                      donation.donationDescription,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 4,
                      ),
                      Icon(
                        Icons.list,
                        color: Colors.green,
                      ),
                      Text(
                        " صنف التبرع: ",
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      Text(
                        donation.donationType,
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 4,
                      ),
                      Icon(Icons.location_on),
                      Text(
                        " الولاية: ",
                      ),
                      Text(donation.donationWilaya)
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 4,
                      ),
                      Icon(Icons.people),
                      Text(
                        " المتبرع: ",
                      ),
                      Text("Massil Attaf")
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 4,
                      ),
                      Icon(Icons.phone),
                      Text(
                        " رقم الهاتف: ",
                      ),
                      Text(donation.donationNumber)
                    ],
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: 50,
                margin: EdgeInsets.only(left: 15, right: 15, bottom: 20),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.lightGreen, Colors.green]),
                    borderRadius: BorderRadius.circular(10)),
                width: double.infinity,
                child: Center(
                  child: Text(" تبرع لي",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

pr() {
  print("Nice Details");
}
