import 'package:get/get.dart';

import '../modules/details_recipe/bindings/details_recipe_binding.dart';
import '../modules/details_recipe/views/details_recipe_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DETAILS_RECIPE,
      page: () => DetailsRecipeView(),
      binding: DetailsRecipeBinding(),
    ),
  ];
}
