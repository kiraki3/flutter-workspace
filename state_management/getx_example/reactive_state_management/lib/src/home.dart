import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_state_management/src/pages/reactive_state_manage_page.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reactive State Management"),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
                onPressed: () {
                  Get.to(const ReactiveStateManagePage());
                },
                child: const Text("Reactive State Management"))
          ],
        ),
      ),
    );
  }
}
