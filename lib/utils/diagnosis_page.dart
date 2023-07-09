import 'package:flutter/material.dart';
import 'package:sistempakar/utils/result_page.dart';

import '../app/data/rule.dart';

class DiagnosisPage extends StatefulWidget {
  const DiagnosisPage({super.key});

  @override
  State<DiagnosisPage> createState() => _DiagnosisPageState();
}

class _DiagnosisPageState extends State<DiagnosisPage> {
  List<String> gejalaDipilih = [];
  String diagnosis = "";


  void forwardChaining() {
  double highestMatchPercentage = 0;
  String selectedDiagnosis = "";

  for (Rule rule in rules) {
    int matchingConditions = 0;
    for (Kondisi kondisi in rule.kondisi) {
      if (gejalaDipilih.contains(kondisi.gejala)) {
        matchingConditions++;
      }
    }

    double matchPercentage = matchingConditions / rule.kondisi.length;
    if (matchPercentage > highestMatchPercentage) {
      highestMatchPercentage = matchPercentage;
      selectedDiagnosis = rule.result;
    }
  }

  if (highestMatchPercentage > 0) {
    diagnosis = selectedDiagnosis;
  } else {
    // Tidak ada diagnosis yang cocok dengan gejala yang dipilih
    diagnosis = "Tidak Diketahui";
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Diagnosis Penyakit"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          const Text(
            "Pilih gejala-gejala yang Anda alami",
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: gejala.length,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  title: Text(gejala[index]),
                  value: gejalaDipilih.contains(gejala[index]),
                  onChanged: (value) {
                    setState(() {
                  if (value!) {
                    gejalaDipilih.add(gejala[index]);
                  } else {
                    gejalaDipilih.remove(gejala[index]);
                  }
                });
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              forwardChaining();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(diagnosis: diagnosis),
                ),
              );
            },
            child: const Text("Diagnosa Sekarang"),
          ),
        ],
      ),
    );
  }
}