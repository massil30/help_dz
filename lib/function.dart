import 'package:help_dz/model/donationModel.dart';
import 'package:help_dz/model/usermodel.dart';

List<DonationModel> getByWilaya(
    String wilaya, List<DonationModel> allDonations) {
  List<DonationModel> donations = [];
  try {
    for (var donation in allDonations) {
      if (donation.donationWilaya == wilaya) {
        donations.add(donation);
      }
    }
  } on Error catch (ex) {
    print(ex);
  }
  return donations;
}

List<DonationModel> getByType(String type, List<DonationModel> allDonations) {
  List<DonationModel> donations = [];
  try {
    for (var donation in allDonations) {
      if (donation.donationType == type) {
        donations.add(donation);
      }
    }
  } on Error catch (ex) {
    print(ex);
  }
  return donations;
}

List<DonationModel> getByTypeAndWilaya(
    String type, String wilaya, List<DonationModel> allDonations) {
  List<DonationModel> donations = [];
  try {
    for (var donation in allDonations) {
      if (donation.donationType == type && donation.donationWilaya == wilaya) {
        donations.add(donation);
      }
    }
  } on Error catch (ex) {
    print(ex);
  }
  return donations;
}

List<DonationModel> getByName(String name, List<DonationModel> allDonations) {
  List<DonationModel> donations = [];
  try {
    for (var donation in allDonations) {
      if (donation.name == name) {
        donations.add(donation);
      }
    }
  } on Error catch (ex) {
    print(ex);
  }
  return donations;
}

List<UserModel> getUsertByName(String name, List<UserModel> alluser) {
  List<UserModel> user = [];
  try {
    for (var donation in alluser) {
      if (donation.name == name) {
        user.add(donation);
      }
    }
  } on Error catch (ex) {
    print(ex);
  }
  return user;
}

List<UserModel> getUsertByNameAndMethode(
    String name, methode, List<UserModel> alluser) {
  List<UserModel> user = [];
  try {
    for (var donation in alluser) {
      if (donation.name == name && donation.methode == methode) {
        user.add(donation);
      }
    }
  } on Error catch (ex) {
    print(ex);
  }
  return user;
}
