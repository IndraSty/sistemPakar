import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:sistempakar/utils/penyakit/daftar_penyakit_page.dart';

import '../../app/modules/diagnosis/controllers/diagnosis_controller.dart';
import '../../app/routes/app_pages.dart';
import '../../constant.dart';

class HasilDiagnosa extends StatelessWidget {
  const HasilDiagnosa(
      {super.key, required this.diagnosis, required this.percentase});
  final String diagnosis;
  final String percentase;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [
          CardDialog(
            diagnosis: diagnosis,
            percentase: percentase,
          ),
        ],
      ),
    );
  }
}

class CardDialog extends StatelessWidget {
  CardDialog({
    super.key,
    required this.diagnosis,
    required this.percentase,
  });
  late String diagnosis;
  late String percentase;
  final diagnosController = Get.find<DiagnosisController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 16,
      ),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: const Color(0xffFFFFFF),
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 24,
          ),
          Text(
            "Hasil Diagnosis",
            style: GoogleFonts.montserrat(
                fontSize: 16,
                color: Constant.primaryColor1,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          RichText(
            text: TextSpan(
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: Colors.black,
              ),
              children: <TextSpan>[
                const TextSpan(
                  text:
                      "Berdasarkan Gejala yang anda pilih, anak anda mengalami ",
                ),
                TextSpan(
                  text: '$diagnosis ',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const TextSpan(
                  text: 'dengan Persentase: ',
                ),
                TextSpan(
                  text: percentase,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Klik detail untuk melihat detail dari penyakit anak anda serta cara pengobatannya.',
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: Colors.black,
            ),
          ),
       
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
                  foregroundColor: Constant.primaryColor1,
                  side: const BorderSide(
                    color: Constant.primaryColor1,
                  ),
                ),
                onPressed: () {
                  diagnosController.hasilDiagnosis = '';
                  Get.back();
                },
                child: const Text('Ulang'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Constant.primaryColor1,
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
                ),
                onPressed: () {
                  if (diagnosis == 'Diare') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DaftarPenyakitPageView(
                                  initialIndex: 0,
                                )));
                  } else if (diagnosis == 'Asma') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DaftarPenyakitPageView(
                                  initialIndex: 1,
                                )));
                  } else if (diagnosis == 'Cacingan') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DaftarPenyakitPageView(
                                  initialIndex: 2,
                                )));
                  }
                },
                child: const Text("Detail"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
