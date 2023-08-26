import 'package:get/get.dart';

import '../controllers/protein_controller.dart';

class ProteinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProteinController>(
      () => ProteinController(),
    );
  }
}
