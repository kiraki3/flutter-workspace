import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${Get.parameters['uid']}"),
            Text("${Get.parameters['name']} 님 안녕하세요"),
            Text("당신은 ${Get.parameters['age']} 세 입니다."),
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("Go Back"),
            ),
          ],
        ),
      ),
    );
  }
}
