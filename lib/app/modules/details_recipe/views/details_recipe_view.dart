import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/details_recipe_controller.dart';

class DetailsRecipeView extends GetView<DetailsRecipeController> {

  final DetailsRecipeController detailsRecipeController = Get.put(DetailsRecipeController());
  @override
  Widget build(BuildContext context) {
    return

      Scaffold(
      body: Stack(
        children: [

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
              padding: EdgeInsets.only(top: Get.height * 0.15, left: Get.height * 0.02, right: Get.height * 0.02),
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
                                  child: Text(detailsRecipeController.hitsModel.recipe!.label!,
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
                                child: Text("See full recipe on:",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(detailsRecipeController.hitsModel.recipe!.source!,
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
                                            onTap: () async{
                                              print('tap');
                                              await detailsRecipeController.launchUrl(detailsRecipeController.hitsModel.recipe!.url!);
                                            },

                                            child: Icon(Icons.add_box, size: 20.0, color: Colors.black87,)),
                                      )),
                                  SizedBox(width: Get.width * 0.03,),
                                  Container(
                                      decoration: BoxDecoration(
                                        color: const Color(0xff7EEF03),
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                      child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: FaIcon(FontAwesomeIcons.share, size: 20.0, color: Colors.black87,)
                                      )),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Image.network(detailsRecipeController.hitsModel.recipe!.image!,
                            fit: BoxFit.cover,
                            height: Get.height * 0.25,
                            width: Get.width * 0.48),
                      ),

                    ],
                  ),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Health labels:",
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
                        itemCount: detailsRecipeController.hitsModel.recipe!.healthLabels!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: Get.width * 0.03, top: Get.height * 0.01, bottom: Get.height * 0.01),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Center(
                                  child: Text(detailsRecipeController.hitsModel.recipe!.healthLabels![index],
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
                      child: Text("Cuisine Type:",
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
                        itemCount: detailsRecipeController.hitsModel.recipe!.cautions!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: Get.width * 0.03, top: Get.height * 0.01, bottom: Get.height * 0.01),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Center(
                                  child: Text(detailsRecipeController.hitsModel.recipe!.cautions![index],
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
                      child: Text("Ingredients",
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
                        itemCount: detailsRecipeController.hitsModel.recipe!.ingredients!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: Get.width * 0.03, top: 8.0, bottom: 8.0),
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
                                child: Stack(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: Get.height * 0.03, left: Get.height * 0.02, right: Get.height * 0.02),
                                        child: Text(detailsRecipeController.hitsModel.recipe!.ingredients![index].text!,
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
                                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15.0), bottomRight: Radius.circular(15.0))
                                          ),
                                          child: Center(
                                            child: Text(detailsRecipeController.hitsModel.recipe!.ingredients![index].foodCategory!,
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
                                    ]

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
                      child: Text("Preparation",
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
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Nutrients",
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
                        itemCount: detailsRecipeController.hitsModel.recipe!.ingredients!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: Get.width * 0.03, top: 8.0, bottom: 8.0),
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
                                child: Stack(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: Get.height * 0.03, left: Get.height * 0.02, right: Get.height * 0.02),
                                        child: Text(detailsRecipeController.hitsModel.recipe!.ingredients![index].text!,
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
                                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15.0), bottomRight: Radius.circular(15.0))
                                          ),
                                          child: Center(
                                            child: Text(detailsRecipeController.hitsModel.recipe!.ingredients![index].foodCategory!,
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
                                    ]

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
                      child: Text("Tags",
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
                        itemCount: detailsRecipeController.hitsModel.recipe!.dietLabels!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: Get.width * 0.03, top: 8.0, bottom: 8.0),
                            child: Text(detailsRecipeController.hitsModel.recipe!.dietLabels![index],
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
                      child: Text("Nutrients",
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
                        itemCount: detailsRecipeController.hitsModel.recipe!.ingredients!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: Get.width * 0.03, top: 8.0, bottom: 8.0),
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
                                child: Stack(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: Get.height * 0.03, left: Get.height * 0.02, right: Get.height * 0.02),
                                        child: Text(detailsRecipeController.hitsModel.recipe!.ingredients![index].text!,
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
                                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15.0), bottomRight: Radius.circular(15.0))
                                          ),
                                          child: Center(
                                            child: Text(detailsRecipeController.hitsModel.recipe!.ingredients![index].foodCategory!,
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
                                    ]

                                ),
                              ),
                            ),
                          );
                        },
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
                        contentPadding:
                        const EdgeInsets.only(left: 24.0, bottom: 8.0, top: 6.0),
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
                  padding:
                  EdgeInsets.only(bottom: 8.0, left: 10.0, right: 10.0),
                  child: FaIcon(
                    FontAwesomeIcons.bars,
                    color: Colors.grey,
                    size: 20.0,
                  ),
                )
              ],
            ),
          ),
        ]
      ),
    );
  }
}
