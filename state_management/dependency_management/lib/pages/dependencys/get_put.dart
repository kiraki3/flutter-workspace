import 'package:dependency_management/controller/dependency_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetPut extends StatelessWidget {
  const GetPut({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: TextButton(
          onPressed: () {
            print(Get.find<DependencyController>().hashCode);
            Get.find<DependencyController>().increase();
          },
          child: const Text("Increase")),
    );
  }
}
