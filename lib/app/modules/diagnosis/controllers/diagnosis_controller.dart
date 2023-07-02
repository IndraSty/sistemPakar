import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/rule.dart';

class DiagnosisController extends GetxController {
  RxList<String> gejalaDipilih = <String>[].obs;
  RxString selectedCF = RxString('');
  String hasilDiagnosis = "";
  double tingkatKemungkinan = 0;

  void diagnosis() {
    double highestMatchPercentage = 0;
    String DiagnosisCocok = "";

    for (Rule rule in rules) {
      int kondisiCocok = 0;
      for (Kondisi kondisi in rule.kondisi!) {
        if (gejalaDipilih.contains(kondisi.gejala)) {
          kondisiCocok++;
        }
      }

      double persentaseKecocokan = kondisiCocok / rule.kondisi!.length;
      if (persentaseKecocokan > highestMatchPercentage) {
        highestMatchPercentage = persentaseKecocokan;
        DiagnosisCocok = rule.result!;
      }
    }

    if (highestMatchPercentage > 0) {
      hasilDiagnosis = DiagnosisCocok;
    } else {
      hasilDiagnosis = "";
    }
    tingkatKemungkinan = highestMatchPercentage * 100;
  }

  
}





// void diagnosis() {
//     double highestCF = 0;
//     String selectedDiagnosis = "";

//     for (Rule rule in rules) {
//       int matchingConditions = 0;
//       for (Kondisi kondisi in rule.kondisi!) {
//         if (gejalaDipilih.contains(kondisi.gejala)) {
//           matchingConditions++;
//         }
//       }

//        if (matchingConditions == rule.kondisi!.length) {
//       if (rule.cf! > highestCF) {
//         highestCF = rule.cf!;
//         selectedDiagnosis = rule.result!;
//       }
//     }
//   }
    

//     if (highestCF > 0) {
//       hasilDiagnosis = selectedDiagnosis;
//     } else {
//       hasilDiagnosis = "";
//     }
//     tingkatKemungkinan = highestCF * 100;
//   }