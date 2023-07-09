import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sistempakar/utils/penyakit/tabBar/asma_page_view.dart';
import 'package:sistempakar/utils/penyakit/tabBar/cacingan_page_view.dart';
import 'package:sistempakar/utils/penyakit/tabBar/diare_page_view.dart';

import '../../app/data/data_penyakit.dart';
import '../../app/routes/app_pages.dart';
import '../../constant.dart';

class DaftarPenyakitPageView extends StatefulWidget {
  const DaftarPenyakitPageView({super.key, required this.initialIndex});
  final int initialIndex;

  @override
  State<DaftarPenyakitPageView> createState() => _DaftarPenyakitPageViewState();
}

class _DaftarPenyakitPageViewState extends State<DaftarPenyakitPageView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this, initialIndex: widget.initialIndex);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Daftar Penyakit',
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: TabBar(
                      controller: tabController,
                      unselectedLabelColor: const Color(0xff6D6D6D),
                      indicator: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 2,
                            color: Constant.primaryColor1,
                          ),
                        ),
                      ),
                      labelColor: Constant.primaryColor1,
                      labelStyle: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                      tabs: const [
                        Tab(
                          text: 'Diare',
                        ),
                        Tab(
                          text: 'Asma',
                        ),
                        Tab(
                          text: 'Cacingan',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children:  [
                  const DiarePageView(),
                  AsmaPageView(),
                  const CacinganPageView(),
                ],
              ),
            ),
          ],
        ),
      ),
    
    );
  }
}
