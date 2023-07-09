import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constant.dart';
import '../../../controllers/auth_controller_controller.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: height * 0.1,
          ),
          Image.asset('assets/images/imageSplash.png'),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Pediatris',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Constant.primaryColor1,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: width,
            padding: const EdgeInsets.symmetric(horizontal: 70),
            child: Text(
              'Silahkan Login dengan akun google anda untuk melanjutkan',
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: const Color(0xff6C6C6C),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => const Center(
                    child: CircularProgressIndicator(
                      color: Constant.primaryColor2,
                      backgroundColor: Colors.blueGrey,
                    ),
                  ),
                );
                authC.login();
              },
              child: Container(
                width: width,
                height: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: Constant.gradientBtn),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/icons/google.svg'),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Login Dengan Google',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
