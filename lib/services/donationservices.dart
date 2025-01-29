import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:help_dz/constant.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as p;
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'package:help_dz/model/donationModel.dart';

class DonationServices {
  FirebaseFirestore firebasefirestore = FirebaseFirestore.instance;

  addDonationService(DonationModel donation) {
    firebasefirestore.collection("Donations").add({
      donationName: donation.donationName,
      donationDescription: donation.donationDescription,
      donationType: donation.donationType,
      donationNumber: donation.donationNumber,
      donationWilaya: donation.donationWilaya,
      donationImage1: donation.donationImage1,
      donationImage2: donation.donationImage2,
      donationImage3: donation.donationImage3,
    });
  }

  addNeedsService(DonationModel donation) {
    firebasefirestore.collection("Needs").add({
      donationName: donation.donationName,
      donationDescription: donation.donationDescription,
      donationType: donation.donationType,
      donationNumber: donation.donationNumber,
      donationWilaya: donation.donationWilaya,
      donationImage1: donation.donationImage1,
      donationImage2: donation.donationImage2,
      donationImage3: donation.donationImage3,
      name: donation.name
    });
  }

  readDonations() {
    return firebasefirestore.collection("Donations").snapshots();
  }

  readNeeds() {
    return firebasefirestore.collection("Needs").snapshots();
  }
}
