import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:help_dz/constant.dart';

class UserServices {
  FirebaseFirestore firebasefirestore = FirebaseFirestore.instance;
  addUser(name, methode) async {
    firebasefirestore.collection("Users").add({
      "Name": name,
      "Method": methode,
    });
  }

  readUser() {
    return firebasefirestore.collection("Users").snapshots();
  }

  Future<bool> facebookCheck(nameK) async {
    var result = await firebasefirestore
        .collection("Users")
        .where("Name", isEqualTo: nameK)
        .where("Methode", isEqualTo: "Facebook")
        .get();
    return result.docs.isEmpty;
  }

  Future<bool> gmailCheck(nameK) async {
    var result = await firebasefirestore
        .collection("Users")
        .where(
          name,
          isEqualTo: nameK,
        )
        .get();
    return result.docs.isEmpty;
  }
}
