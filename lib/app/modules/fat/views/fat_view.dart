import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/fat_controller.dart';

class FatView extends GetView<FatController> {
  const FatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FatView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'FatView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
