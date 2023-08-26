import 'package:get/get.dart';

import '../controllers/fat_controller.dart';

class FatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FatController>(
      () => FatController(),
    );
  }
}
