import 'package:dependency_management/controller/dependency_controller.dart';
import 'package:dependency_management/pages/dependencys/get_lazyput.dart';
import 'package:dependency_management/pages/dependencys/get_put.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DependencyManagePage extends StatelessWidget {
  const DependencyManagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dependency Management"),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                // binding 을 이용해 컨트롤러를 주입
                Get.to(const GetPut(), binding: BindingsBuilder(() {
                  Get.put(DependencyController());
                }));

                // 인스턴스화 => 메모리에 인스턴스가 쌓이면 느려지기 때문에 GetX 를 사용
              },
              child: const Text("Get.Put"),
            ),
            TextButton(
              onPressed: () {
                Get.to(const GetLazyput(), binding: BindingsBuilder(() {
                  Get.lazyPut<DependencyController>(
                      () => DependencyController());
                }));
              },
              child: const Text("Get.lazyPut"),
            ),
            TextButton(
              onPressed: () {
                Get.to(const GetPut(), binding: BindingsBuilder(() {
                  Get.putAsync<DependencyController>(() async {
                    await Future.delayed(const Duration(seconds: 5));
                    return DependencyController();
                  });
                }));
              },
              child: const Text("Get.Async"),
            ),
            TextButton(
              onPressed: () {
                Get.to(const GetPut(), binding: BindingsBuilder(() {
                  Get.create<DependencyController>(
                      () => DependencyController());
                }));
              },
              child: const Text("Get.create"),
            ),
          ],
        ),
      ),
    );
  }
}
