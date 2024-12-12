import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_state_management/src/controller/count_controller_with_reactive.dart';

class ReactiveStateManagePage extends StatelessWidget {
  const ReactiveStateManagePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CountControllerWithReactive());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reactive State Management"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "GetX",
              style: TextStyle(fontSize: 30),
            ),
            /* controller에서 선언한 obs의 변화를 감지했을 때 바로 Obx로 날려주는 기능을 함.
                다만 obs로 선언했던 값을 Obx로 넣어주지 않으면 에러가 발생하므로 반드시 넣어주도록 주의할 것.
             */
            Obx(
              () => Text(
                "${Get.find<CountControllerWithReactive>().count.value}",
                style: const TextStyle(fontSize: 30),
              ),
            ),
            /*
            GetX(
              builder: (_) {
                  return Text(
                      "${Get.find<CountControllerWithReactive>().count.value}",
                        style: TextStyle(fontSize: 50));
                    },
                ),
             */
            TextButton(
              onPressed: () {
                Get.find<CountControllerWithReactive>().increase();
              },
              child: const Text(
                "+",
                style: TextStyle(fontSize: 30),
              ),
            ),
            TextButton(
              onPressed: () {
                Get.find<CountControllerWithReactive>().putNumber(5);
              },
              child: const Text(
                "5로 변경",
                style: TextStyle(fontSize: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
