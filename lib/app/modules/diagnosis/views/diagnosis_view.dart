import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constant.dart';
import '../../../../utils/dialog/hasil_diagnosa.dart';
import '../../../../utils/dialog/hasil_not_match.dart';
import '../../../controllers/auth_controller_controller.dart';
import '../../../data/cf_user.dart';
import '../../../data/rule.dart';
import '../controllers/diagnosis_controller.dart';

class DiagnosisView extends GetView<DiagnosisController> {
  DiagnosisView({Key? key}) : super(key: key);
  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Diagnosis',
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
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Checklist gejala yang anak anda alami dengan benar!",
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Constant.primaryColor1,
              ),
            ),
          ),
          const SizedBox(height: 16),

          StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('rule')
                .doc('gejala')
                .snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data!.data() as Map<String, dynamic>;
                final gejala = List<String>.from(data['gejala']);
                // Gunakan data gejala di sini
                return Expanded(
                  child: ListView.builder(
                    itemCount: gejala.length,
                    itemBuilder: (context, index) {
                      return Obx(
                        () => Column(
                          children: [
                            CheckboxListTile(
                              title: Text(
                                gejala[index],
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                              value: controller.gejalaDipilih
                                  .contains(gejala[index]),
                              onChanged: (value) {
                                if (value!) {
                                  if (controller.gejalaDipilih.length <= 6) {
                                    controller.gejalaDipilih.add(gejala[index]);
                                  }

                                  if (controller.gejalaDipilih.length > 6) {
                                    Fluttertoast.showToast(
                                      msg:
                                          'Anda tidak dapat memilih lebih dari 7 gejala',
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 3,
                                      backgroundColor: Colors.black54,
                                      textColor: Colors.white,
                                      fontSize: 12,
                                    );
                                  }
                                } else {
                                  controller.gejalaDipilih
                                      .remove(gejala[index]);
                                }
                              },
                              activeColor: Constant.primaryColor1,
                            ),
                           
                          ],
                        ),
                      );
                    },
                  ),
                );
              } else {
                return const Text('Loading...');
              }
            },
          ),

          //
          const SizedBox(height: 16),
        ],
      ),
      bottomNavigationBar: Container(
        height: 80,
        width: Get.width,
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
              if (controller.gejalaDipilih.isNotEmpty)
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
                    controller.diagnosis();
                    if (controller.hasilDiagnosis.isNotEmpty) {
                      showDialog(
                        context: context,
                        builder: (context) => HasilDiagnosa(
                          diagnosis: controller.hasilDiagnosis,
                          percentase:
                              '${controller.tingkatKemungkinan.toStringAsFixed(1)}%',
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
              height: Get.height,
              width: Get.width,
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
