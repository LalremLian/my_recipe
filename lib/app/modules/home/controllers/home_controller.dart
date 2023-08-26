import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_recipe/app/data/models/Search.dart';
import 'package:my_recipe/app/data/provider/dio_request.dart';

class HomeController extends GetxController {
  // final localStorage = GetStorage();

  TextEditingController searchController = TextEditingController();

  RxBool isLoading = false.obs;

  Search recipeModel = Search();
  Search searchModel = Search();

  DioRequest dioTest = DioRequest();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getRecipes();
  }

  Future<void> getRecipes() async {


    recipeModel = Search();
    isLoading.value = true;
    if(searchController.text.isEmpty) {
      isLoading.value = false;
      return;
    }
    var response = await dioTest
        .requestApi(endPoint: '/api/recipes/v2', method: 'GET', map: {
      'type': 'public',
      'co2EmissionsClass': 'A+',
      'field[0]': 'uri',
      'beta': 'true',
      'random': 'true',
      'cuisineType[0]': '',
      'imageSize[0]': '',
      'mealType[0]': '',
      'health[0]': '',
      'diet[0]': '',
      'dishType[0]': searchController.text,
    });

    response.fold((left) {
      recipeModel = Search.fromJson(left);
      isLoading.value = false;
    }, (right) {
      Get.snackbar(right, '', snackPosition: SnackPosition.BOTTOM);
      isLoading.value = false;
    });
  }

}
