import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../app/data/cf_user.dart';
import '../../app/data/rule.dart';
import 'package:collection/collection.dart';

import '../../constant.dart';
import '../dialog/hasil_not_match.dart';
import 'hasil_diagnosa_cf.dart';

class CFDiagnosisView extends StatefulWidget {
  const CFDiagnosisView({super.key});

  @override
  State<CFDiagnosisView> createState() => _CFDiagnosisViewState();
}

class _CFDiagnosisViewState extends State<CFDiagnosisView> {
  List<String> gejalaDipilih = [];
  Map<String, String> selectedKeyakinan = {};
  String hasilDiagnosa = '';
  double cfValue = 0;
  double nilaiCF = 0;

  void onGejalaSelected(String gejala, bool isSelected) {
    setState(() {
      if (isSelected) {
        gejalaDipilih.add(gejala);
        if (!selectedKeyakinan.containsKey(gejala)) {
          selectedKeyakinan[gejala] = 'Tidak Yakin';
        }
      } else {
        gejalaDipilih.remove(gejala);
        selectedKeyakinan.remove(gejala);
      }
    });
  }

  void onKeyakinanSelected(String gejala, String keyakinan) {
    setState(() {
      selectedKeyakinan[gejala] = keyakinan;
    });
  }

  void submitDiagnosa() {
    double cfResult = 0.0;
    Rule? selectedRule = rules.firstWhereOrNull((rule) {
      return gejalaDipilih.every((gejala) {
        return rule.kondisi.any((kondisi) => kondisi.gejala == gejala);
      });
    });

    if (selectedRule!.id.isNotEmpty) {
      // Hitung nilai CF untuk setiap gejala yang dipilih
      for (String gejala in gejalaDipilih) {
        Kondisi selectedKondisi = selectedRule.kondisi
            .firstWhere((kondisi) => kondisi.gejala == gejala);

        CFUser? selectedCfUser = selectedKondisi.userCf.firstWhereOrNull(
            (cfUser) => cfUser.title == selectedKeyakinan[gejala]);

        double penggunaCF = selectedCfUser != null ? selectedCfUser.cf : 0;
        double bobot = selectedKondisi.bobot;

        double cf = bobot * penggunaCF;
        cfResult = cfCombine(cfResult, cf);
      }

      hasilDiagnosa = selectedRule.result;
      nilaiCF = cfResult;
      cfValue = cfResult * 100;
    }
  }

  double cfCombine(double cf1, double cf2) {
    return cf1 + cf2 * (1 - cf1);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Diagnosa CF',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black87,
            size: 18,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Text(
              "Checklist gejala yang anak anda alami dengan benar!",
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Constant.primaryColor1,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: gejala.length,
              itemBuilder: (context, index) {
                String gejalaItem = gejala[index];
                String selectedKeyakinanValue =
                    selectedKeyakinan[gejalaItem] ?? 'Tidak Yakin';

                Rule selectedRule = rules.firstWhere(
                  (rule) => rule.kondisi
                      .any((kondisi) => kondisi.gejala == gejalaItem),
                  orElse: () => Rule(id: '', name: '', kondisi: [], result: ''),
                );

                return Column(
                  children: [
                    CheckboxListTile(
                      title: Text(gejalaItem),
                      value: gejalaDipilih.contains(gejalaItem),
                      onChanged: (bool? value) {
                        onGejalaSelected(gejalaItem, value ?? false);
                      },
                    ),
                    if (gejalaDipilih.contains(gejalaItem))
                      Column(
                        children: selectedRule.kondisi
                            .where((kondisi) => kondisi.gejala == gejalaItem)
                            .expand((kondisi) => kondisi.userCf.map((userCf) {
                                  return RadioListTile(
                                    title: Text(userCf.title),
                                    value: userCf.title,
                                    groupValue: selectedKeyakinanValue,
                                    onChanged: (value) {
                                      onKeyakinanSelected(
                                          gejalaItem, value.toString());
                                    },
                                  );
                                }))
                            .toList(),
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 80,
        width: width,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
          child: GestureDetector(
            onTap: () => {
              if (gejalaDipilih.isNotEmpty)
                {
                  showDialog(
                    context: context,
                    builder: (context) => const Center(
                      child: CircularProgressIndicator(
                        color: Constant.primaryColor2,
                        backgroundColor: Colors.blueGrey,
                      ),
                    ),
                  ),
                  Future.delayed(const Duration(seconds: 2), () {
                    Navigator.of(context).pop();
                    submitDiagnosa();
                    if (hasilDiagnosa.isNotEmpty) {
                      showDialog(
                        context: context,
                        builder: (context) => HasilDiagnosaCF(
                          diagnosis: hasilDiagnosa,
                          percentase: '${cfValue.toStringAsFixed(1)}%',
                          hasilCf: '${nilaiCF.toStringAsFixed(3)} ',
                          hasilDiag: hasilDiagnosa,
                        ),
                      );
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) => const HasilDiagnosaNotMatch());
                    }
                  }),
                }
              else
                {
                  Fluttertoast.showToast(
                    msg: 'Checklist Gejala terlebih dahulu',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 3,
                    backgroundColor: Colors.black54,
                    textColor: Colors.white,
                    fontSize: 12,
                  ),
                }
            },
            child: Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                  gradient: Constant.gradientBtn,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  'Diagnosa Sekarang',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
