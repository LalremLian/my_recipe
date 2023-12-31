import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/details_recipe_controller.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';

class DetailsRecipeView extends GetView<DetailsRecipeController> {
  final DetailsRecipeController detailsRecipeController =
      Get.put(DetailsRecipeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
          top: Get.height * 0.042,
          right: 0,
          child: Image.asset(
            "assets/images/bg.png",
            height: Get.height * 0.3,
            width: Get.width * 0.45,
            fit: BoxFit.fill,
          ),
        ),
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                top: Get.height * 0.15,
                left: Get.height * 0.02,
                right: Get.height * 0.02),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: Get.width * 0.43,
                      height: Get.height * 0.25,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: InkWell(
                              onTap: () {
                                print('tap');
                              },
                              child: SizedBox(
                                width: Get.width * 0.4,
                                child: Text(
                                  detailsRecipeController
                                      .hitsModel.recipe!.label!,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "See full recipe on:",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              detailsRecipeController.hitsModel.recipe!.source!,
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w300,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Row(
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xff7EEF03),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: InkWell(
                                          onTap: () async {
                                            print('tap');
                                            await detailsRecipeController
                                                .launchUrl(
                                                    detailsRecipeController
                                                        .hitsModel
                                                        .recipe!
                                                        .url!);
                                          },
                                          child: Icon(
                                            Icons.add_box,
                                            size: 20.0,
                                            color: Colors.black87,
                                          )),
                                    )),
                                SizedBox(
                                  width: Get.width * 0.03,
                                ),
                                Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xff7EEF03),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: FaIcon(
                                          FontAwesomeIcons.share,
                                          size: 20.0,
                                          color: Colors.black87,
                                        ))),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Image.network(
                          detailsRecipeController.hitsModel.recipe!.image!,
                          fit: BoxFit.cover,
                          height: Get.height * 0.25,
                          width: Get.width * 0.48),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Health labels:",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    height: Get.height * 0.055,
                    width: Get.width,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: detailsRecipeController
                          .hitsModel.recipe!.healthLabels!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                              right: Get.width * 0.03,
                              top: Get.height * 0.01,
                              bottom: Get.height * 0.01),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Center(
                                child: Text(
                                  detailsRecipeController
                                      .hitsModel.recipe!.healthLabels![index],
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Cuisine Type:",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    height: Get.height * 0.055,
                    width: Get.width,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: detailsRecipeController
                          .hitsModel.recipe!.cautions!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                              right: Get.width * 0.03,
                              top: Get.height * 0.01,
                              bottom: Get.height * 0.01),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Center(
                                child: Text(
                                  detailsRecipeController
                                      .hitsModel.recipe!.cautions![index],
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Ingredients",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xffFEC915),
                        decorationThickness: 2.0,
                        fontSize: 20.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    height: Get.height * 0.18,
                    width: Get.width,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: detailsRecipeController
                          .hitsModel.recipe!.ingredients!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                              right: Get.width * 0.03, top: 8.0, bottom: 8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Container(
                              height: Get.height * 0.1,
                              width: Get.width * 0.33,
                              decoration: BoxDecoration(
                                color: Color(0xff7EEF03),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Stack(children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: Get.height * 0.03,
                                      left: Get.height * 0.02,
                                      right: Get.height * 0.02),
                                  child: Text(
                                    detailsRecipeController.hitsModel.recipe!
                                        .ingredients![index].text!,
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  child: Container(
                                    height: Get.height * 0.05,
                                    width: Get.width * 0.33,
                                    decoration: BoxDecoration(
                                        color: Color(0xffccf5a0),
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(15.0),
                                            bottomRight:
                                                Radius.circular(15.0))),
                                    child: Center(
                                      child: Text(
                                        detailsRecipeController
                                            .hitsModel
                                            .recipe!
                                            .ingredients![index]
                                            .foodCategory!,
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Preparation",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xffFEC915),
                        decorationThickness: 2.0,
                        fontSize: 20.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Instruction on ',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        detailsRecipeController.hitsModel.recipe!.source!,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black54,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Nutrients",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xffFEC915),
                        decorationThickness: 2.0,
                        fontSize: 20.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                      height: Get.height * 0.13,
                      width: Get.width,
                      child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xff7EEF03),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40),
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: Get.height * 0.03,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: Get.width * 0.3,
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 2,
                                              blurRadius: 7,
                                              offset: Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                            detailsRecipeController
                                                .hitsModel.recipe!.calories!
                                                .toString()
                                                .substring(0, 3),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: Get.height * 0.01),
                                        child: Text(
                                          'CAL/SERV',
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: Get.height * 0.08,
                                  width: Get.width * 0.003,
                                  color: Colors.black54,
                                ),
                                SizedBox(
                                  width: Get.width * 0.3,
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 2,
                                              blurRadius: 7,
                                              offset: Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                            "${detailsRecipeController.hitsModel.recipe!.totalDaily!.eNERCKCAL!.quantity.toString().substring(0, 2)}%",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: Get.height * 0.01),
                                        child: Text(
                                          'DAILY VALUE',
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: Get.height * 0.08,
                                  width: Get.width * 0.003,
                                  color: Colors.black54,
                                ),
                                SizedBox(
                                  width: Get.width * 0.3,
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 2,
                                              blurRadius: 7,
                                              offset: Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                            detailsRecipeController
                                                .hitsModel.recipe!.totalTime!
                                                .toString()
                                                .substring(0, 2),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: Get.height * 0.01),
                                        child: Text(
                                          'SERVINGS',
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ))),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Tags",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xffFEC915),
                        decorationThickness: 2.0,
                        fontSize: 20.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    height: Get.height * 0.04,
                    width: Get.width,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: detailsRecipeController
                          .hitsModel.recipe!.dietLabels!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                              right: Get.width * 0.03, top: 8.0, bottom: 8.0),
                          child: Text(
                            detailsRecipeController
                                .hitsModel.recipe!.dietLabels![index],
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.grey,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Nutrients",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xffFEC915),
                        decorationThickness: 2.0,
                        fontSize: 20.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    height: Get.height * 0.18,
                    width: Get.width,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: detailsRecipeController
                          .hitsModel.recipe!.ingredients!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                              right: Get.width * 0.03, top: 8.0, bottom: 8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Container(
                              height: Get.height * 0.1,
                              width: Get.width * 0.33,
                              decoration: BoxDecoration(
                                color: Color(0xff7EEF03),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Stack(children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: Get.height * 0.03,
                                      left: Get.height * 0.02,
                                      right: Get.height * 0.02),
                                  child: Text(
                                    detailsRecipeController.hitsModel.recipe!
                                        .ingredients![index].text!,
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  child: Container(
                                    height: Get.height * 0.05,
                                    width: Get.width * 0.33,
                                    decoration: BoxDecoration(
                                        color: Color(0xffccf5a0),
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(15.0),
                                            bottomRight:
                                                Radius.circular(15.0))),
                                    child: Center(
                                      child: Text(
                                        detailsRecipeController
                                            .hitsModel
                                            .recipe!
                                            .ingredients![index]
                                            .foodCategory!,
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.3,
                  child: DefaultTabController(
                    length: 4,
                    initialIndex: 0,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ButtonsTabBar(
                              onTap: (index) {
                                print(index);
                              },
                              radius: 30,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 20),

                              // borderWidth: 0.5,
                              borderColor: Colors.transparent,
                              // center: true,
                              decoration: const BoxDecoration(
                                color: Color(0xff7EEF03),
                              ),
                              // unselectedLabelStyle: TextStyle(color: Colors.black),
                              height: 56,
                              labelStyle: const TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                              tabs: const [
                                Tab(
                                  text: "Fat",
                                ),
                                Tab(
                                  text: "Carbs",
                                ),
                                Tab(
                                  text: "Protein",
                                ),
                                Tab(
                                  text: "Cholesterol",
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            physics: const NeverScrollableScrollPhysics(),
                            children: <Widget>[
                              NutrientCard(
                                detailsController: controller,
                                nutrient: "Fat",
                              ),
                              CarbsCard(detailsController: controller),
                              ProteinCard(
                                detailsController: controller,
                              ),
                              CholesterolCard(
                                detailsController: controller,
                              ),
                              // ProteinView(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 40.0, bottom: 0.0, left: 10.0),
          decoration: BoxDecoration(
            border: const Border(
              bottom: BorderSide(
                color: Colors.transparent,
                width: 1,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, 1),
              ),
            ],
            // gradient: const LinearGradient(
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,
            //   colors: [
            //     Colors.white,
            //     Color(0xffe1e0e0),
            //   ],
            // ),
          ),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xff7EEF03),
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: FaIcon(
                    FontAwesomeIcons.barsStaggered,
                    color: Colors.white,
                    size: 20.0,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 40,
                  margin: const EdgeInsets.only(left: 12.0, bottom: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: TextFormField(
                    textInputAction: TextInputAction.search,
                    // controller: controller.searchController,
                    decoration: InputDecoration(
                      hintText: "Search recipes",
                      contentPadding: const EdgeInsets.only(
                          left: 24.0, bottom: 8.0, top: 6.0),
                      border: InputBorder.none,
                      // suffixIcon: IconButton(
                      //   onPressed: homeController.searchController.clear,
                      //   icon: const Icon(Icons.clear),
                      // ),
                    ),
                    onFieldSubmitted: (value) {
                      // homeController.getAttendanceData(value);
                    },
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 8.0, left: 10.0, right: 10.0),
                child: FaIcon(
                  FontAwesomeIcons.bars,
                  color: Colors.grey,
                  size: 20.0,
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}

class NutrientCard extends StatelessWidget {
  String? nutrient;

  NutrientCard({super.key, this.nutrient, required this.detailsController});

  final DetailsRecipeController detailsController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0, bottom: 15.0),
      child: Container(
        height: 20,
        decoration: BoxDecoration(
          color: Color(0xff7EEF03),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40),
            bottomRight: Radius.circular(40),
            bottomLeft: Radius.circular(40),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                      width: Get.width * 0.43,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Fat ˅',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w500),
                        ),
                      )),
                  Column(
                    children: [
                      SizedBox(
                          width: Get.width * 0.3,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${detailsController.hitsModel.recipe!.calories!.toString().substring(0, 1)}g        ${detailsController.hitsModel.recipe!.totalWeight!.toString().substring(0, 1)}%",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w400),
                            ),
                          )),
                      SizedBox(
                        height: Get.height * 0.002,
                        child: Container(
                          height: Get.height * 0.01,
                          width: Get.width * 0.3,
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: Get.width * 0.5,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 60.0),
                      child: Text(
                        'Cholesterol',
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                    )),
                SizedBox(
                    width: Get.width * 0.1,
                    child: Text(
                      "${detailsController.hitsModel.recipe!.totalNutrients!.cHOLE!.quantity!.toString().substring(0, 1)}g",
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    )),
                SizedBox(
                    width: Get.width * 0.1,
                    child: Text(
                      "${detailsController.hitsModel.recipe!.totalDaily!.fIBTG!.quantity!.toString().substring(0, 1)}%",
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: Get.width * 0.5,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 60.0),
                      child: Text(
                        'Trones',
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                    )),
                SizedBox(
                    width: Get.width * 0.1,
                    child: Text(
                      "${detailsController.hitsModel.recipe!.totalNutrients!.tHIA!.quantity!.toString().substring(0, 1)}g",
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    )),
                SizedBox(
                    width: Get.width * 0.1,
                    child: Text(
                      "${detailsController.hitsModel.recipe!.totalDaily!.tHIA!.quantity!.toString().substring(0, 1)}%",
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: Get.width * 0.5,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 60.0),
                      child: Text(
                        'Monounsaturated',
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                    )),
                SizedBox(
                    width: Get.width * 0.1,
                    child: Text(
                      "${detailsController.hitsModel.recipe!.totalNutrients!.mG!.quantity!.toString().substring(0, 1)}g",
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    )),
                SizedBox(
                    width: Get.width * 0.1,
                    child: Text(
                      "${detailsController.hitsModel.recipe!.totalDaily!.cA!.quantity!.toString().substring(0, 1)}%",
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: Get.width * 0.5,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 60.0),
                      child: Text(
                        'Polyunsaturated',
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                    )),
                SizedBox(
                    width: Get.width * 0.1,
                    child: Text(
                      "${detailsController.hitsModel.recipe!.totalNutrients!.p!.quantity!.toString().substring(0, 1)}g",
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    )),
                SizedBox(
                    width: Get.width * 0.1,
                    child: Text(
                      "${detailsController.hitsModel.recipe!.totalDaily!.p!.quantity!.toString().substring(0, 1)}%",
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CarbsCard extends StatelessWidget {
  String? nutrient;

  CarbsCard({super.key, this.nutrient, required this.detailsController});

  final DetailsRecipeController detailsController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0, bottom: 15.0),
      child: Container(
        height: 20,
        decoration: BoxDecoration(
          color: Color(0xff7EEF03),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40),
            bottomRight: Radius.circular(40),
            bottomLeft: Radius.circular(40),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                      width: Get.width * 0.43,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Carbs ˅',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w500),
                        ),
                      )),
                  Column(
                    children: [
                      SizedBox(
                          width: Get.width * 0.3,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${detailsController.hitsModel.recipe!.calories!.toString().substring(0, 1)}g        ${detailsController.hitsModel.recipe!.totalWeight!.toString().substring(0, 1)}%",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w400),
                            ),
                          )),
                      SizedBox(
                        height: Get.height * 0.002,
                        child: Container(
                          height: Get.height * 0.01,
                          width: Get.width * 0.3,
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: Get.width * 0.5,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 60.0),
                      child: Text(
                        'Cholesterol',
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                    )),
                SizedBox(
                    width: Get.width * 0.1,
                    child: Text(
                      "${detailsController.hitsModel.recipe!.totalNutrients!.fAMS!.quantity!.toString().substring(0, 1)}g",
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    )),
                SizedBox(
                    width: Get.width * 0.1,
                    child: Text(
                      "${detailsController.hitsModel.recipe!.totalDaily!.fASAT!.quantity!.toString().substring(0, 1)}%",
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: Get.width * 0.5,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 60.0),
                      child: Text(
                        'Trones',
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                    )),
                SizedBox(
                    width: Get.width * 0.1,
                    child: Text(
                      "${detailsController.hitsModel.recipe!.totalNutrients!.fE!.quantity!.toString().substring(0, 1)}g",
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    )),
                SizedBox(
                    width: Get.width * 0.1,
                    child: Text(
                      "${detailsController.hitsModel.recipe!.totalDaily!.fOLDFE!.quantity!.toString().substring(0, 1)}%",
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: Get.width * 0.5,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 60.0),
                      child: Text(
                        'Monounsaturated',
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                    )),
                SizedBox(
                    width: Get.width * 0.1,
                    child: Text(
                      "${detailsController.hitsModel.recipe!.totalNutrients!.fIBTG!.quantity!.toString().substring(0, 1)}g",
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    )),
                SizedBox(
                    width: Get.width * 0.1,
                    child: Text(
                      "${detailsController.hitsModel.recipe!.totalDaily!.fE!.quantity!.toString().substring(0, 1)}%",
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: Get.width * 0.5,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 60.0),
                      child: Text(
                        'Polyunsaturated',
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                    )),
                SizedBox(
                    width: Get.width * 0.1,
                    child: Text(
                      "${detailsController.hitsModel.recipe!.totalNutrients!.fOLFD!.quantity!.toString().substring(0, 1)}g",
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    )),
                SizedBox(
                    width: Get.width * 0.1,
                    child: Text(
                      "${detailsController.hitsModel.recipe!.totalDaily!.fASAT!.quantity!.toString().substring(0, 1)}%",
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProteinCard extends StatelessWidget {
  String? nutrient;

  ProteinCard({super.key, this.nutrient, required this.detailsController});

  final DetailsRecipeController detailsController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0, bottom: 15.0),
      child: Container(
        height: 20,
        decoration: BoxDecoration(
          color: Color(0xff7EEF03),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40),
            bottomRight: Radius.circular(40),
            bottomLeft: Radius.circular(40),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                      width: Get.width * 0.43,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Protein ˅',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w500),
                        ),
                      )),
                  Column(
                    children: [
                      SizedBox(
                          width: Get.width * 0.3,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${detailsController.hitsModel.recipe!.calories!.toString().substring(0, 1)}g        ${detailsController.hitsModel.recipe!.totalWeight!.toString().substring(0, 1)}%",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w400),
                            ),
                          )),
                      SizedBox(
                        height: Get.height * 0.002,
                        child: Container(
                          height: Get.height * 0.01,
                          width: Get.width * 0.3,
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: Get.width * 0.5,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 60.0),
                      child: Text(
                        'Cholesterol',
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                    )),
                SizedBox(
                    width: Get.width * 0.1,
                    child: Text(
                      "${detailsController.hitsModel.recipe!.totalNutrients!.pROCNT!.quantity!.toString().substring(0, 1)}g",
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    )),
                SizedBox(
                    width: Get.width * 0.1,
                    child: Text(
                      "${detailsController.hitsModel.recipe!.totalDaily!.p!.quantity!.toString().substring(0, 1)}%",
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: Get.width * 0.5,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 60.0),
                      child: Text(
                        'Trones',
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                    )),
                SizedBox(
                    width: Get.width * 0.1,
                    child: Text(
                      "${detailsController.hitsModel.recipe!.totalNutrients!.pROCNT!.quantity!.toString().substring(0, 1)}g",
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    )),
                SizedBox(
                    width: Get.width * 0.1,
                    child: Text(
                      "${detailsController.hitsModel.recipe!.totalDaily!.p!.quantity!.toString().substring(0, 1)}%",
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: Get.width * 0.5,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 60.0),
                      child: Text(
                        'Monounsaturated',
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                    )),
                SizedBox(
                    width: Get.width * 0.1,
                    child: Text(
                      "${detailsController.hitsModel.recipe!.totalNutrients!.fIBTG!.quantity!.toString().substring(0, 1)}g",
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    )),
                SizedBox(
                    width: Get.width * 0.1,
                    child: Text(
                      "${detailsController.hitsModel.recipe!.totalDaily!.fE!.quantity!.toString().substring(0, 1)}%",
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: Get.width * 0.5,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 60.0),
                      child: Text(
                        'Polyunsaturated',
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                    )),
                SizedBox(
                    width: Get.width * 0.1,
                    child: Text(
                      "${detailsController.hitsModel.recipe!.totalNutrients!.pROCNT!.quantity!.toString().substring(0, 1)}g",
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    )),
                SizedBox(
                    width: Get.width * 0.1,
                    child: Text(
                      "${detailsController.hitsModel.recipe!.totalDaily!.fASAT!.quantity!.toString().substring(0, 1)}%",
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CholesterolCard extends StatelessWidget {
  String? nutrient;

  CholesterolCard({super.key, this.nutrient, required this.detailsController});

  final DetailsRecipeController detailsController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0, bottom: 15.0),
      child: Container(
        height: 20,
        decoration: BoxDecoration(
          color: Color(0xff7EEF03),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40),
            bottomRight: Radius.circular(40),
            bottomLeft: Radius.circular(40),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                      width: Get.width * 0.43,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Cholesterol ˅',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w500),
                        ),
                      )),
                  Column(
                    children: [
                      SizedBox(
                          width: Get.width * 0.3,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${detailsController.hitsModel.recipe!.calories!.toString().substring(0, 1)}g        ${detailsController.hitsModel.recipe!.totalWeight!.toString().substring(0, 1)}%",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w400),
                            ),
                          )),
                      SizedBox(
                        height: Get.height * 0.002,
                        child: Container(
                          height: Get.height * 0.01,
                          width: Get.width * 0.3,
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: Get.width * 0.5,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 60.0),
                      child: Text(
                        'Cholesterol',
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                    )),
                SizedBox(
                    width: Get.width * 0.1,
                    child: Text(
                      "${detailsController.hitsModel.recipe!.totalNutrients!.cA!.quantity!.toString().substring(0, 1)}g",
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    )),
                SizedBox(
                    width: Get.width * 0.1,
                    child: Text(
                      "${detailsController.hitsModel.recipe!.totalDaily!.cHOCDF!.quantity!.toString().substring(0, 1)}%",
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: Get.width * 0.5,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 60.0),
                      child: Text(
                        'Trones',
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                    )),
                SizedBox(
                    width: Get.width * 0.1,
                    child: Text(
                      "${detailsController.hitsModel.recipe!.totalNutrients!.pROCNT!.quantity!.toString().substring(0, 1)}g",
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    )),
                SizedBox(
                    width: Get.width * 0.1,
                    child: Text(
                      "${detailsController.hitsModel.recipe!.totalDaily!.cHOCDF!.quantity!.toString().substring(0, 1)}%",
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: Get.width * 0.5,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 60.0),
                      child: Text(
                        'Monounsaturated',
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                    )),
                SizedBox(
                    width: Get.width * 0.1,
                    child: Text(
                      "${detailsController.hitsModel.recipe!.totalNutrients!.fIBTG!.quantity!.toString().substring(0, 1)}g",
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    )),
                SizedBox(
                    width: Get.width * 0.1,
                    child: Text(
                      "${detailsController.hitsModel.recipe!.totalDaily!.cA!.quantity!.toString().substring(0, 1)}%",
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: Get.width * 0.5,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 60.0),
                      child: Text(
                        'Polyunsaturated',
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                    )),
                SizedBox(
                    width: Get.width * 0.1,
                    child: Text(
                      "${detailsController.hitsModel.recipe!.totalNutrients!.pROCNT!.quantity!.toString().substring(0, 1)}g",
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    )),
                SizedBox(
                    width: Get.width * 0.1,
                    child: Text(
                      "${detailsController.hitsModel.recipe!.totalDaily!.fASAT!.quantity!.toString().substring(0, 1)}%",
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
