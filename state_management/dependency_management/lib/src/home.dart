// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dependency_management/pages/dependencys/dependency_manage_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dependency Management"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  Get.to(const DependencyManagePage());
                },
                child: const Text("Dependency Management")),
          ],
        ),
      ),
    );
  }
}

class User {
  String name;
  int age;
  User({
    required this.name,
    required this.age,
  });
}
