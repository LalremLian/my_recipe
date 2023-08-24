import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

Widget ScaffoldWithBackground({
  required BuildContext context,
  required Widget child,
}) {
  double screenHeight = MediaQuery.of(context).size.height;
  double screenWidth = MediaQuery.of(context).size.width;

  return Scaffold(
    resizeToAvoidBottomInset: false,
    body: SafeArea(
      child: Stack(
        fit: StackFit.expand,
        // clipBehavior: Clip.antiAliasWithSaveLayer,
        children: [
          // Image.asset(
          //   "assets/images/app_background.jpeg",
          //   height: screenHeight,
          //   width: screenWidth,
          //   // fit: BoxFit.contain,
          // ),

          // Positioned(
          //   top: -100,
          //   left: -35,
          //   child: Image.asset(
          //     "assets/images/app_background/1.png",
          //     // height: screenHeight,
          //     width: screenWidth/1.4,
          //     fit: BoxFit.fill,
          //   ),
          // ),
          // Positioned(
          //   top: 30,
          //   right: -60,
          //   child: Image.asset(
          //     "assets/images/app_background/2.png",
          //     // height: screenHeight,
          //     width: screenWidth/2.3,
          //     fit: BoxFit.fill,
          //   ),
          // ),
          // Positioned(
          //   top: screenHeight/3.5,
          //   bottom: screenHeight/4,
          //   left: -130,
          //   child: Image.asset(
          //     "assets/images/app_background/3.png",
          //     // height: screenHeight,
          //     width: screenWidth/1.1,
          //     fit: BoxFit.fill,
          //   ),
          // ),
          // Positioned(
          //   bottom: -50,
          //   right: -60,
          //   child: Image.asset(
          //     "assets/images/app_background/4.png",
          //     // height: screenHeight/2.5,
          //     width: screenWidth/1.5,
          //     fit: BoxFit.fill,
          //   ),
          // ),

          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/images/bg.png",
              // height: screenHeight,
              // width: screenWidth/1.4,
              fit: BoxFit.fill,
            ),
          ),

          child,
        ],
      ),
    ),
  );
}

class ScaffoldLayer extends StatelessWidget {
  final Widget widget;
  // widget can be Scaffold, SafeArea, Container, Row, Column, etc.

  const ScaffoldLayer({
    Key? key,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: 0,
              right: 0,
              bottom: 0,
              left: 0,
              child:
              // SvgPicture.asset(
              //   "assets/images/app_background/farm-land.svg",
              //   // height: screenHeight,
              //   // width: screenWidth/1.4,
              //   fit: BoxFit.fill,
              // ),
              ///---------------------------------------------------------------For App Background Image
              SizedBox(
                width: Get.width * 0.5,
                height: Get.height * 1.5,
                child: Image.asset(
                  "assets/images/bg.png",
                  // height: screenHeight,
                  // width: screenWidth,
                  fit: BoxFit.fill,
                ),
              ),
              // Image.asset(
              //   "assets/images/app_background/login_bg.jpg",
              //   // height: screenHeight,
              //   // width: screenWidth/1.4,
              //   // fit: BoxFit.fill,
              // ),
            ),
            widget,
          ],
        ),
      ),
    );
  }
}
