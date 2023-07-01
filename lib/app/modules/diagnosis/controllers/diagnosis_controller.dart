import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/rule.dart';

class DiagnosisController extends GetxController {
  RxList<String> gejalaDipilih = <String>[].obs;
  String diagnosis = "";
  double tingkatKemungkinan = 0;

  void forwardChaining() {
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
      diagnosis = selectedDiagnosis;
    } else {
      // Tidak ada diagnosis yang cocok dengan gejala yang dipilih
      diagnosis = "Tidak Diketahui";
    }
    tingkatKemungkinan = highestMatchPercentage * 100;
  }
}
