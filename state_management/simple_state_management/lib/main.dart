import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_state_management/src/home.dart';
import 'package:simple_state_management/src/pages/simple_state_manage_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => const Home()),
        GetPage(name: "/simple", page: () => const SimpleStateManagePage()),
      ],
    );
  }
}
