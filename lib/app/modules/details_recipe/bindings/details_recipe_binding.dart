import 'package:get/get.dart';

import '../controllers/details_recipe_controller.dart';

class DetailsRecipeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsRecipeController>(
      () => DetailsRecipeController(),
    );
  }
}
