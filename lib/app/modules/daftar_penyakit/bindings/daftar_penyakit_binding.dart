import 'package:get/get.dart';

import '../controllers/daftar_penyakit_controller.dart';

class DaftarPenyakitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DaftarPenyakitController>(
      () => DaftarPenyakitController(),
    );
  }
}
