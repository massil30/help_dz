// ignore_for_file: unnecessary_null_comparison, avoid_print

import 'package:flutter/material.dart';
import 'package:help_dz/services/donationservices.dart';
import 'package:image_picker/image_picker.dart';

class Change extends ChangeNotifier {
  deletImage(List<XFile>? x, index) {
    x!.removeAt(index);

    notifyListeners();
  }

  nullvalue(x) {
    if (x == []) {
      print(x);
    }
  }

  addImage() {}
}
