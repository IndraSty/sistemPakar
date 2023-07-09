import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../app/data/data_penyakit.dart';
import '../../../constant.dart';

class AsmaPageView extends StatelessWidget {
  AsmaPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('daftarPenyakit')
                .doc('P02')
                .snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const Text('Loading...');
              }
              final data = snapshot.data!.data() as Map<String, dynamic>;

              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Apa Itu Asma?",
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Constant.primaryColor1,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    data["deskripsiPenyakit"],
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Penyebab dan Gejala Asma",
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Constant.primaryColor1,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    data["penyebabPenyakit"],
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  StreamBuilder<DocumentSnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('rule')
                          .doc('asma')
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<DocumentSnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return Text("Loading..");
                        }
                        final data =
                            snapshot.data!.data() as Map<String, dynamic>;
                        final kondisi = List<String>.from(data['kondisi']);
                        return Container(
                          width: width,
                          height: 110,
                          child: ListView.builder(
                            itemCount: kondisi.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Row(
                                children: [
                                  const Icon(Icons.circle, size: 5),
                                  const SizedBox(width: 5),
                                  Text(
                                    kondisi[index],
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              );
                            },
                            physics: const NeverScrollableScrollPhysics(),
                          ),
                        );
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Pengobatan dan Pencegahan Asma",
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Constant.primaryColor1,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    data["pengobatanPenyakit"],
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Container(
                    width: width,
                    height: 110,
                    child: ListView.builder(
                      itemCount: pencegahanAsma.length,
                      itemBuilder: (context, index) {
                        return Expanded(
                          child: Text(
                            pencegahanAsma[index],
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Colors.black87,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }

  final List<String> pencegahanAsma = [
    "1. Mengenali & menghindari pemicu asma.",
    "2. Mengikuti anjuran rencana penanganan asma dari dokter.",
    "3. Melakukan langkah pengobatan yang tepat dengan mengenali penyebab serangan asma.",
    "4. Menggunakan obat-obatan asma yang telah dianjurkan oleh dokter secara teratur.",
    "5. Memonitor kondisi saluran napas",
  ];
}
