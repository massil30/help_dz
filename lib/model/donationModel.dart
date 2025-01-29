class DonationModel {
  var donationName;
  var donationWilaya;
  var donationDescription;
  var donationType;
  var donationImage1;
  var name;
  var donationImage2;
  var donationImage3;
  var donationUser;
  var donationUserMethode;

  var donationNumber;
  DonationModel({
    required this.donationName,
    this.name,
    required this.donationWilaya,
    required this.donationDescription,
    required this.donationType,
    required this.donationImage1,
    this.donationImage2,
    this.donationImage3,
    required this.donationNumber,
  });
}
