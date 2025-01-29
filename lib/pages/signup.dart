import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:help_dz/constant.dart';
// import 'package:help_dz/pages/login.dart';

// class SignUp extends StatefulWidget {
//   const SignUp({Key? key}) : super(key: key);

//   @override
//   _SignUpState createState() => _SignUpState();
// }

// class _SignUpState extends State<SignUp> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Directionality(
//       textDirection: TextDirection.rtl,
//       child: Container(
//           height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           decoration: BoxDecoration(gradient: backgroundColors),
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 InkWell(
//                   onTap: () => Navigator.of(context).pop(),
//                   child: Container(
//                       margin: EdgeInsets.only(
//                         top: 20,
//                         right: 20,
//                       ),
//                       alignment: Alignment.topRight,
//                       child: Icon(
//                         Icons.arrow_back_ios,
//                         size: 30,
//                         color: Colors.white,
//                       )),
//                 ),
//                 Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SizedBox(
//                         height: 40,
//                       ),
//                       Container(
//                         margin: EdgeInsets.only(right: 20, bottom: 30),
//                         alignment: Alignment.centerRight,
//                         child: Text(
//                           "انشاء حساب ",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 35,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.only(right: 20, left: 20),
//                         child: TextField(
//                           style: TextStyle(color: Colors.white),
//                           cursorColor: Colors.white,
//                           decoration: InputDecoration(
//                             labelStyle: TextStyle(color: Colors.grey[200]),
//                             labelText: "رقم الهاتف",
//                             enabledBorder: UnderlineInputBorder(
//                               borderSide:
//                                   BorderSide(color: Colors.white, width: 3.5),
//                             ),
//                             focusedBorder: UnderlineInputBorder(
//                               borderSide:
//                                   BorderSide(color: Colors.white, width: 3.5),
//                             ),
//                             border: UnderlineInputBorder(
//                               borderSide:
//                                   BorderSide(color: Colors.white, width: 3.5),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Container(
//                         margin: EdgeInsets.only(right: 20, left: 20),
//                         child: TextField(
//                           style: TextStyle(color: Colors.white),
//                           cursorColor: Colors.white,
//                           decoration: InputDecoration(
//                             labelStyle: TextStyle(color: Colors.grey[200]),
//                             labelText: "كلمة السر",
//                             enabledBorder: UnderlineInputBorder(
//                               borderSide:
//                                   BorderSide(color: Colors.white, width: 3.5),
//                             ),
//                             focusedBorder: UnderlineInputBorder(
//                               borderSide:
//                                   BorderSide(color: Colors.white, width: 3.5),
//                             ),
//                             border: UnderlineInputBorder(
//                               borderSide:
//                                   BorderSide(color: Colors.white, width: 3.5),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Container(
//                         height: 52,
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(8)),
//                         margin: EdgeInsets.only(right: 20, left: 20),
//                         child: Center(
//                           child: Text(
//                             "انشاء حساب",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 20),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 20),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text("لديك حساب مسبقا؟",
//                               style: TextStyle(
//                                 color: Colors.grey[300],
//                               )),
//                           InkWell(
//                             onTap: () {
//                               Navigator.of(context).push(MaterialPageRoute(
//                                 builder: (context) {
//                                   return Login();
//                                 },
//                               ));
//                             },
//                             child: Text("سجل الدخول من هنا",
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 18)),
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           )),
//     ));
//   }
// }
