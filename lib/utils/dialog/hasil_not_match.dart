import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:sistempakar/utils/penyakit/daftar_penyakit_page.dart';

import '../../app/routes/app_pages.dart';
import '../../constant.dart';

class HasilDiagnosaNotMatch extends StatelessWidget {
  const HasilDiagnosaNotMatch({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [
          CardDialog(),
        ],
      ),
    );
  }
}

class CardDialog extends StatelessWidget {
  CardDialog({
    super.key,
  });

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
         
          Text(
            "Hasil Diagnosis",
            style: GoogleFonts.montserrat(
                fontSize: 16,
                color: Constant.primaryColor1,
                fontWeight: FontWeight.bold),
          ),
         
          
          const SizedBox(
            height: 30,
          ),
          Text(
            'Mohon Masukkan Gejala anak anda dengan benar dan sesuai!.',
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Silahkan klik ulangi untuk mengulang Diagnosa',
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              height: 38,
              width: size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Constant.primaryColor1, width: 1),
              ),
              child: Center(
                child: Text(
                  'Ulangi',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Constant.primaryColor1,
                  ),
                ),
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
