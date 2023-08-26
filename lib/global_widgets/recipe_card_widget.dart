import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../app/modules/home/controllers/home_controller.dart';

class RecipeCard extends StatelessWidget {
  int index;
  RecipeCard({
    super.key,
    required this.homeController,
    required this.index,
  });

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Get.height * 0.5,
        width: Get.width * 0.5,
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(2.0),
          border: Border.all(
            color: Colors.grey,
            width: 0.2,
          ),
        ),
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                BorderRadius.circular(2.0),
              ),
              child: Column(
                children: [
                  Expanded(
                      child: Image.network(
                        homeController.recipeModel
                            .hits![index].recipe!.image!,
                        fit: BoxFit.cover,
                        height: Get.height * 0.4,
                        width: Get.width * 0.5,
                      )),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Padding(
                              padding:
                              const EdgeInsets.all(
                                  8.0),
                              child: Text(
                                homeController
                                    .recipeModel
                                    .hits![index]
                                    .recipe!
                                    .calories!
                                    .toString()
                                    .substring(0, 3),
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  fontWeight:
                                  FontWeight.bold,
                                  color:
                                  Color(0xff7EEF03),
                                ),
                              ),
                            ),
                            const Text("CAL")
                          ],
                        ),
                      ),
                      Container(
                        height: Get.height * 0.03,
                        width: Get.width * 0.001,
                        color: Colors.grey,
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Padding(
                              padding:
                              const EdgeInsets.all(
                                  8.0),
                              child: Text(
                                homeController
                                    .recipeModel
                                    .hits![index]
                                    .recipe!
                                    .totalWeight!
                                    .toString()
                                    .substring(0, 2),
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  fontWeight:
                                  FontWeight.bold,
                                  color:
                                  Color(0xff7EEF03),
                                ),
                              ),
                            ),
                            const Text("INGR")
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  homeController.recipeModel
                      .hits![index].recipe!.label!,
                  style: const TextStyle(
                    shadows: [
                      Shadow(
                        offset: Offset(2.0, 1.0),
                        blurRadius: 3.0,
                        color: Color.fromARGB(
                            255, 0, 0, 0),
                      ),
                    ],
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 40.0,
              left: 8.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  homeController.recipeModel
                      .hits![index].recipe!.source!,
                  style: const TextStyle(
                    shadows: [
                      Shadow(
                        offset: Offset(2.0, 1.0),
                        blurRadius: 3.0,
                        color: Color.fromARGB(
                            255, 0, 0, 0),
                      ),
                    ],
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}