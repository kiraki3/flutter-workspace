import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_route_manage/src/pages/normal/first.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Route Management"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (_) => const FirstPage(),
                //   ),
                // );
                Get.to(const FirstPage());
              },
              child: const Text("General Route"),
            ),
            TextButton(
              onPressed: () {
                // General route
                // Navigator.of(context).pushNamed("/first");

                // GetX
                Get.toNamed("/first");
              },
              child: const Text("Named Route"),
            )
          ],
        ),
      ),
    );
  }
}
