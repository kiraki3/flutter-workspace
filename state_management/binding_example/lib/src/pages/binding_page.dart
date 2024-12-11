import 'package:binding_example/src/controller/count_controller_with_getx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BindingPage extends StatelessWidget {
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
              GetBuilder<CountControllerWithGetx>(builder: (_) {
                return Text(
                  _.count.toString(),
                  style: const TextStyle(fontSize: 40),
                );
              }),
              TextButton(
                  onPressed: () {
                    Get.find<CountControllerWithGetx>().increase();
                  },
                  child: const Text(
                    "+",
                    style: TextStyle(fontSize: 30),
                  )),
            ],
          ),
        ));
  }
}
