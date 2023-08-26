import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/protein_controller.dart';

class ProteinView extends GetView<ProteinController> {
  const ProteinView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProteinView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProteinView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
