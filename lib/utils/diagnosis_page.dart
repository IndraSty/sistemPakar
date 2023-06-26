import 'package:flutter/material.dart';
import 'package:sistempakar/utils/result_page.dart';

import '../app/data/rule.dart';

class DiagnosisPage extends StatefulWidget {
  const DiagnosisPage({super.key});

  @override
  State<DiagnosisPage> createState() => _DiagnosisPageState();
}

class _DiagnosisPageState extends State<DiagnosisPage> {
  List<String> selectedSymptoms = [];
  String diagnosis = "";


  void forwardChaining() {
    for (Rule rule in rules) {
      bool match = true;
      for (String condition in rule.kondisi!) {
        if (!selectedSymptoms.contains(condition)) {
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
                  value: selectedSymptoms.contains(gejala[index]),
                  onChanged: (value) {
                    setState(() {
                  if (value!) {
                    selectedSymptoms.add(gejala[index]);
                  } else {
                    selectedSymptoms.remove(gejala[index]);
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