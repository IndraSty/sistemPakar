import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/rule.dart';

class DiagnosisController extends GetxController {
  RxList<String> gejalaDipilih = <String>[].obs;
  String hasilDiagnosis = "";
  double tingkatKemungkinan = 0;

  void diagnosis() {
    double highestMatchPercentage = 0;
    String selectedDiagnosis = "";

    for (Rule rule in rules) {
      int matchingConditions = 0;
      for (String condition in rule.kondisi!) {
        if (gejalaDipilih.contains(condition)) {
          matchingConditions++;
        }
      }

      double matchPercentage = matchingConditions / rule.kondisi!.length;
      if (matchPercentage > highestMatchPercentage) {
        highestMatchPercentage = matchPercentage;
        selectedDiagnosis = rule.result!;
      }
    }

    if (highestMatchPercentage > 0) {
      hasilDiagnosis = selectedDiagnosis;
    } else {
      hasilDiagnosis = "";
    }
    tingkatKemungkinan = highestMatchPercentage * 100;
  }
}
