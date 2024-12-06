import 'package:dependency_management/controller/dependency_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetLazyput extends StatelessWidget {
  const GetLazyput({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: TextButton(
          onPressed: () {
            Get.find<DependencyController>().increase();
          },
          child: const Text("Increase")),
    );
  }
}
