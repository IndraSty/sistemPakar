import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../app/data/data_penyakit.dart';
import '../../../constant.dart';

class AsmaPageView extends StatelessWidget {
  const AsmaPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final DataPenyakit dataPenyakit = daftarPenyakit[0];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Text(
            "Apa Itu Asma?",
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Constant.primaryColor1,
            ),
          ),
          const SizedBox(height: 20,),
          Text(
            dataPenyakit.deskripsiPenyakit,
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
