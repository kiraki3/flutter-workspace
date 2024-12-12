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
            ),
            TextButton(
              onPressed: () {
                Get.toNamed("/next", arguments: User(name: "츄츄", age: 123));
              },
              child: const Text("Argument Passing"),
            ),
            TextButton(
              onPressed: () {
                Get.toNamed("/user/347295794?name=갱갱&age=40");
              },
              child: const Text("Dynamic URL Route"),
            ),
          ],
        ),
      ),
    );
  }
}

class User {
  String name;
  int age;
  User({required this.name, required this.age});
}
