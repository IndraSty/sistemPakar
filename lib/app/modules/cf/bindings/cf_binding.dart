import 'package:get/get.dart';

import '../controllers/cf_controller.dart';

class CfBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CfController>(
      () => CfController(),
    );
  }
}
