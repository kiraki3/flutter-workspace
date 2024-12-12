import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_route_manage/src/home.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Page"),
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
              onPressed: () {
                // 기존 방법
                // Navigator.of(context).pushAndRemoveUntil(
                //     MaterialPageRoute(builder: (_) => const Home()),
                //     (route) => false);

                // 전 페이지는 SecondPage
                //Get.to(const Home());

                // 모든 히스토리를 지우는 방법
                Get.offAll(const Home());
              },
              child: const Text("Home Page"),
            ),
          ],
        ),
      ),
    );
  }
}
