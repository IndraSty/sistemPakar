import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/cf_controller.dart';

class CfView extends GetView<CfController> {
  const CfView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CfView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CfView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
