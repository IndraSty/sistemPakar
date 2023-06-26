import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/rule.dart';

class DiagnosisController extends GetxController {
  RxList<String> gejalaDipilih = <String>[].obs;
  String diagnosis = "";

  void toggleSymptom(String gejala, bool? value) {
    if (value!) {
      gejalaDipilih.add(gejala);
    } else {
      gejalaDipilih.remove(gejala);
    }
  }

  void forwardChaining() {
    for (Rule rule in rules) {
      bool match = true;
      for (String kondisi in rule.kondisi!) {
        if (!gejalaDipilih.contains(kondisi)) {
          match = false;
          break;
        }
      }
      if (match) {
        diagnosis = rule.result!;
        break;
      }
    }
  }
}
