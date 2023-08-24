import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_recipe/app/data/models/Search.dart';
import 'package:my_recipe/app/data/provider/dio_request.dart';

class HomeController extends GetxController {
  // final localStorage = GetStorage();

  TextEditingController searchController = TextEditingController();

  RxBool isLoading = false.obs;

  Search attendanceModel = Search();
  Search searchModel = Search();

  DioRequest dioTest = DioRequest();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getAttendanceData("");
  }

  Future<void> getAttendanceData(String searchedRecipe) async {


    attendanceModel = Search();
    isLoading.value = true;
    if(searchController.text.isEmpty) {
      isLoading.value = false;
      return;
    }
    var response = await dioTest
        .requestApi(endPoint: '/search', method: 'GET', map: {'q': searchController.text});

    response.fold((left) {
      attendanceModel = Search.fromJson(left);
      isLoading.value = false;
    }, (right) {
      Get.snackbar(right, '', snackPosition: SnackPosition.BOTTOM);
      isLoading.value = false;
    });
  }

}
