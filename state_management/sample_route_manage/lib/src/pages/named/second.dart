import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondNamedPage extends StatelessWidget {
  const SecondNamedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Named Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                //Navigator.of(context).pop();
                Get.back();
              },
              child: const Text("Back Page"),
            ),
            TextButton(
              onPressed: () {},
              child: const Text("Home Page"),
            ),
          ],
        ),
      ),
    );
  }
}
