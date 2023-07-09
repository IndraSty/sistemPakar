import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_alert_dialog/models/alert_dialog_text.dart';
import 'package:smart_alert_dialog/smart_alert_dialog.dart';

import '../../../../constant.dart';
import '../../../../utils/dialog/alert_dialog_widget.dart';
import '../../../controllers/auth_controller_controller.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({Key? key}) : super(key: key);

  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PROFILE',
          style: GoogleFonts.poppins(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: Get.back,
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black87,
            size: 18,
          ),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Obx(
                () => Container(
                  height: 121,
                  width: 121,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 3),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(authC.user.value.img!),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Obx(
              () => ContainerItem(
                icon: Icons.person,
                text: authC.user.value.name!,
                width: Get.width,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(
              () => ContainerItem(
                icon: Icons.mark_email_read_outlined,
                text: authC.user.value.email!,
                width: Get.width,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ContainerItem(
              text: 'Edit Profile',
              icon: Icons.settings,
              width: Get.width,
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => SmartAlertDialog(
                    title: "Logout",
                    text: AlertDialogText(),
                    message: "Yakin ingin Logout?",
                    onConfirmPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => const Center(
                          child: CircularProgressIndicator(
                            color: Constant.primaryColor2,
                            backgroundColor: Colors.blueGrey,
                          ),
                        ),
                      );
                      Future.delayed(const Duration(seconds: 2), () {
                        Navigator.of(context).pop();
                        authC.logout();
                      });
                    },
                    onCancelPressed: () => {},
                  ),
                );
              },
              child: Container(
                height: 43,
                width: Get.width,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.redAccent),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.logout_rounded,
                      size: 16,
                      color: Colors.redAccent,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: Get.width * 0.75,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Logout',
                            style: GoogleFonts.poppins(
                                color: Colors.redAccent,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      backgroundColor: const Color(0xffFAFAFA),
    );
  }
}

class ContainerItem extends StatelessWidget {
  const ContainerItem({
    super.key,
    required this.width,
    required this.text,
    required this.icon,
  });

  final double width;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43,
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Colors.white),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: Constant.primaryColor1,
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            width: width * 0.75,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: GoogleFonts.poppins(
                      color: Constant.fontColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
