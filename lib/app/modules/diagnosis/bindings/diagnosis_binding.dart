import 'package:get/get.dart';

import '../controllers/diagnosis_controller.dart';

class DiagnosisBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DiagnosisController>(
      () => DiagnosisController(),
    );
  }
}
