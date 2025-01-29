import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:help_dz/data/change.dart';
import 'package:help_dz/model/donationModel.dart';
import 'package:help_dz/pages/HomePages/home.dart';
import 'package:help_dz/services/donationservices.dart';
import 'package:help_dz/signIn/signinservices.dart';
import 'package:path/path.dart' as p;
import 'package:flutter/material.dart';
import 'package:help_dz/constant.dart';
import 'package:help_dz/data/wilaya.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:provider/provider.dart';

class AddNeeds extends StatefulWidget {
  const AddNeeds({Key? key}) : super(key: key);

  @override
  _AddNeedsState createState() => _AddNeedsState();
}

class _AddNeedsState extends State<AddNeeds> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  List<XFile>? x;
  var name, type, wilaya, description, number, image1, image2, image3;
  var miss;
  File? file;
  Future addImages(x, uUrl) async {
    firebase_storage.FirebaseStorage storage =
        firebase_storage.FirebaseStorage.instanceFor(
            bucket: 'gs://helpdz.appspot.com');
    firebase_storage.Reference ref =
        firebase_storage.FirebaseStorage.instance.ref(x.path);
    firebase_storage.UploadTask storageUploadTask = ref.putFile(x);
    firebase_storage.TaskSnapshot taskSnapshot =
        await storageUploadTask.snapshot;
    String url = await taskSnapshot.ref.getDownloadURL();
    setState(() {
      uUrl = url;
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Change>(context);

    return Form(
      key: _globalKey,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 5, right: 25, left: 25),
                  child: TextFormField(
                    maxLength: 50,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "لا يمكن أن يكون العنوان فارغًا";
                      }
                    },
                    onChanged: (val) {
                      name = val;
                    },
                    style: TextStyle(color: Colors.black),
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                      hintText: "عنوان الشيء الذي ستتبرع به",
                      labelStyle: TextStyle(color: Colors.black),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 3.5),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 3.5),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 3.5),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 15, left: 15),
                  child: TextFormField(
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "لا يمكن أن يكون الوصف فارغًا";
                      }
                    },
                    onChanged: (val) {
                      description = val;
                    },
                    maxLength: 150,
                    style: TextStyle(color: Colors.black),
                    cursorColor: Colors.green,
                    maxLines: 3,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      hintText: "الوصف",
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 3.5),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 3.5),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 3.5),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  child: TextFormField(
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "لا يمكن أن يكون رقم الهاتف فارغًا";
                      }
                    },
                    onChanged: (val) {
                      number = val;
                    },
                    style: TextStyle(color: Colors.black),
                    cursorColor: Colors.green,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      hintText: "رقم الهاتف",
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 3.5),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 3.5),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 3.5),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                DropdownButtonFormField<String>(
                  value: wilaya,
                  hint: Text(
                    'الولاية',
                  ),
                  onChanged: (val) {
                    wilaya = val;
                  },
                  validator: (value) => value == null ? 'اختر ولايتك' : null,
                  items: algeriaWilayas
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                DropdownButtonFormField<String>(
                  value: type,
                  hint: Text(
                    'صنف الاحتياج',
                  ),
                  onChanged: (val) => type = val,
                  validator: (value) =>
                      value == null ? 'الرجاء اختيار صنف الاحتياج' : null,
                  items: donation.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    setState(() async {
                      final ImagePicker _picker = ImagePicker();
                      x = await _picker.pickMultiImage();
                      if (x != null) {
                        setState(() {});
                      }
                    });
                  },
                  child: Container(
                    height: 80,
                    color: Colors.grey[300],
                    width: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("اضافة صورة"),
                        Icon(Icons.camera_enhance)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                LayoutBuilder(
                  builder: (context, constraints) {
                    if (x != null) {
                      return Container(
                        color: Colors.lightGreenAccent,
                        height: 100,
                        width: double.infinity,
                        child: ListView.builder(
                          itemCount: x!.length < 3 ? x!.length : 3,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            file = File(x![index].path);

                            return Stack(
                              children: [
                                InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          content: Container(
                                              height: 500,
                                              width: 300,
                                              child: Hero(
                                                  tag: file.toString(),
                                                  child: Image.file(file!))),
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                      height: 80,
                                      color: Color(0xffc2ffd2),
                                      width: 120,
                                      child: Hero(
                                          tag: file.toString(),
                                          child: Image.file(file!))),
                                ),
                                InkWell(
                                  onTap: () {
                                    provider.deletImage(x, index);
                                    if (x!.isEmpty) {
                                      setState(() {
                                        x = null;
                                      });
                                    }
                                  },
                                  child: Container(
                                      alignment: Alignment.topRight,
                                      child: Icon(
                                        Icons.delete,
                                        size: 35,
                                        color: Colors.red,
                                      )),
                                ),
                              ],
                            );
                          },
                        ),
                      );
                    }
                    return SizedBox();
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  miss == null ? "" : miss,
                  style: TextStyle(color: Colors.red),
                ),
                InkWell(
                  onTap: () async {
                    print('${number} $name, $description,$wilaya,$type}');
                    if (_globalKey.currentState!.validate()) {
                      _globalKey.currentState!.save();

                      DonationServices donation = DonationServices();

                      if (x == null) {
                        setState(() {
                          miss = "الرجاء اضافة صورة";
                        });
                      } else {
                        setState(() {
                          miss = "";
                          print("kayn awdi");
                        });
                        if (x!.length == 1) {
                          print("kayn 1");
                          facebookLogin(context);
                          firebase_storage.FirebaseStorage storage =
                              firebase_storage.FirebaseStorage.instanceFor(
                                  bucket: 'gs://helpdz.appspot.com');
                          firebase_storage.Reference ref = firebase_storage
                              .FirebaseStorage.instance
                              .ref(File(x![0].path).path);
                          firebase_storage.UploadTask storageUploadTask =
                              ref.putFile(File(x![0].path));
                          firebase_storage.TaskSnapshot taskSnapshot =
                              await storageUploadTask.snapshot;
                          String url = await taskSnapshot.ref.getDownloadURL();
                          setState(() {
                            image1 = url;
                            print(image1);
                          });
                          donation.addNeedsService(DonationModel(
                              donationName: name,
                              donationWilaya: wilaya,
                              donationDescription: description,
                              name: "Massil",
                              donationType: type,
                              donationImage1: image1,
                              donationNumber: number));
                        } else if (x!.length == 2) {
                          firebase_storage.FirebaseStorage storage =
                              firebase_storage.FirebaseStorage.instanceFor(
                                  bucket: 'gs://helpdz.appspot.com');
                          firebase_storage.Reference ref = firebase_storage
                              .FirebaseStorage.instance
                              .ref(File(x![0].path).path);
                          firebase_storage.UploadTask storageUploadTask =
                              ref.putFile(File(x![0].path));
                          firebase_storage.TaskSnapshot taskSnapshot =
                              await storageUploadTask.snapshot;
                          String url = await taskSnapshot.ref.getDownloadURL();
                          setState(() {
                            image1 = url;
                            print(image1);
                          });
                          firebase_storage.Reference ref2 = firebase_storage
                              .FirebaseStorage.instance
                              .ref(File(x![1].path).path);
                          firebase_storage.UploadTask storageUploadTask2 =
                              ref2.putFile(File(x![1].path));
                          firebase_storage.TaskSnapshot taskSnapshot2 =
                              await storageUploadTask2.snapshot;
                          String url2 =
                              await taskSnapshot2.ref.getDownloadURL();
                          setState(() {
                            image2 = url2;
                            print(image2);
                          });

                          donation.addNeedsService(DonationModel(
                              donationName: name,
                              donationWilaya: wilaya,
                              donationDescription: description,
                              donationType: type,
                              name: "Massil",
                              donationImage1: image1,
                              donationImage2: image2,
                              donationNumber: number));
                        } else if (x!.length == 3) {
                          firebase_storage.FirebaseStorage storage =
                              firebase_storage.FirebaseStorage.instanceFor(
                                  bucket: 'gs://helpdz.appspot.com');
                          firebase_storage.Reference ref = firebase_storage
                              .FirebaseStorage.instance
                              .ref(File(x![0].path).path);
                          firebase_storage.UploadTask storageUploadTask =
                              ref.putFile(File(x![0].path));
                          firebase_storage.TaskSnapshot taskSnapshot =
                              await storageUploadTask.snapshot;
                          String url = await taskSnapshot.ref.getDownloadURL();
                          setState(() {
                            image1 = url;
                            print(image1);
                          });
                          donation.addNeedsService(DonationModel(
                              donationName: name,
                              donationWilaya: wilaya,
                              donationDescription: description,
                              name: "Massil",
                              donationType: type,
                              donationImage1: image1,
                              donationNumber: number));
                        } else if (x!.length == 2) {
                          firebase_storage.FirebaseStorage storage =
                              firebase_storage.FirebaseStorage.instanceFor(
                                  bucket: 'gs://helpdz.appspot.com');
                          firebase_storage.Reference ref = firebase_storage
                              .FirebaseStorage.instance
                              .ref(File(x![2].path).path);
                          firebase_storage.UploadTask storageUploadTask =
                              ref.putFile(File(x![2].path));
                          firebase_storage.TaskSnapshot taskSnapshot =
                              await storageUploadTask.snapshot;
                          String url = await taskSnapshot.ref.getDownloadURL();
                          setState(() {
                            image1 = url;
                            print(image1);
                          });
                          firebase_storage.Reference ref2 = firebase_storage
                              .FirebaseStorage.instance
                              .ref(File(x![1].path).path);
                          firebase_storage.UploadTask storageUploadTask2 =
                              ref2.putFile(File(x![1].path));
                          firebase_storage.TaskSnapshot taskSnapshot2 =
                              await storageUploadTask2.snapshot;
                          String url2 =
                              await taskSnapshot2.ref.getDownloadURL();
                          setState(() {
                            image2 = url2;
                            print(image2);
                          });
                          firebase_storage.Reference ref3 = firebase_storage
                              .FirebaseStorage.instance
                              .ref(File(x![1].path).path);
                          firebase_storage.UploadTask storageUploadTask3 =
                              ref3.putFile(File(x![1].path));
                          firebase_storage.TaskSnapshot taskSnapshot3 =
                              await storageUploadTask3.snapshot;
                          String url3 =
                              await taskSnapshot3.ref.getDownloadURL();
                          setState(() {
                            image3 = url3;
                            print(image3);
                          });

                          donation.addNeedsService(DonationModel(
                              donationName: name,
                              donationWilaya: wilaya,
                              donationDescription: description,
                              donationType: type,
                              donationImage1: image1,
                              donationImage2: image2,
                              donationImage3: image3,
                              name: "Massil",
                              donationNumber: number));
                        }
                      }
                    }
                    image1 != null
                        ? Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return Home();
                            },
                          ))
                        : showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.green,
                                  ),
                                ),
                              );
                            },
                          );
                  },
                  child: Container(
                    height: 52,
                    decoration: BoxDecoration(
                        gradient: backgroundColors,
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8)),
                    margin: EdgeInsets.only(right: 20, left: 20, bottom: 5),
                    child: Center(
                      child: Text(
                        "اضافة احتياج",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
