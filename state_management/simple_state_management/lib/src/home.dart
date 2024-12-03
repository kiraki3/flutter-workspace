import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_state_management/src/pages/simple_state_manage_page.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Simple State Management"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  Get.to(const SimpleStateManagePage());
                },
                child: const Text("Click Me!"))
          ],
        ),
      ),
    );
  }
}
