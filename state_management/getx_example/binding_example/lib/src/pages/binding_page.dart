import 'package:binding_example/src/controller/count_controller_with_getx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BindingPage extends GetView<CountControllerWithGetx> {
  const BindingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Binding Example"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => Text(
                  controller.count.toString(),
                  style: const TextStyle(fontSize: 40),
                ),
              ),
              TextButton(
                onPressed: () {
                  controller.increase();
                },
                child: const Text(
                  "+",
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ],
          ),
        ));
  }
}
