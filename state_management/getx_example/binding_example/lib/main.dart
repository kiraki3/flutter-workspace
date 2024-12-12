import 'package:binding_example/src/binding/binding.dart';
import 'package:binding_example/src/home.dart';
import 'package:binding_example/src/pages/binding_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        GetPage(
          name: "/binding",
          page: () => const BindingPage(),
          binding: Binding(),
        ),
      ],
    );
  }
}
