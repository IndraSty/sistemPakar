import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/cf_user.dart';
import '../../../data/rule.dart';

class DiagnosisController extends GetxController {
  RxList<String> gejalaDipilih = <String>[].obs;
  RxList<Rx<CFUser?>> selectedCF = RxList<Rx<CFUser?>>();
  String hasilDiagnosis = "";
  double tingkatKemungkinan = 0;

  void diagnosis() {
    int highestkondisiCocok = 0;
    for (Rule rule in rules) {
      int kondisiCocok = 0;
      for (Kondisi kondisi in rule.kondisi) {
        if (gejalaDipilih.contains(kondisi.gejala)) {
          kondisiCocok++;
        }
      }

      double matchPercentage = kondisiCocok / rule.kondisi.length * 100;
      if (kondisiCocok > highestkondisiCocok) {
        highestkondisiCocok = kondisiCocok;
        hasilDiagnosis = rule.result;
        tingkatKemungkinan = matchPercentage;
        if (matchPercentage == 100) {
          tingkatKemungkinan = 97;
        }
      }
    }

    if (highestkondisiCocok > 0) {
      hasilDiagnosis;
    } else {
      hasilDiagnosis = "";
      tingkatKemungkinan = 0;
    }
  }

  @override
  void onInit() {
    super.onInit();
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


// for (Rule rule in rules) {
//       int kondisiCocok = 0;
//       double cfRule = 1.0;

//       for (Kondisi kondisi in rule.kondisi!) {
//         if (gejalaDipilih.contains(kondisi.gejala)) {
//           kondisiCocok++;

//           CFUser? selectedCFUser;
//           int selectedCFUserIndex = gejala.indexOf(kondisi.gejala);
//           if (selectedCFUserIndex >= 0) {
//             selectedCFUser = selectedCF[selectedCFUserIndex].value;
//           }

//           if (selectedCFUser != null) {
//             double userCF = getUserCF(
//                 selectedCFUser); // Fungsi untuk mendapatkan nilai CF dari user
//             hasilCF *= userCF * selectedCFUser.cf! * kondisi.bobot;
//           }
//         }
//       }

//       double cfKombinasi = hasilCF * (kondisiCocok / rule.kondisi!.length);

//       if (cfKombinasi > hasilCF) {
//         hasilCF = cfKombinasi;
//         diagnosisCocok = rule.result!;
//       }
//     }

//     if (hasilCF > 0) {
//       hasilDiagnosis = diagnosisCocok;
//     } else {
//       hasilDiagnosis = "";
//     }
//     tingkatKemungkinan = hasilCF * 100;